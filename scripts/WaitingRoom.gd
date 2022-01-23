extends Control


onready var hostLabel = $VBoxContainer/Host_label
onready var startButton = $VBoxContainer/Start_button


# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.disabled = !Global.host

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Network.game_data.has("host") and hostLabel.text == "Host: ":
		hostLabel.text += Network.game_data["host"]

func _on_Start_button_pressed():
	rpc_id(1, "start_game")

sync func start_game_client():
	for id in Network.players:
		var player_name = Network.players[id]["nickname"]
		var player_node = get_node("/root/Game").get_node(str(id))
		player_node.set_physics_process(true)
		player_node.set_process_input(true)
	
	queue_free()
