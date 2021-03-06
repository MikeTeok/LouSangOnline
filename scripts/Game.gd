extends Spatial

var player = preload("res://scenes/player.tscn")
onready var fps_text = $fps

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	Global.connect("instance_player", self, "_instance_player")
	
	if get_tree().network_peer != null:
		Global.emit_signal("toggle_network_setup", false)

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
	
func _player_connected(id):
	print("Player " + str(id) + " has connected")
	
	_instance_player(id)

func _player_disconnected(id):
	print("Player " + str(id) + " has disconnected")
	
	if has_node(str(id)):
		get_node(str(id)).queue_free()
