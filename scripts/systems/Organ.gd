class_name Organ
enum TYPES {HEART, BRAIN, EYE, TENTACLE}

var type: TYPES
var quality: float  # 0.5-1.5
var value: int
var traits: Dictionary

func _init(alien_data: Dictionary):
	self.type = TYPES.values()[randi() % TYPES.size()]
	self.quality = randf_range(0.8, 1.2) * alien_data.traits.get("health", 1.0)
	self.value = int(50 * quality + alien_data.generation * 10)
	self.traits = {
		"color": alien_data.traits.color,
		"size": alien_data.traits.size
	}
