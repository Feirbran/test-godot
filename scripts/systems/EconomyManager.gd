extends Node

var credits: int = 1000
var reputation: int = 0
var dark_reputation: int = 0
var blackmarket_multiplier: float = 1.0

func calculate_organ_value(organ: Organ) -> int:
	var base = organ.value
	var rep_bonus = dark_reputation * 0.1
	return int(base * (1 + rep_bonus) * blackmarket_multiplier)
	
func sell_alien(alien: Dictionary) -> void:
	credits += 200
	reputation += 1

func sell_organ() -> void:
	credits += 500
	dark_reputation += 1
	reputation = max(0, reputation - 1)
	
