extends Sprite2D

func _ready():
	self.visible = false

func _process(delta):
	if Global.player_health < 50:
		self.visible = true
	if Global.player_health >= 50:
		self.visible = false
