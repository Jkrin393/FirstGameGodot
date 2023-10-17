extends Label

# on entering the scene
func _ready():
	pass
	
func _process(delta):
	text ="HP: " + str(Game.playerHP)
