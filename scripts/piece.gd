extends RigidBody

onready var holding = false
onready var throwing = false
onready var hold_area = null
onready var area = $Area


func _ready():
	#i think this is not needed but when delete this, area cannot detect. 
	area.global_transform.origin = global_transform.origin

func _process(delta):
	if holding:
		#this is prevent when u holding too long, gravity force stack and unable to throw
		gravity_scale = 0 
		global_transform.origin = hold_area.global_transform.origin
	elif throwing:
		gravity_scale = 1
		throwing = false
		print("throwing")
		apply_central_impulse(Vector3(0,5,0))

func _on_Area_area_entered(area):
	print("area entered")
	holding = true
	hold_area = area


func _on_Area_area_exited(area):
	print("area exited")
	holding = false
	throwing = true
