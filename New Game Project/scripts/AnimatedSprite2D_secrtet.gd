extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible= false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.round >=4 and Global.score == 69:
		self.visible = true
		var random_num = randi_range(1,3)
		if random_num == 1:
			self.play("1")
		if random_num == 2:
			self.play("2")
		if random_num == 3:
			self.play("3")
