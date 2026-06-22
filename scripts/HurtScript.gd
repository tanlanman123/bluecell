extends Area2D

@onready var heart = get_node("/root/Root/healthBar/HBoxContainer/heart")
@onready var heart2 = get_node("/root/Root/healthBar/HBoxContainer/heart2")
@onready var heart3 = get_node("/root/Root/healthBar/HBoxContainer/heart3")
@onready var heart4 = get_node("/root/Root/healthBar/HBoxContainer/heart4")
@onready var heart5 = get_node("/root/Root/healthBar/HBoxContainer/heart5")

func _on_area_entered(body: Node2D) -> void:
	print("1")
	if body.name == "PlayerHitBox" or body.name == "Area2D":
		print("2")
		if heart.visible == true:
			heart.visible = false
		elif heart2.visible == true:
			heart2.visible = false
		elif heart3.visible == true:
			heart3.visible = false
		elif heart4.visible == true:
			heart4.visible = false
		elif heart5.visible == true:
			heart5.visible = false
			print("you died")
