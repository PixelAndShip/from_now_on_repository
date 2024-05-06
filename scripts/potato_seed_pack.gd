extends StaticBody2D


var selected = false
var seed_id = 2
var dragging = false

func _ready():
	self.visible = false
	$AnimatedSprite2D.play("default")


func _process(delta):
	if Global.potato_seeds_bought == true:
		self.visible = true
	if dragging:
		self.position = get_global_mouse_position()
	if Input.is_action_just_pressed("pause"):
		dragging = false
		selected = false

func _on_button_button_down():
	if Input.is_action_just_pressed("attack") or Input.is_action_pressed("attack"):
		pass
	else:
		Global.plant_selected = seed_id
		selected = true
		dragging = true
	

func _on_button_button_up():
	selected = false
	dragging = false
