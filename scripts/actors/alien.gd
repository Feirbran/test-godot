extends CharacterBody2D

signal selected
signal died

@export var speed: float = 150.0
@export var max_health: float = 100.0

var health: float = max_health:
	set(value):
		health = clamp(value, 0, max_health)
		if health <= 0:
			emit_signal("died")

var hunger: float = 0.0
var thirst: float = 0.0

func _ready():
	$NeedsTimer.start()

func _physics_process(_delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * speed
	move_and_slide()

func _on_needs_timer_timeout():
	hunger += 2.0
	thirst += 1.5
	if hunger >= 100 or thirst >= 100:
		health -= 10

func feed(amount: float):
	hunger = max(0, hunger - amount)

func hydrate(amount: float):
	thirst = max(0, thirst - amount)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("selected")
