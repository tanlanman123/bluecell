extends CharacterBody2D
#connects player and scripts :)

const SPEED := 200.0
const GRAVITY := 900.0
const JUMP_VELOCITY := -350.0 #negative is up
#variables

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		#checks if player is on the ground

	velocity.x = Input.get_axis("ui_left", "ui_right") * SPEED
	#moves player with arrow keys

	if Input.is_action_just_pressed("press_z") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#makes player jump

	move_and_slide()
	#uses floor
