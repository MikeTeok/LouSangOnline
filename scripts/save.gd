extends Node

const SAVEFILE = "user://save.json"

var save_data = {}

func _ready():
	save_data = get_data()
	
func get_data():
	var save_file = File.new()
	if not save_file.file_exists(SAVEFILE):
		save_data = {"Player_name": "noname"}
		save_game()
	save_file.open(SAVEFILE, File.READ)
	var data = parse_json(save_file.get_as_text())
	return data
	
func save_game():
	var save_file = File.new()
	save_file.open(SAVEFILE, File.WRITE)
	save_file.store_line(to_json(save_data))
