extends CharacterBody2D

@export var speed := 80.0
var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")
	print(player)

func _physics_process(delta):
	if player == null:
		return

	var direction := global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
