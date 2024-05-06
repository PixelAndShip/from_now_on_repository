extends Label


func _process(delta):
	
		self.visible = true
		var timer = str(Global.timer)
		text = "timer: " + timer

