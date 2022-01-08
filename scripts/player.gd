extends KinematicBody2D


var puppet_position = Vector2.ZERO
onready var tween = $Tween
onready var timer = $NetworkTickRate

func _physics_process(delta):
	if is_network_master():
		global_position = get_global_mouse_position()
	else:
		pass

puppet func update_state(p_position):
	puppet_position = p_position
	
	tween.interpolate_property(self, "global_position", global_position, p_position, 0.1)
	tween.start()

func _on_NetworkTickRate_timeout():
	if is_network_master():
		rpc_unreliable("update_state", global_position)
	else:
		timer.stop()
