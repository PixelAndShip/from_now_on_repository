extends Sprite2D


func _ready():
	self.visible = false


	


func _process(delta):
	if Global.guitar_bought == true:
		self.visible = true




func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and Global.guitar_bought_once !=true and Global.guitar_bought == true:
		Global.guitar_bought = false
		Global.guitar_owned = true
		Global.guitar_can_be_used = true
		Global.guitar_bought_once = true
		Global.max_hit_chance *= 0.7
		self.visible = false
		
