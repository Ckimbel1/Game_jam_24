extends CharacterBody2D

# Declare member variables
#var velocity = Vector2()
var speed = 400
var gravity = 500
var jump_force = -400



@onready var anim = get_node("AnimatedSprite2D")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	#Get input direction
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false	
	if direction:
			velocity.x = direction * speed
			if is_on_floor():
				anim.play("Walk")
	else:
		velocity.x = 0
		if is_on_floor():
			anim.play("Idle")

	# Handle jumping
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force
		anim.play("Jump")
		
	# Move the player
	move_and_slide()
	
"""
func _on_door_child_entered_tree(node):
	# Function to handle when the player collides with the door
	if node == self and has_key:
		# Transition to the next level
		get_tree().change_scene("res://NextLevel.tscn")  # Replace with your next level scene path

"""
