extends KinematicBody


var puppet_position = Vector3.ZERO
var nickname = ""
onready var tween = $Tween
onready var animation = $chopstick/AnimationPlayer
onready var name_label = $NameLabel/Viewport/Label

onready var current_state = "idle"

onready var camera 
var ray_origin = Vector3()
var ray_end = Vector3()

const ROTATE_TABLE = [0,180,90,270,45,225,135,315]
const RADIUS = 5

func _ready():
	set_physics_process(false)
	set_process_input(false)
	if is_network_master():
		name_label.text = nickname
	animation.play("idle")

func _physics_process(delta):
	if is_network_master():
		rpc_unreliable("update_position", global_transform.origin)
	else:
		tween.interpolate_property(self, "global_transform", global_transform, Transform(global_transform.basis, puppet_position), 0.1)
		tween.start()
	
func _move():
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 1000
	var intersection = space_state.intersect_ray(ray_origin, ray_end, [self], 0x1)
	
	if not intersection.empty():
		var pos = intersection.position
		global_transform.origin = Vector3(pos.x, pos.y, pos.z)

remotesync func update_state(state):
	current_state = state
	animation.play(state)

puppet func update_position(p_position):
	puppet_position = p_position

puppet func update_index(index):
	var spawn_point = polar2cartesian(2, deg2rad(ROTATE_TABLE[index])).rotated(deg2rad(90))
	set_translation(Vector3(spawn_point.x,0,spawn_point.y))
	set_rotation_degrees(Vector3(0,ROTATE_TABLE[index],0))

puppet func update_name(newname):
	if not get_tree().is_network_server():
		nickname = newname
		name_label.text = nickname

func _input(event):
	if not is_network_master():
		return 
	
	var state = "idle"

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			state = "kiap"
		elif event.button_index == BUTTON_LEFT and not event.pressed:
			state = "release"
		
		rpc("update_state", state)
	
	if event is InputEventMouseMotion:
		_move()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "release":
		current_state = "idle"
		animation.play("idle")
