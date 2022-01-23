extends Control

var nickname = ""

signal host_game
signal join_game

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
	emit_signal("host_game")
	
func _on_Join_button_pressed():
	if nickname == "":
		$VBoxContainer/name.modulate = Color("ff0000")
		return
	Global.nickname = nickname
	Network.join_server()
	hide()
	emit_signal("join_game")
	
func _toggle_network_setup(visible_toggle):
	visible = visible_toggle
