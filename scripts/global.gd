extends Node

signal instance_player(id)
signal toggle_network_setup(toggle)

var nickname = ""
var host = false
var ROTATE_TABLE = [0]
var game_state = "WAITING"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calculate_rotate_table(total_player):
	if total_player == 0:
		return
	ROTATE_TABLE = []
	var single_degree = 360.0/total_player
	for index in total_player:
		ROTATE_TABLE.append(single_degree*index)
