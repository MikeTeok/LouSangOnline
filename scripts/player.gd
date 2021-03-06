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
var prev_rotation_degree = 0
var current_rotation_degree = 0

const RADIUS = 5

func _ready():
	set_physics_process(false)
	set_process_input(false)
	if is_network_master():
		name_label.text = nickname
	animation.play("idle")

func _physics_process(delta):
	if current_rotation_degree != prev_rotation_degree:
		prev_rotation_degree = current_rotation_degree
		set_rotation_degrees(Vector3(0,current_rotation_degree,0))

	if Global.game_state == "WAITING":
		return
		
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

func update_index(index):
	current_rotation_degree = Global.ROTATE_TABLE[index] 
	
	if is_network_master():
		camera.set_rotation_degrees(Vector3(-90,0,Global.ROTATE_TABLE[index]))
	if Global.game_state == "WAITING":
		var spawn_point = polar2cartesian(2, deg2rad(-1*current_rotation_degree)).rotated(deg2rad(90))
		set_translation(Vector3(spawn_point.x,0,spawn_point.y))

puppet func update_name(newname):
	if not get_tree().is_network_server():
		nickname = newname
		name_label.text = nickname

func _input(event):
	if not is_network_master() or Global.game_state == "WAITING":
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
