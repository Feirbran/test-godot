extends Area2D

@export var egg_cost: int = 300
@export var food_cost: int = 50

var economy_node: Node

func _ready():
	economy_node = get_node("/root/Main/EconomyManager")

func buy_egg():
	if economy_node.credits >= egg_cost:
		economy_node.credits -= egg_cost
		spawn_egg()

func buy_food(quantity: int):
	var total_cost = food_cost * quantity
	if economy_node.credits >= total_cost:
		economy_node.credits -= total_cost
		get_tree().call_group("aliens", "feed", 25 * quantity)

func spawn_egg():
	var egg_scene = preload("res://scenes/actors/Egg.tscn")
	var new_egg = egg_scene.instantiate()
	new_egg.global_position = $SpawnPoint.global_position
	get_parent().add_child(new_egg)
