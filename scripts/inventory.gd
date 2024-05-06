extends Control

var max_hit_chance_og = Global.max_hit_chance
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	$AnimatedSprite2D1.play("default")
	$AnimatedSprite2D2.play("default")
	$AnimatedSprite2D3.play("default")
	$AnimatedSprite2D4.play("default")
	Global.inv_slot_1 = false
	Global.inv_slot_2 = false
	Global.inv_slot_3 = false
	Global.inv_slot_4 = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.round_read == false:
		self.visible = false
		Global.inventory_open = false
	if Input.is_action_just_pressed("inventory") and self.visible == false and Global.round_read == true:
		self.visible = true
		Global.inventory_open = true
	elif Input.is_action_just_pressed("inventory") and self.visible == true:
		self.visible = false
		Global.inventory_open = false
	check_inv()
func check_inv():
	if Global.item2owned == true:
		if Global.inv_slot_1 == false:
			$AnimatedSprite2D1.play("bible")
			Global.inv_slot_1 = true
			Global.item2owned = false
			Global.inv_slot_bible = 1
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == false:
			$AnimatedSprite2D2.play("bible")
			Global.inv_slot_2 = true
			Global.item2owned = false
			Global.inv_slot_bible = 2
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == false:
			$AnimatedSprite2D3.play("bible")
			Global.inv_slot_3 = true
			Global.item2owned = false
			Global.inv_slot_bible = 3
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == true and Global.inv_slot_4 == false:
			$AnimatedSprite2D4.play("bible")
			Global.inv_slot_4 = true
			Global.item2owned = false
			Global.inv_slot_bible = 4
			Global.items_bought = 4
	if Global.item3owned == true:
		if Global.inv_slot_1 == false:
			$AnimatedSprite2D1.play("potion")
			Global.inv_slot_1 = true
			Global.item3owned = false
			Global.inv_slot_potion = 1
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == false:
			$AnimatedSprite2D2.play("potion")
			Global.inv_slot_2 = true
			Global.item3owned = false
			Global.inv_slot_potion = 2
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == false:
			$AnimatedSprite2D3.play("potion")
			Global.inv_slot_3 = true
			Global.item3owned = false
			Global.inv_slot_potion = 3
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == true and Global.inv_slot_4 == false:
			$AnimatedSprite2D4.play("potion")
			Global.inv_slot_4 = true
			Global.item3owned = false
			Global.inv_slot_potion = 4
			Global.items_bought = 4
	if Global.guitar_owned == true:
		if Global.inv_slot_1 == false:
			$AnimatedSprite2D1.play("guitar")
			Global.inv_slot_1 = true
			Global.guitar_owned = false
			Global.inv_slot_guitar = 1
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == false:
			$AnimatedSprite2D2.play("guitar")
			Global.inv_slot_2 = true
			Global.guitar_owned = false
			Global.inv_slot_guitar = 2
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == false:
			$AnimatedSprite2D3.play("guitar")
			Global.inv_slot_3 = true
			Global.guitar_owned = false
			Global.inv_slot_guitar = 3
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == true and Global.inv_slot_4 == false:
			$AnimatedSprite2D4.play("guitar")
			Global.inv_slot_4 = true
			Global.guitar_owned = false
			Global.inv_slot_guitar = 4
			Global.items_bought = 4
	if Global.dumbbell_owned == true:
		if Global.inv_slot_1 == false:
			$AnimatedSprite2D1.play("dumbbell")
			Global.inv_slot_1 = true
			Global.dumbbell_owned = false
			Global.inv_slot_dumbbell = 1
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == false:
			$AnimatedSprite2D2.play("dumbbell")
			Global.inv_slot_2 = true
			Global.dumbbell_owned = false
			Global.inv_slot_dumbbell = 2
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == false:
			$AnimatedSprite2D3.play("dumbbell")
			Global.inv_slot_3 = true
			Global.dumbbell_owned = false
			Global.inv_slot_dumbbell = 3
		elif Global.inv_slot_1 == true and Global.inv_slot_2 == true and Global.inv_slot_3 == true and Global.inv_slot_4 == false:
			$AnimatedSprite2D4.play("dumbbell")
			Global.inv_slot_4 = true
			Global.dumbbell_owned = false
			Global.inv_slot_dumbbell = 4
			Global.items_bought = 4

func _on_inv_button_1_pressed():
	if Global.inv_slot_bible == 1:
		Global.bible_ult = true
		Global.inv_slot_bible = 0
		max_hit_chance_og = Global.max_hit_chance
		Global.max_hit_chance = 1
		$bible_ult_timer.start()
	if Global.inv_slot_dumbbell == 1:
		Global.dumbbell_ult = true
		Global.inv_slot_dumbbell = 0
	if Global.inv_slot_potion == 1:
		Global.potion_ult = true
		Global.inv_slot_potion = 0
		var potion_chance = randi_range(1,2)
		if potion_chance == 1:
			Global.player_health += 300
		if potion_chance == 2:
			Global.player_speed += 200
	if Global.inv_slot_guitar == 1:
		Global.guitar_ult = true
		Global.inv_slot_guitar = 0
		$guitar_ult_timer.start()
	$AnimatedSprite2D1/inv_button_1.visible=false
func _on_inv_button_3_pressed():
	if Global.inv_slot_bible == 3:
		Global.bible_ult = true
		Global.inv_slot_bible = 0
		max_hit_chance_og = Global.max_hit_chance
		Global.max_hit_chance = 1
		$bible_ult_timer.start()
	if Global.inv_slot_dumbbell == 3:
		Global.dumbbell_ult = true
		Global.inv_slot_dumbbell = 0
	if Global.inv_slot_potion == 3:
		Global.potion_ult = true
		Global.inv_slot_potion = 0
		var potion_chance = randi_range(1,2)
		if potion_chance == 1:
			Global.player_health += 300
		if potion_chance == 2:
			Global.player_speed += 200
	if Global.inv_slot_guitar == 3:
		Global.guitar_ult = true
		Global.inv_slot_guitar = 0
		$guitar_ult_timer.start()
	$AnimatedSprite2D3/inv_button_3.visible=false
func _on_inv_button_4_pressed():
	if Global.inv_slot_bible == 4:
		Global.bible_ult = true
		Global.inv_slot_bible = 0
		max_hit_chance_og = Global.max_hit_chance
		Global.max_hit_chance = 1
		$bible_ult_timer.start()
	if Global.inv_slot_dumbbell == 4:
		Global.dumbbell_ult = true
		Global.inv_slot_dumbbell = 0
	if Global.inv_slot_potion == 4:
		Global.potion_ult = true
		Global.inv_slot_potion = 0
		var potion_chance = randi_range(1,2)
		if potion_chance == 1:
			Global.player_health += 300
		if potion_chance == 2:
			Global.player_speed += 200
	if Global.inv_slot_guitar == 4:
		Global.guitar_ult = true
		Global.inv_slot_guitar = 0
		$guitar_ult_timer.start()
	$AnimatedSprite2D4/inv_button_4.visible=false
func _on_inv_button_2_pressed():
	if Global.inv_slot_bible == 2:
		Global.bible_ult = true
		Global.inv_slot_bible = 0
		max_hit_chance_og = Global.max_hit_chance
		Global.max_hit_chance = 1
		$bible_ult_timer.start()
	if Global.inv_slot_dumbbell == 2:
		Global.dumbbell_ult = true
		Global.inv_slot_dumbbell = 0
	if Global.inv_slot_potion == 2:
		Global.potion_ult = true
		Global.inv_slot_potion = 0
		var potion_chance = randi_range(1,2)
		if potion_chance == 1:
			Global.player_health += 300
		if potion_chance == 2:
			Global.player_speed += 200
	if Global.inv_slot_guitar == 2:
		Global.guitar_ult = true
		Global.inv_slot_guitar = 0
		$guitar_ult_timer.start()
	$AnimatedSprite2D2/inv_button_2.visible=false
func _on_guitar_ult_timer_timeout():
	Global.guitar_ult = false


func _on_bible_ult_timer_timeout():
	Global.max_hit_chance = max_hit_chance_og
