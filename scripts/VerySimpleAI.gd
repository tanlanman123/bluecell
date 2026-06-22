extends CharacterBody2D

@onready var player_node: CharacterBody2D = $"../Player"
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed: float = 80
var gravity = 12

@export_range(-1, 1) var dir: int = 1

func _ready() -> void:
	if player_node.global_position.x > global_position.x:
		dir = 1
	else:
		dir = -1

	sprite_2d.flip_h = dir == -1

func _physics_process(delta: float) -> void:
	if dir == 1 and (not $RightRay.is_colliding() or $RightWallRay.is_colliding()):
		sprite_2d.flip_h = true
		dir = -1

	if dir == -1 and (not $LeftRay.is_colliding() or $LeftWallRay.is_colliding()):
		sprite_2d.flip_h = false
		dir = 1

	velocity.x = lerp(velocity.x, dir * speed, 10.0 * delta)
	velocity.y += gravity
	move_and_slide()

func _wait_dir_change(desired_dir: int):
	await get_tree().create_timer(0.5).timeout
	dir = desired_dir

func _on_enemy_detection_area_body_entered(body: Node2D) -> void:
	if body == player_node:
		get_tree().call_deferred("reload_current_scene")
