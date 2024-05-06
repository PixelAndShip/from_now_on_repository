extends Label


func _process(delta):
	var wheat_count = str(Global.num_of_wheat)
	text = " " + wheat_count
