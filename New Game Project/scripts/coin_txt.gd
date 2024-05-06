extends Label


func _process(delta):
	var coins = str(Global.money)
	text = " " + coins

