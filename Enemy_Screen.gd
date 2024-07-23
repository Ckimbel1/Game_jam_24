extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
var SPEED = 50

func _physics_process(delta):
	#Gravisty for TV
	velocity.y += gravity * delta
	move_and_slide()
	
func _on_player_deterction_body_entered(body):
	if body.name == "Player":
		player = get_node("../../Player/Player")
		var direction = (player.position - position).normalized()
		print(direction.x)
		if direction.x > 0:
			print("right")
		else:
			print("left")

"""
func _physics_process(delta):
	#Gravisty for TV
	velocity.y += gravity * delta
	if chase == true:
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
			velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	move_and_slide()
	
func _on_player_deterction_body_entered(body):
	if body.name == "Player":
		chase = true
		print("chase = true")
func _on_player_deterction_body_exited(body):
	if body.name == "Player":
		print("chase = false")
		chase = false
"""

