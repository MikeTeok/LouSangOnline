extends Skeleton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var bones = []
	
	for i in range(get_bone_count()):
		if 'one_piece' in get_bone_name(i):
			bones.append(get_bone_name(i))
	
	physical_bones_start_simulation(bones)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
