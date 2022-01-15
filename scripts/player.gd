extends KinematicBody


var puppet_position = Vector2.ZERO
onready var tween = $Tween
onready var timer = $NetworkTickRate

onready var camera 
var ray_origin = Vector3()
var ray_end = Vector3()

func _ready():
	pass

func _physics_process(delta):
	if is_network_master():
		pass

func _process (delta):
	var space_state = get_world().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	
	ray_origin = camera.project_ray_origin(mouse_position)
	ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 1000
	var intersection = space_state.intersect_ray(ray_origin, ray_end)
	
	if not intersection.empty():
		var pos = intersection.position
		global_transform.origin = Vector3(pos.x, translation.y, pos.z)

puppet func update_state(p_position):
	puppet_position = p_position
	
	if not get_tree().is_network_server():
		tween.interpolate_property(self, "global_transform", global_transform, Transform(global_transform.basis, p_position), 0.1)
		tween.start()

func _on_NetworkTickRate_timeout():
	if is_network_master():
		pass
		#rpc_unreliable("update_state", global_position)
	else:
		timer.stop()
