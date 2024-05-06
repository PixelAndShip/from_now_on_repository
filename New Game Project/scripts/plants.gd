extends Sprite2D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.plant_round == true:
		self.visible = true
	if Global.plant_round != true:
		self.visible= false
