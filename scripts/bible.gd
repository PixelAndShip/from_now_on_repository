extends StaticBody2D



func _ready():
	self.visible = false

func _process(delta):
	
	if Global.bible_bought == true:
		self.visible = true




func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and Global.bible_bought == true:
		self.visible = false
		Global.bible_bought = false
		Global.item2owned = true
		Global.bible_can_be_used = true
		Global.max_hit_chance = Global.max_hit_chance * 0.9
