extends CharacterBody2D

@export var speed: float = 250.0
@export var jump_velocity: float = -400.0 #up is negative for some reason
@export var gravity: float = 900.0

func _physics_process(delta):
	# Add gravity when the player is in the air
	if not is_on_floor():
		velocity.y += gravity * delta

	# Move left and right with arrow keys.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Jump when the player presses the "z" button and is on the floor
	if Input.is_action_just_pressed("press_z") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()
