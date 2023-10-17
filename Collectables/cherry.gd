extends Area2D


	# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if body.name == "Player":
		Game.Cherry +=1
		var tween1 = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		tween1.tween_property(self,"position", self.position - Vector2(0,50), 1)
		tween2.tween_property(self, "modulate:a",0,3)
		tween1.tween_callback(queue_free)
		

