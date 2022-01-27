extends Control

onready var startButton = $Start_button
onready var playerList = $ItemList

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.disabled = !Global.host
	refresh_waiting_room(Network.players)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Start_button_pressed():
	emit_signal("start_game")

func refresh_waiting_room(players):
	playerList.clear()
	for id in players:
		var player_name = players[id]["nickname"]
		if Network.game_data.has("host"):
			if player_name == Network.game_data["host"]:
				player_name = "★ " + player_name
		playerList.add_item(player_name, null, false)
	
