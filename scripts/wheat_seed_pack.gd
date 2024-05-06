extends StaticBody2D



var selected = false
var seed_id = 1
var dragging = false

func _ready():
	$AnimatedSprite2D.play("default")
	self.visible = false


func _process(delta):
	if Global.sword_started >= 1:
		self.visible = true
	if dragging == true and Global.just_attacked == false:
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
	
