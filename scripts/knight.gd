extends Sprite2D

var knight_health = 160
var speed = 20
var velocity = Vector2()
var blood = preload("res://scenes/blood.tscn")
var stun = false
var music_stun = false
var mogged_stun = false
func _physics_process(delta):
	if Global.dumbbell_ult == true:
		knight_health = 0
		
		
	if music_stun != true :
		if Global.player != null and stun == false and Global.plant_round == false and music_stun == false:
			velocity = global_position.direction_to(Global.player.global_position)
	if mogged_stun == true:
		velocity = -global_position.direction_to(Global.player.global_position)
	global_position += velocity * speed * delta
	if knight_health <= 0 :
		
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
		Global.score += 3
		dying()
	








	
func dying():
	
	queue_free()

func _on_hitbox_area_entered(area):
	if area.is_in_group("enemy_damager"):
		
		velocity = -velocity
		knight_health = knight_health - Global.attack_damage
		stun = true
		$Stunned.start()
	if area.is_in_group("music") and Global.guitar_ult == true:
		
		music_stun = true
			


		
		
		
		
		


func _on_stunned_timeout():
	stun = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_music_stun_timerr_timeout():
	music_stun = false


func _on_mogged_stun_timer_kn_timeout():
	mogged_stun = false
