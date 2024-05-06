extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.round >= 6 and Global.score <= 0:
		self.visible = true
	else:
		self.visible = false
