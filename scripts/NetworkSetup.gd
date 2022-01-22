extends Control

var waiting_room = preload("res://scenes/WaitingRoom.tscn")
var nickname = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("toggle_network_setup", self, "_toggle_network_setup")

func _on_ip_address_text_changed(new_text):
	nickname = new_text.strip_edges(true, true)


func _on_Host_button_pressed():
	if nickname == "":
		$VBoxContainer/name.modulate = Color("ff0000")
		return
	Global.nickname = nickname
	Global.host = true
	Network.join_server()
	hide()
	_join_waiting_room()
	Global.emit_signal("instance_player", get_tree().get_network_unique_id())

func _on_Join_button_pressed():
	if nickname == "":
		$VBoxContainer/name.modulate = Color("ff0000")
		return
	Global.nickname = nickname
	Network.join_server()
	hide()
	_join_waiting_room()
	Global.emit_signal("instance_player", get_tree().get_network_unique_id())

func _toggle_network_setup(visible_toggle):
	visible = visible_toggle

func _join_waiting_room():
	var waiting_room_instance = waiting_room.instance()
	get_parent().add_child(waiting_room_instance)
