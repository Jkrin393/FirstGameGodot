extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var SPEED = 50

func _ready():
	get_node("AnimatedSprite2D").play("idle")

func _physics_process(delta):
	#Frog Gravity
	velocity.y += gravity * delta
	if (chase == true):
		if(get_node("AnimatedSprite2D").animation != "death"):
			get_node("AnimatedSprite2D").play("jump")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if (direction.x > 0):
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if(get_node("AnimatedSprite2D").animation != "death"):
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
		
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if (body.name == "Player"):
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()


func _on_player_collision_body_entered(body):
	if (body.name == "Player"):
		Game.playerHP -= 10
		death()


func death():
	chase = false
	Utils.saveGame()
	Game.Gold +=5
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished			
	self.queue_free()	
