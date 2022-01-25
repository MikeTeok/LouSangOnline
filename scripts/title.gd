extends Control


onready var title = $AnimatedSprite
onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	title.frame = 0
	title.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	title.frame = 0
	title.play("default")
