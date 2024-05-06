extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.sword_started > 0:
		self.visible = false
