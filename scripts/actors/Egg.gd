extends RigidBody2D

@export var incubation_time: float = 60.0
var current_time: float = 0.0

func _ready():
	$HatchTimer.wait_time = incubation_time
	$HatchTimer.start()

func _process(delta):
	current_time += delta
	$ProgressBar.value = (current_time / incubation_time) * 100

func _on_hatch_timer_timeout():
	var alien = preload("res://scenes/actors/Alien.tscn").instantiate()
	get_parent().add_child(alien)
	alien.global_position = global_position
	queue_free()
