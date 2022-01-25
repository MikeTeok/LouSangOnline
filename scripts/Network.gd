extends Node

const DEFAULT_PORT = 28960
const MAX_CLIENT = 6
#var IP_ADDR = "35.230.124.84"
var IP_ADDR = "127.0.0.1"
var server = null
var client = null

var local_player_id = 0
sync var players = {}
sync var player_data = {}
sync var game_data = {}

func _ready():
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	get_tree().connect("connection_failed", self, "_connection_failed")
	get_tree().connect("network_peer_connected", self, "_player_connected")
	
func create_server():
	print("Creating server")
	
	server = NetworkedMultiplayerENet.new()
	server.create_server(DEFAULT_PORT, MAX_CLIENT)
	get_tree().set_network_peer(server)
	print("Server started")
	
func join_server():
	print("Joining server")
	
	client = NetworkedMultiplayerENet.new()
	client.create_client(IP_ADDR, DEFAULT_PORT)
	get_tree().set_network_peer(client)
	
func _connected_to_server():
	print("Successfully connected to the server")
	if Global.host:
		Network.game_data["host"] = Global.nickname
		rpc_id(1, "send_player_info", "host", Global.nickname)
	register_player()
	rpc_id(1, "send_player_info", local_player_id, player_data)

func _server_disconnected():
	print("Disconnected from the server")
	
func _connection_failed():
	print("Connection to server failed")
	
	reset_network_connection()

func _player_connected(id):
	print("Player connected: " + str(id))
	
func reset_network_connection():
	if get_tree().has_network_peer():
		get_tree().network_peer = null

func register_player():
	local_player_id = get_tree().get_network_unique_id()
	self.player_data["nickname"] = Global.nickname
	self.players[local_player_id] = player_data

sync func update_players_data():
	for id in players:
		var player_name = players[id]["nickname"]
		var player_node = get_node("/root/Main").get_node(str(id))
		player_node.update_name(player_name)
		player_node.update_index(players[id]["index"])
