extends Sprite2D

var enemy_health = 60
var speed = 60
var velocity = Vector2()
var blood = preload("res://scenes/blood.tscn")
var stun = false
var music_stun = false
var mogged_stun = false
func _physics_process(delta):
	if Global.dumbbell_ult==true:
		enemy_health = 0
		
	if music_stun != true:
		if Global.player != null and stun == false and Global.plant_round == false:
			velocity = global_position.direction_to(Global.player.global_position)
	if mogged_stun == true:
		velocity = -global_position.direction_to(Global.player.global_position)
	global_position += velocity * speed * delta
	if enemy_health <= 0:
		
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
		Global.score += 1
		dying()
	








	
func dying():
	queue_free()

func _on_hitbox_area_entered(area):
	var random_mus = randi_range(1,3)
	if area.is_in_group("enemy_damager"):
		
		velocity = -velocity
		enemy_health = enemy_health - 20
		stun = true
		$Stunned.start()
	
	
	if area.is_in_group("music") and Global.music_being_played == true:
		if random_mus == 3 or Global.guitar_ult == true:
		
			music_stun = true
			
			$music_stun_timer.start()
		else:
			pass
		
		
	if area.is_in_group("right_flex") and Global.flexing == true:
		enemy_health = enemy_health - 10
		mogged_stun = true
		$mogged.start()
	if area.is_in_group("left_flex") and Global.flexing == true:
		enemy_health = enemy_health - 10
		mogged_stun = true
		$mogged.start()
		


func _on_stunned_timeout():
	stun = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_music_stun_timer_timeout():
	music_stun = false


func _on_mogged_timeout():
	mogged_stun = false
