extends KinematicBody


var puppet_position = Vector2.ZERO
onready var tween = $Tween
onready var timer = $NetworkTickRate

onready var camera = $Camera
var mouseDelta : Vector2 = Vector2()
var minLookAngle : float = -45.0
var maxLookAngle : float = 45.0
var lookSensitivity : float = 0.5

func _physics_process(delta):
	if is_network_master():
		pass

func _process (delta):
	# rotate camera along X axis
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * lookSensitivity * delta
	# clamp the vertical camera rotation
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
	# rotate player along Y axis
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * lookSensitivity * delta
	# reset the mouse delta vector
	mouseDelta = Vector2()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

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
