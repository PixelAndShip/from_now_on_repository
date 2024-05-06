extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.bought_sword == true:
		self.visible = true
	if Global.bought_sword == false:
		self.visible = false
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("player") and Global.bought_sword == true:
		var random_size_number = randi_range(1,10)
		Global.bought_sword = false
		Global.sword_started += 1
		if Global.sword_started % 2 == 0:
			Global.attack_damage += 3
		if Global.sword_started % 2 != 0:
			Global.reload_speed *=0.75
		if random_size_number == 3:
			
			Global.increase_slash_size = true

	
