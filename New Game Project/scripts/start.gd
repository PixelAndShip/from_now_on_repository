extends Control




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.skipped == true:
		$VideoStreamPlayer.visible = false
		
	if Input.is_action_just_pressed("pause") and Global.skipped == false:
		
		$VideoStreamPlayer.visible = false
		$begin.visible = true
		$end.visible = true
		$controlsss.visible = true
		Global.skipped = true
		Global.back_to_menu = false

func _on_begin_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_end_pressed():
	get_tree().quit()


func _on_video_stream_player_finished():
	$VideoStreamPlayer.visible = false


func _on_controlsss_pressed():
	get_tree().change_scene_to_file("res://scenes/control_menu.tscn")
