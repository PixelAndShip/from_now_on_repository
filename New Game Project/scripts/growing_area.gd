extends StaticBody2D


var plant = Global.plant_selected
var plant_growing = false
var plant_grown = false
var planting_selected = false
func _process(delta):
	if plant_growing == false:
		plant = Global.plant_selected


func _on_area_2d_area_entered(area):
	if plant_growing != true:
		if area.is_in_group("wheat_seed"):
			plant_growing = true
			$wheat_timer.start()
			$plant.play("wheat_growing_animation")
		if area.is_in_group("potato_seed"):
			plant_growing = true
			$potato_timer.start()
			$plant.play("potato_growing_animation")
			
	else:
		pass


func _on_wheat_timer_timeout():
	var wheat_plant = $plant
	if wheat_plant.frame == 0:
		wheat_plant.frame = 1
		$wheat_timer.start()
	elif wheat_plant.frame == 1:
		wheat_plant.frame += 1
		$wheat_timer.start()
	elif wheat_plant.frame == 2:
		wheat_plant.frame = 3
		plant_grown = true
		planting_selected = true

func _on_potato_timer_timeout():
	var potato_plant = $plant
	if potato_plant.frame == 0:
		potato_plant.frame = 1
		$potato_timer.start()
	elif potato_plant.frame == 1:
		potato_plant.frame = 2
		$potato_timer.start()
	elif potato_plant.frame == 2:
		potato_plant.frame = 3
		plant_grown = true
		planting_selected = true




func _on_button_pressed():
	if planting_selected:
		if plant_grown:
			
			if plant == 1:
				
				Global.num_of_wheat += 1
				plant_growing = false
				plant_grown = false
				$plant.play("no_plant")
				planting_selected = false
			if plant == 2:
					
				Global.num_of_potato += 1
				plant_growing = false
				plant_grown = false
				$plant.play("no_plant")
				planting_selected = false
					
			else:
				pass
