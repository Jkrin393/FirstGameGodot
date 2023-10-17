extends Node


# Called when the node enters the scene tree for the first time.
const SAVE_PATH = "res://savegame.bin" # should use "users" instead of res

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	#make a dictionary of save file to save it
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"Gold": Game.Gold,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)	
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string((file.get_line()))
			Game.playerHP = current_line["playerHP"]
			Game.Gold = current_line["Gold"]
	
