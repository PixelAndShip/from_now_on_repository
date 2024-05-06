extends Sprite2D


func _process(delta):
	if Global.plant_round != true:
		self.visible = true
	if Global.plant_round == true:
		self.visible= false
