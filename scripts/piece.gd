extends RigidBody

onready var holding = false
onready var holding_offset = 0
onready var throwing = false
onready var hold_area = null
onready var _area = $Area


func _ready():
	_area.global_transform.origin = global_transform.origin

func _process(delta):
	if holding:
		#this is prevent when u holding too long, gravity force stack and unable to throw
		gravity_scale = 0 
		global_transform.origin = hold_area.global_transform.origin - holding_offset
	elif throwing:
		gravity_scale = 1
		throwing = false

func _on_Area_area_entered(area):
	holding = true
	holding_offset = area.global_transform.origin - global_transform.origin
	hold_area = area


func _on_Area_area_exited(area):
	holding = false
	throwing = true
	if area.get_parent().get_parent().current_state == "release":
		apply_central_impulse(Vector3(0,10,0))
