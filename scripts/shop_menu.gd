extends StaticBody2D


var price = 0
var item = 1

var item0price = Global.sword_price


var item6owned = false
var item5owned = false
var item4owned = false
var item1owned = false
var item2owned = false
var item3owned = false
var item0owned = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	item = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.visible == true:
		if item == 5:
			Global.price = Global.item5price
			$shop_shown_item.play("guitar")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 6:
			Global.price = Global.item6price
			$shop_shown_item.play("dumbbell")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 0:
			Global.price = Global.sword_price
			$shop_shown_item.play("sword")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 1:
			Global.price = Global.item1price
			$shop_shown_item.play("potato_seed")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 2:
			Global.price = Global.item2price
			$shop_shown_item.play("bible")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 3:
			Global.price = Global.item3price
			$shop_shown_item.play("potion1")
			if Global.money >= Global.price:
				Global.can_buy = true
		if item == 4:
			Global.price = Global.item4price
			$shop_shown_item.play("field")
			if Global.money >= Global.price:
				Global.can_buy = true



func _on_left_pressed():
	swap_item_back()

	
	
func buy():
	
	Global.money -= price
	if item == 0:
		item0owned = true
		Global.bought_sword = true
		Global.sword_price += 3
		
	if item == 6  and Global.items_bought != 4:
		item6owned = true
		Global.dumbbell_bought = true
		
		
	if item == 5  and Global.items_bought != 4:
		item5owned = true
		Global.guitar_bought = true
		
		
	if item == 1:
		item1owned = true
		Global.potato_seeds_bought = true
		
	if item == 2 and Global.items_bought != 4:
		item2owned = true
		Global.bible_bought = true
		
		
	if item == 3  and Global.items_bought != 4:
		item3owned = true
		Global.potion_bought = true
		Global.item3price += 20
		
	if item == 4:
		Global.field_count +=1
		Global.item4price += 2 * Global.round
func swap_item_forwad():
	if item == 0:
		item = 1
	elif item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 4
	elif item == 4:
		item = 5
	elif item == 5:
		item = 6
	elif item == 6:
		item = 0
		
func swap_item_back():
	if item == 0:
		item = 6
	elif item == 6:
		item = 5
	elif item == 1:
		item = 0
	elif item == 2:
		item = 1
	elif item == 3:
		item = 2
	elif item == 4:
		item = 3
	elif item == 5:
		item = 4


func _on_right_pressed():
	swap_item_forwad()


func _on_buy_button_pressed():
	if item == 5:
		price = Global.item5price
		if Global.money >= price:
			Global.can_buy = true
			
			buy()
		else:
			Global.can_buy = false
	if item == 6:
		price = Global.item6price
		if Global.money >= price:
			Global.can_buy = true
			
			buy()
		else:
			Global.can_buy = false
	elif item == 0:
		price = Global.sword_price
		if Global.money >= price:
			Global.can_buy = true
			
			buy()
		else:
			Global.can_buy = false
	elif item == 1:
		price = Global.item1price
		if Global.money >= price:
			Global.can_buy = true
			
			buy()
		else:
			Global.can_buy = false
	elif item == 2:
		price =Global.item2price
		if Global.money >= price:
			Global.can_buy = true
			if Global.inv_slot_bible == 0:
				buy()
		else:
			Global.can_buy = false
	elif item == 3:
		price =Global.item3price
		if Global.money >= price:
			Global.can_buy = true
			if Global.inv_slot_potion == 0:
				buy()
		else:
			Global.can_buy = false
	elif item == 4:
		price = Global.item4price
		if Global.money >= price and Global.field_count < 6:
			Global.can_buy = true
			buy()
		else:
			Global.can_buy = false

