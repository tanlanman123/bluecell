extends CharacterBody2D


var SPEED = 250.0
var JUMP_VELOCITY = -500.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("press_z") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("press_z") and velocity.y < 0.0:
		velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
