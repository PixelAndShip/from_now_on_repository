extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.inv_slot_bible == 1 or Global.inv_slot_potion == 1 or Global.inv_slot_guitar == 1 or Global.inv_slot_dumbbell == 1:
		self.play("default")
		self.visible = true
	else:
		self.visible = false
