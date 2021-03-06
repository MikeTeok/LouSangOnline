extends Spatial

var player = preload("res://scenes/player.tscn")
var game = preload("res://scenes/Game.tscn")
var background = preload("res://scenes/background.tscn")
var title = preload("res://scenes/title.tscn")
var waiting_room = preload("res://scenes/WaitingRoom.tscn")

onready var fps_text = $fps
onready var game_instance
var waiting_room_instance = null
onready var endgame_button = $EndGame_button
onready var background_instance = $background
onready var title_instance = $title

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	
	Global.connect("instance_player", self, "_instance_player")
	
	if get_tree().network_peer != null:
		Global.emit_signal("toggle_network_setup", false)
	
	endgame_button.hide()

func _process(delta):
	var text = ""
	text += "fps: " + str(Performance.get_monitor(Performance.TIME_FPS))
	fps_text.text = text

func _instance_player(id):
	if id != 1:
		var player_instance = player.instance()
		player_instance.set_network_master(id)
		player_instance.name = str(id)
		player_instance.nickname = Global.nickname
		player_instance.camera = $Camera
		add_child(player_instance)
		player_instance.global_transform.origin = Vector3(0, 0, 0)
		return player_instance
	
func _player_connected(id):
	print("Player " + str(id) + " has connected")
	
	var player_node = _instance_player(id)
	if player_node != null:
		player_node.visible = false
		player_node.set_physics_process(false)
		player_node.set_process_input(false)

func _player_disconnected(id):
	print("Player " + str(id) + " has disconnected")
	
	if has_node(str(id)):
		get_node(str(id)).queue_free()

func _connected_to_server():
	Global.emit_signal("instance_player", get_tree().get_network_unique_id())
	_join_waiting_room()

func _join_waiting_room():
	print("_join_waiting_room")
	get_node(str(get_tree().get_network_unique_id())).set_physics_process(false)
	get_node(str(get_tree().get_network_unique_id())).set_process_input(false)
	waiting_room_instance = waiting_room.instance()
	add_child(waiting_room_instance)
	waiting_room_instance.connect("start_game", self, "_start_game")
	game_instance = game.instance()
	add_child(game_instance)

func _start_game():
	rpc_id(1, "start_game")

sync func start_game_client():
	Global.game_state = "PLAYING"
	for id in Network.players:
		var player_name = Network.players[id]["nickname"]
		var player_node = get_node("/root/Main").get_node(str(id))
		player_node.visible = true
		player_node.set_physics_process(true)
		player_node.set_process_input(true)
	
	waiting_room_instance.queue_free()
	background_instance.queue_free()
	title_instance.queue_free()
	var id = get_tree().get_network_unique_id()
	print(Network.players)
	print(Network.game_data)
	if id == Network.game_data["host"]:
		endgame_button.show()

sync func end_game_client():
	Global.game_state = "WAITING"
	if get_node_or_null("/root/Main/WaitingRoom") == null:
		endgame_button.hide()
		background_instance = background.instance()
		add_child(background_instance)
		title_instance = title.instance()
		add_child(title_instance)
		game_instance.queue_free()
		_join_waiting_room()

func _on_EndGame_button_pressed():
	rpc_id(1, "end_game")
