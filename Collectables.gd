extends Node2D


var Cherry = preload("res://Collectables/cherry.tscn")

# spawn in cherries on timer wait time
func _on_timer_timeout():
	var cherry_temp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var rand_int = rng.randi_range(62, 500)
	cherry_temp.position = Vector2(rand_int,320)
	add_child(cherry_temp)
