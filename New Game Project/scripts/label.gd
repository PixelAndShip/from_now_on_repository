extends Label


func _process(delta):
	
		self.visible = true
		var score_str = str(int(Global.score))
		text = "repaid: " + score_str
	
