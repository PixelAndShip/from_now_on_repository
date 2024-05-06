extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("flexing") and Global.dumbbell_can_be_used == true and Global.music_being_played!= true:
		Global.flexing = true
		self.visible = true
	else:
		self.visible = false
		Global.flexing = false
