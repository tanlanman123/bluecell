extends CharacterBody2D

@export var speed := 120.0

var player: Node2D = null

func _physics_process(delta):
	if player == null:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detection_area_body_exited(body):
	if body == player:
		player = null
