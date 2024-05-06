extends Sprite2D


var look_once = true
var velocity = Vector2(1,0)
var speed = 120
func _process(delta):
	if Global.increase_slash_size:
		var scale_factor = 0.01  # Adjust this value to control the rate of scaling
		
		var new_scale = scale + Vector2(scale_factor, scale_factor)
		
		set_scale(new_scale)
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	self.global_position += velocity.rotated(rotation) * speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hitbox_area_entered(area):
	if area.is_in_group("enemy"):
		queue_free()
	if area.is_in_group("enemy_knight"):
		queue_free()
