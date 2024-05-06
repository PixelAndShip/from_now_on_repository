extends Sprite2D





func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	Global.back_to_menu = true
