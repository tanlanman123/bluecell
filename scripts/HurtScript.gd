extends Area2D

@onready var heart1 = get_node("/root/Root/healthBar/HBoxContainer/heart1")
@onready var heart2 = get_node("/root/Root/healthBar/HBoxContainer/heart2")
@onready var heart3 = get_node("/root/Root/healthBar/HBoxContainer/heart3")
@onready var heart4 = get_node("/root/Root/healthBar/HBoxContainer/heart4")
@onready var heart5 = get_node("/root/Root/healthBar/HBoxContainer/heart5")
var timeout1
var timeout2
var timeout3
var timeout4

func _on_area_entered(body: Node2D) -> void:
	if body.name == "PlayerHitBox" or body.name == "Area2D":
		if heart1.visible == true:
			heart1.visible = false
			await get_tree().create_timer(1).timeout #i-frames
			timeout1 = true
		elif heart2.visible == true and timeout1 == true:
			heart2.visible = false
			await get_tree().create_timer(1).timeout #i-frames
			timeout2 = true
		elif heart3.visible == true and timeout2 == true:
			heart3.visible = false
			await get_tree().create_timer(1).timeout #i-frames
			timeout3 = true
		elif heart4.visible == true and timeout3 == true:
			heart4.visible = false
			await get_tree().create_timer(1).timeout #i-frames
			timeout4 = true
		elif heart5.visible == true and timeout4 == true:
			heart5.visible = false
			print("you died")

	if body.name == "SwordUp" or "SwordRight" or "SwordLeft" or "SwordDown":
		print("sword hit enemy")
		#add enemy health😒
