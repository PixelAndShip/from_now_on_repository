extends Label


func _process(delta):
	var potato_count = str(Global.num_of_potato)
	text = " " + potato_count
