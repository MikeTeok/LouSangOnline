extends Control

onready var hostLabel = $CenterContainer/VBoxContainer/Host_label
onready var startButton = $CenterContainer/VBoxContainer/Start_button
onready var playerList = $CenterContainer/VBoxContainer/ItemList

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

func refresh_waiting_room(players):
	playerList.clear()
	for id in players:
		var player_name = players[id]["nickname"]
		playerList.add_item(player_name, null, false)
	
