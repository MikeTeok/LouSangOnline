extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var myname = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("toggle_network_setup", self, "_toggle_network_setup")

func _on_ip_address_text_changed(new_text):
	myname = new_text


func _on_Host_button_pressed():
	Network.create_server()
	hide()
	
	Global.emit_signal("instance_player", get_tree().get_network_unique_id(), myname)

func _on_Join_button_pressed():
	Network.join_server()
	hide()
	
	Global.emit_signal("instance_player", get_tree().get_network_unique_id(), myname)

func _toggle_network_setup(visible_toggle):
	visible = visible_toggle
