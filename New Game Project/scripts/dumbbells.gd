extends Sprite2D

func _ready():
	self.visible = false


	


func _process(delta):
	if Global.dumbbell_bought == true:
		self.visible = true





	


func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and Global.dumbbell_bought == true:
		Global.dumbbell_bought = false
		Global.dumbbell_owned = true
		Global.dumbbell_can_be_used = true
		Global.max_hit_chance *= 0.6
		self.visible = false
