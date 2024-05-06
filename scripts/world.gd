extends Node2D

var enemy1 = preload("res://scenes/enemy.tscn")
var knight = preload("res://scenes/knight.tscn")
var mage = preload("res://scenes/mage.tscn")


func _ready():
	
	Global.plant_round = true
	Global.node_creation_parent = self
	
func _process(delta):
	
	if Global.round != 6 and Global.plant_round == true and Global.round_read == true and Global.plant_round_timer == true:
		$plant_round_timer.start()
		Global.round_read = false
		Global.plant_round_timer = true
		Global.plant_round_timer = false
	if Global.dumbbell_ult == true:
		Global.dumbbell_ult = false
	ending()
	if Global.player_health <= 0:
		$Sprite2D.visible = true
	if Global.sword_started == 1:
		$plant_round_timer.start()
		Global.sword_started += 1
	if Global.plant_round:
		
		Global.timer = int($plant_round_timer.get_time_left())
	else:
		
		Global.timer = int($fight_round_timer.get_time_left())
	
func _exit_tree():
	Global.node_creation_parent = null
func ending():
	if Global.round == 4 and Global.score < 10:
		pass
	if Global.round == 4 and Global.score > 10:
		pass
func _on_enemy_spawn_timer_timeout():
	if Global.round != 6:
		if Global.plant_round != true:
			var random_enemy_number = randi_range(1,Global.enemy_chance)
			if random_enemy_number == 1:
				var enemy_position = Vector2(randf_range(-160,160),randf_range(-100,100))
				while enemy_position.x < 150 and enemy_position.x > -150 and enemy_position.y < 90 and enemy_position.y > -90:
					enemy_position = Vector2(randf_range(-160,160),randf_range(-100,100))
						
				Global.instance_node(enemy1,enemy_position,self)
				
			
			var random_number = randi_range(1,Global.max_knight_chance)
			if random_number == 1 and Global.round > 1:
				var knight_position = Vector2(randf_range(-160,160),randf_range(-100,100))
				while knight_position.x < 150 and knight_position.x > -150 and knight_position.y < 90 and knight_position.y > -90:
					knight_position = Vector2(randf_range(-160,160),randf_range(-100,100))
					
				Global.instance_node(knight,knight_position,self)
			var random_number_for_mage = randi_range(1,Global.mage_chance)
			if random_number_for_mage == 1 and Global.round > 2:
				var mage_position = Vector2(randf_range(-130,130),randf_range(-80,80))
				
					
				Global.instance_node(mage,mage_position,self)

func _on_plant_round_timer_timeout():
	$plant_round_timer.stop()
	Global.plant_round = false
	Global.round += 1
	if Global.round > 1:
		Global.max_knight_chance -= 2.5
	if Global.round > 2:
		Global.mage_chance -= 1
	
	
	
	$fight_round_timer.wait_time *= 1.05
	$fight_round_timer.start()


func _on_fight_round_timer_timeout():
	Global.plant_round = true
	Global.round_read = false
	$fight_round_timer.stop()
	Global.enemy_chance += 1
	$plant_round_timer.wait_time *= 0.9
	Global.plant_round_timer = true
	if Global.round <= 3:
		$enemy_spawn_timer.wait_time *= 0.6
	if Global.round > 3:
		$enemy_spawn_timer.wait_time *= 0.88
	if Global.round == 5:
		$plant_round_timer.wait_time == 10
	


