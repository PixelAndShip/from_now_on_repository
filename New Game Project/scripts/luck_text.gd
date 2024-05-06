extends Label

func _ready():
	print(Global.max_hit_chance)
func _process(delta):
	var luck = 1.0 / Global.max_hit_chance
	var luck_str = str(int(luck * 100))
	text = luck_str + "%"
