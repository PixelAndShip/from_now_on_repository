extends AnimatedSprite2D


func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.inv_slot_bible == 4 or Global.inv_slot_potion == 4 or Global.inv_slot_guitar == 4 or Global.inv_slot_dumbbell == 4:
		self.play("default")
		self.visible = true
	else:
		self.visible = false
