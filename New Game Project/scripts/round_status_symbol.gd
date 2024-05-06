extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$round_status_symbol.play("plants")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.plant_round == true:
		$round_status_symbol.play("plants")
	if Global.plant_round != true:
		$round_status_symbol.play("fights")
