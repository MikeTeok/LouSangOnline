extends KinematicBody


var puppet_position = Vector2.ZERO
onready var tween = $Tween
onready var timer = $NetworkTickRate

func _physics_process(delta):
	if is_network_master():
		pass

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
