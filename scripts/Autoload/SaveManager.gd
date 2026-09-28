extends Node

const SAVE_PATH := "user://savegame.save"


func _ready() -> void:
	SaveManager.load_game_data()
	var timer = Timer.new()
	timer.wait_time = 15
	timer.autostart = true
	timer.timeout.connect(save_game_data)
	add_child(timer)


func save_game_data():
	var save_file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var saved_data: Dictionary = {
		"stone_currency": GameManager.ores["stone"]["currency"],
		"gold_currency": GameManager.ores["gold"]["currency"],
		"diamond_currency": GameManager.ores["diamond"]["currency"],
		"uranium_currency": GameManager.ores["uranium"]["currency"],
		"depth_reached": GameManager.current_depth,
	}
	# change the data into a string.
	var json_string = JSON.stringify(saved_data)
	# Store the save dictionary as a new line in the save file.
	save_file.store_line(json_string)


func load_game_data() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var data = JSON.parse_string(FileAccess.get_file_as_string(SAVE_PATH))
	if data == null:
		push_error("Corrupted file")
		return
	for ore in GameManager.ores:
		GameManager.ores[ore]["currency"] = int(data.get(ore + "_currency", 0))
	GameManager.current_depth = int(data.get("depth_reached", 0))
