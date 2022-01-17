extends Spatial

onready var holding = false
onready var hold_area = null
onready var body = $SoftBody


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	if holding:
		body.set_point_pinned(0, true, hold_area.get_path())
		#global_transform.origin = hold_area.global_transform.origin

func _on_Area_area_entered(area):
	print("area entered")
	holding = true
	hold_area = area


func _on_Area_area_exited(area):
	holding = false
