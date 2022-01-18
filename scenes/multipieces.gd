extends Spatial

export(Color) var piece_color


# Called when the node enters the scene tree for the first time.
func _ready():
	if piece_color != null:
		for child in get_children():
			var material = SpatialMaterial.new()
			material.albedo_color = piece_color
			child.get_node("MeshInstance").set_surface_material(0, material)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
