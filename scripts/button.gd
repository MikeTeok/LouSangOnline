extends Control

export(Texture) var normal_texture
export(Texture) var hover_texture
export var disabled = false setget set_disable

onready var normal_button = $normal
onready var hover_button = $hover
onready var tween = $Tween
onready var sound_effect = $sound

signal pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	normal_button.texture = normal_texture
	hover_button.texture = hover_texture

	if disabled:
		normal_button.modulate = Color(0.18,0.23,0.59,0.8)
		hover_button.modulate = Color(1,1,1,0)
	else:
		normal_button.modulate = Color(1,1,1,1)
		hover_button.modulate = Color(1,1,1,0)

func set_disable(new_value):
	disabled = new_value
	
	if normal_button == null:
		return
	
	if disabled:
		normal_button.modulate = Color(0.18,0.23,0.59,0.8)
		hover_button.modulate = Color(1,1,1,0)
	else:
		normal_button.modulate = Color(1,1,1,1)
		hover_button.modulate = Color(1,1,1,0)

func active_hover():
	tween.interpolate_property(normal_button, "modulate", normal_button.modulate, Color(1,1,1,0), 0.3, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "modulate", hover_button.modulate, Color(1,1,1,1), 0.3, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "rect_scale", hover_button.rect_scale, Vector2(1,1), 0.1, 0,Tween.EASE_IN_OUT)
	tween.start()

func active_normal():
	tween.interpolate_property(normal_button, "modulate", normal_button.modulate, Color(1,1,1,1), 0.3, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "modulate", hover_button.modulate, Color(1,1,1,0), 0.3, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "rect_scale", hover_button.rect_scale, Vector2(1,1), 0.1, 0,Tween.EASE_IN_OUT)
	tween.start()

func active_clicked():
	tween.interpolate_property(normal_button, "modulate", normal_button.modulate, Color(1,1,1,0), 0.1, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "modulate", hover_button.modulate, Color(1,1,1,1), 0.1, 0,Tween.EASE_IN_OUT)
	tween.interpolate_property(hover_button, "rect_scale", hover_button.rect_scale, Vector2(0.9,0.9), 0.1, 0,Tween.EASE_IN_OUT)
	tween.start()

func _on_button_mouse_entered():
	if disabled:
		return
	active_hover()
	sound_effect.stream_paused = false
	sound_effect.play(1.5)

func _on_button_mouse_exited():
	if disabled:
		return
	active_normal()
	sound_effect.stream_paused = true


func _on_button_gui_input(event):
	if disabled: 
		return
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			active_clicked()
			emit_signal("pressed")
		elif event.button_index == BUTTON_LEFT and not event.pressed:
			active_hover()


func _on_sound_finished():
	sound_effect.stream_paused = true
