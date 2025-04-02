extends Node2D

@onready var aliens_node = $World/Aliens
@onready var eggs_node = $World/Eggs
@onready var economy = $Systems/EconomyManager
@onready var breeding_system = $Systems/BreedingManager

var current_selected_alien: Node = null

func _ready():
	spawn_initial_aliens()
	setup_ui()

func spawn_initial_aliens():
	for i in 3:
		var alien = preload("res://scenes/actors/Alien.tscn").instantiate()
		alien.position = Vector2(300 + i * 200, 400)
		alien.name = "Alien_%d" % i
		aliens_node.add_child(alien)

func setup_ui():
	$UI/HealthBar.max_value = 100
	$UI/HungerBar.max_value = 100
	$UI/ThirstBar.max_value = 100

func _on_alien_selected(alien):
	current_selected_alien = alien
	update_ui()

func update_ui():
	if current_selected_alien:
		$UI/HealthBar.value = current_selected_alien.health
		$UI/HungerBar.value = current_selected_alien.hunger
		$UI/ThirstBar.value = current_selected_alien.thirst
