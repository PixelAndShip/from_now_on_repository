extends Sprite2D

var mage_health = 20
var mage_attacking = false
var velocity = Vector2()
var blood = preload("res://scenes/blood.tscn")
var fireball = preload("res://scenes/fireball.tscn")
var reloaded = true
func _ready():
	$mage_ready_to_attack.start()
func _physics_process(delta):
	if mage_attacking == true:
		$AnimatedSprite2D.play("attack")
	if Global.dumbbell_ult==true:
		mage_health = 0
		
	if mage_attacking == true and reloaded == true:
		
	
		Global.instance_node(fireball, global_position, Global.node_creation_parent)

		$reloading.wait_time = 1
		$reloading.start()
		reloaded = false


	if Global.plant_round == true:
		queue_free()
	if mage_health <= 0:
		
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood,global_position,Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
		Global.score += 7
		dying()
	








	
func dying():
	queue_free()


	
		




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()




func _on_area_2d_area_entered(area):
	var random_mus = randi_range(1,3)
	if area.is_in_group("enemy_damager"):
		

		mage_health = mage_health - 20
		
		
	
	
	
		
		
	if area.is_in_group("right_flex") and Global.flexing == true:
		mage_health = mage_health - 10
		
		
	if area.is_in_group("left_flex") and Global.flexing == true:
		mage_health = mage_health - 10
		
		


func _on_mage_ready_to_attack_timeout():
	mage_attacking = true


func _on_reloading_timeout():
	reloaded = true
