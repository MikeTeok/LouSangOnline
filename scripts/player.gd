extends KinematicBody


var puppet_position = Vector2.ZERO
var myname = ""
onready var tween = $Tween
onready var timer = $NetworkTickRate
onready var animation = $chopstick/AnimationPlayer
onready var name_label = $NameLabel/Viewport/Label

onready var current_state = "idle"

onready var camera 
var ray_origin = Vector3()
var ray_end = Vector3()

func _ready():
	if is_network_master():
		name_label.text = myname
		#rpc("update_name", myname)
	animation.play("idle")

func _physics_process(delta):
	if is_network_master():
		pass

func _process(delta):
	pass
	
func _move():
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 1000
	var intersection = space_state.intersect_ray(ray_origin, ray_end, [self], 0x1)
	
	if not intersection.empty():
		var pos = intersection.position
		global_transform.origin = Vector3(pos.x, pos.y, pos.z)

puppet func update_state(p_position):
	puppet_position = p_position
	
	if not get_tree().is_network_server():
		tween.interpolate_property(self, "global_transform", global_transform, Transform(global_transform.basis, p_position), 0.1)
		tween.start()

puppet func update_name(newname):
	if not get_tree().is_network_server():
		myname = newname
		name_label.text = myname

func _on_NetworkTickRate_timeout():
	if is_network_master():
		pass
		#rpc_unreliable("update_state", global_position)
	else:
		timer.stop()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			current_state = "kiap"
			animation.play("kiap")
		elif event.button_index == BUTTON_LEFT and not event.pressed:
			current_state = "release"
			animation.play("release")
	
	if event is InputEventMouseMotion:
		_move()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "release":
		current_state = "idle"
		animation.play("idle")
