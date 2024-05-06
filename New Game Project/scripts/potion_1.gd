extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	
func _process(delta):
	if Global.potion_bought == true:
		self.visible = true



func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and Global.potion_bought == true:
		self.visible = false
		Global.potion_bought = false
		Global.item3owned = true
		Global.potion_can_be_used = true
