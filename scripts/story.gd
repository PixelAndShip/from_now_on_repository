extends Control





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.plant_round != true:
		self.visible = false
	else:
		self.visible = true
		
	if Global.round == 1 and Global.plant_round == true and Global.round_read == false:
		$round1sotry.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 2 and Global.plant_round == true and Global.round_read == false:
		$round2sotry.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 3 and Global.plant_round == true and Global.round_read == false:
		$round3sotry.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 4 and Global.plant_round == true and Global.round_read == false and Global.score <= 0:
		$round4sotryGOOD.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 4 and Global.plant_round == true and Global.round_read == false and Global.score > 0:
		$round4sotryEVIL.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 5 and Global.plant_round == true and Global.round_read == false and Global.score > 0:
		$round5sotryEVIL.visible= true
		$Button.visible = true
		Global.reading_story = true
	if Global.round == 5 and Global.plant_round == true and Global.round_read == false and Global.score <= 0:
		$round5sotryGOOD.visible= true
		$Button.visible = true
		Global.reading_story = true
	
func _on_button_pressed():
	if $round1sotry.visible == true:
		Global.round_read = true
		$round1sotry.visible = false
		$Button.visible = false
	if $round2sotry.visible == true:
		Global.round_read = true
		$round2sotry.visible = false
		$Button.visible = false
	if $round3sotry.visible == true:
		Global.round_read = true
		$round3sotry.visible = false
		$Button.visible = false
	if $round4sotryEVIL.visible == true:
		Global.round_read = true
		$round4sotryEVIL.visible = false
		$Button.visible = false
	if $round4sotryGOOD.visible == true:
		Global.round_read = true
		$round4sotryGOOD.visible = false
		$Button.visible = false
	if $round5sotryGOOD.visible == true:
		Global.round_read = true
		$round5sotryGOOD.visible = false
		$Button.visible = false
	if $round5sotryEVIL.visible == true:
		Global.round_read = true
		$round5sotryEVIL.visible = false
		$Button.visible = false
