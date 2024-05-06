extends ColorRect





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.can_buy == true:
		self.color = "60ff00e9"
	else:
		self.color = "e50000"
