extends Node

const TRAITS = {
	"color": ["#FF0000", "#00FF00", "#0000FF"],  # Rosso, Verde, Blu
	"shape": ["round", "square", "triangular"],
	"size": [0.8, 1.0, 1.2]
}

func generate_alien() -> Dictionary:
	var alien = {
		"id": randi() % 1000,
		"traits": {
			"color": TRAITS.color.pick_random(),
			"shape": TRAITS.shape.pick_random(),
			"size": TRAITS.size.pick_random()
		}
	}
	return alien
	
func generate_organs(alien_data: Dictionary) -> Array[Organ]:
	var organs = []
	for i in range(randi() % 3 + 1):  # 1-3 organi per alieno
		organs.append(Organ.new(alien_data))
	return organs
