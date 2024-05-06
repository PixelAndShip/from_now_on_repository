extends Label



func _process(delta):
	var hp_str = str(int(Global.player_health))
	text = hp_str
