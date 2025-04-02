extends Node

func breed(parent1: Dictionary, parent2: Dictionary) -> Dictionary:
	var child = {
		"id": randi() % 1000,
		"traits": {
			"color": _mix_trait(parent1.traits.color, parent2.traits.color),
			"shape": [parent1.traits.shape, parent2.traits.shape].pick_random(),
			"size": (parent1.traits.size + parent2.traits.size) / 2.0
		}
	}
	return child

func _mix_trait(color1: String, color2: String) -> String:
	var mix = Color(color1).lerp(Color(color2), 0.5)
	return "#%02x%02x%02x" % [mix.r8, mix.g8, mix.b8]
