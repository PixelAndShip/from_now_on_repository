extends StaticBody2D




func _ready():
	$shop_menu.visible = false
	$sold_crops.visible = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		var wheat = Global.num_of_wheat * 1
		var potato = Global.num_of_potato * 2
		var money = Global.money
		if wheat > 0:
			Global.money = money + wheat
			var sold_text = "+" + str(wheat)
			$sold_crops.set_text(sold_text)
			$sold_crops.visible = true
			Global.num_of_wheat = 0
		elif potato > 0:
			Global.money = money + potato
			var sold_text = "+" + str(potato)
			$sold_crops.set_text(sold_text)
			$sold_crops.visible = true
			Global.num_of_potato = 0
		else:
			pass


func _on_buy_area_area_entered(area):
	if area.is_in_group("player"):
		$shop_menu.visible = true


func _on_buy_area_area_exited(area):
	if area.is_in_group("player"):
		$shop_menu.visible = false


func _on_area_2d_area_exited(area):
	$sold_crops.visible = false
