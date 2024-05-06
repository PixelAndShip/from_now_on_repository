extends Sprite2D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.shielded == true:
		self.visible = true
	if Global.shielded == false:
		self.visible = false
