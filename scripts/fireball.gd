extends Sprite2D


var look_once = true
var velocity = Vector2(1,0)
var speed = 70
func _process(delta):
	
	if look_once:
		look_at(Global.player_position)
		look_once = false
	self.global_position += velocity.rotated(rotation) * speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
	if area.is_in_group("music") and Global.music_being_played == true:
		queue_free()
	
