extends CharacterBody2D


var can_take_damage = true
var player_state

var current_direction
var taking_damage = false
var attack_damage = Global.attack_damage
var can_attack = true
var slash  = preload("res://scenes/slash.tscn")
var blood = preload("res://scenes/blood.tscn")
var enemy_type = null
var enemies_in_range = 0
var knights_in_range = 0


func _ready():
	$minus_hp_text.visible=false
	$bubble.visible = false
	Global.player = self
	
func _exit_tree():
	Global.player = null
func _physics_process(delta):
	print(Global.max_hit_chance)
	Global.player_position = self.global_position
	var direction = Input.get_vector("left","right","up","down")
	global_position.x = clamp(global_position.x,-145,145)
	global_position.y = clamp(global_position.y,-81,81)
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 and direction.y != 0:
		player_state = "walking"
	
	if Input.is_action_just_pressed("heal") and Global.potion_can_be_used == true:
		Global.player_health += 20
		Global.potion_can_be_used = false
		$potion_can_be_used_timer.start()
	velocity = direction * Global.player_speed
	move_and_slide()
	if Input.is_action_pressed("attack") and Global.node_creation_parent != null and can_attack and Global.sword_started>=1:
		Global.just_attacked = true
		player_state = "attacking"
		Global.instance_node(slash, global_position, Global.node_creation_parent)
		can_attack = false
		$reload_speed.wait_time = Global.reload_speed
		$reload_speed.start()
		if Global.increase_slash_size == true:
			$sword_size_timer.start()
	else:
		player_state = "idle"
	Global.just_attacked = false
	
	if Input.is_action_pressed("play_music") and Global.guitar_can_be_used == true and Global.currently_reading != true and Global.currently_workingout != true:
		Global.music_being_played = true
		$AnimatedSprite2D.play("playing_music")
		$bubble.visible = true
		player_state = "playing_music"
		
	else:
		$bubble.visible = false
		Global.music_being_played = false
	workout_func()
	play_anim(direction)
	if Global.player_health <= 0:
		queue_free()
	reading_bible()
	

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "attacking":
		$AnimatedSprite2D.play("attacking")
	if player_state == "playing_music":
		$AnimatedSprite2D.play("playing_music")
func _on_reload_speed_timeout():
	can_attack = true

func reading_bible():
	if Input.is_action_pressed("reading") and Global.inventory_open == true and Global.bible_can_be_used == true and Global.music_being_played != true and Global.currently_workingout != true:
		$AnimatedSprite2D.play("reading")
		Global.currently_reading = true
		Global.player_health += 0.1
		var random_number_for_attack = randi_range(1,3)
		
		if random_number_for_attack == 2:
			Global.score -= 0.008
	else:
		Global.currently_reading = false
	
func workout_func():
	if Input.is_action_pressed("workout_pressed") and Global.dumbbell_can_be_used == true and Global.currently_reading != true and Global.music_being_played != true:
		player_state = "working_out"
		$AnimatedSprite2D.play("working_out_anim")
		Global.currently_workingout = true
		if Global.max_hit_chance > 2.5:
			Global.max_hit_chance -= 0.01
	else:
		Global.currently_workingout = false


	



func _on_area_2d_area_entered(area):
		if area.is_in_group("enemy"):
			var can_get_hit_chance_enemy = randi_range(Global.min_hit_chance, Global.max_hit_chance)
			if can_get_hit_chance_enemy == 1:
				
				
				
				Global.shielded = true
				$Timer.start()
			else:
				Global.player_health -= 2
				$minus_hp_text.set_text("-" + "2")
				$minus_hp_text.visible = true
				
			enemies_in_range += 1
			
			
			taking_damage = true
			enemy_type = "enemy"
				
			$enemies_on_taking_damage_timer.start()
			if Global.node_creation_parent != null:
				var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
				blood_particles_instance.rotation = velocity.angle()
		
		if area.is_in_group("enemy_knight"):
			var can_get_hit_chance_knight = randi_range(Global.min_hit_chance, Global.max_hit_chance)
			if can_get_hit_chance_knight == 1:
				
				
				
				Global.shielded = true
				$Timer.start()
			else:
				Global.player_health -= 20
				$minus_hp_text.set_text("-" + "20")
				$minus_hp_text.visible = true
				
			knights_in_range += 1
			
			
			taking_damage = true
			enemy_type = "enemy_knight"
				
			$knights_on_taking_damage_timer.start()
			if Global.node_creation_parent != null:
				var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
				blood_particles_instance.rotation = velocity.angle()
		if area.is_in_group("fireball"):
			var can_get_hit_chance_fireball = randi_range(Global.min_hit_chance, Global.max_hit_chance)
			if can_get_hit_chance_fireball == 1:
				
				
				
				Global.shielded = true
				$Timer.start()
			else:
				Global.player_health -= 5
				
				$minus_hp_text.set_text("-5")
				$minus_hp_text.visible = true
				
			if Global.node_creation_parent != null:
				var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
				blood_particles_instance.rotation = velocity.angle()

func _on_can_take_damage_timer_timeout():
	can_take_damage = true
	




	


func _on_timer_timeout():
	Global.shielded = false


func _on_sword_size_timer_timeout():
	Global.increase_slash_size = false


func _on_potion_can_be_used_timer_timeout():
	Global.potion_can_be_used == true


func _on_area_2d_area_exited(area):
	if area.is_in_group("enemy"):
		taking_damage = false
		enemies_in_range -= 1
		$minus_hp_text.visible = false
	if area.is_in_group("enemy_knight"):
		taking_damage = false
		enemies_in_range -= 1
		$minus_hp_text.visible = false
	if area.is_in_group("fireball"):
		$minus_hp_text.visible = false
	

	
func _on_enemies_on_taking_damage_timer_timeout():
	if taking_damage == true:
		var can_get_hit_chance_enemies = randi_range(Global.min_hit_chance, Global.max_hit_chance)
		if can_get_hit_chance_enemies == 1:
				
				
				
			Global.shielded = true
			$Timer.start()
		else:
			
	
			
			Global.player_health -= 2 * enemies_in_range
			$minus_hp_text.set_text(str(-2*enemies_in_range))
			$minus_hp_text.visible = true
			
		$enemies_on_taking_damage_timer.start()


func _on_knights_on_taking_damage_timer_timeout():
	if taking_damage == true:
		var can_get_hit_chance_knights = randi_range(Global.min_hit_chance, Global.max_hit_chance)
		if can_get_hit_chance_knights == 1:
				
				
				
			Global.shielded = true
			$Timer.start()
		else:
			
		
			Global.player_health -= 20 * knights_in_range
			$minus_hp_text.set_text(str(-20*knights_in_range))
			$minus_hp_text.visible = true
			
		$knights_on_taking_damage_timer.start()


