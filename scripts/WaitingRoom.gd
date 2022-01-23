extends Control

onready var hostLabel = $VBoxContainer/Host_label
onready var startButton = $VBoxContainer/Start_button

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.disabled = !Global.host

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Network.game_data.has("host") and hostLabel.text == "Host: ":
		hostLabel.text += Network.game_data["host"]

func _on_Start_button_pressed():
	emit_signal("start_game")
