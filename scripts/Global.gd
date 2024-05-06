extends Node


var shielded = false
var bought_sword = false
var sword_started = 0
var reload_speed = 2
var field_count = 1

var just_attacked = false

var player_health = 100
var attack_damage = 20
var player_speed = 80

var max_knight_chance = 12


var score = 0
var player = null
var is_player_attacking = false
var node_creation_parent = null
var round = 0
var plant_round = false
var timer = 0

var plant_selected = 1 #1 wheat #2 potato
var num_of_potato = 0
var num_of_wheat = 0

var plant_round_timer = false
var money = 5





var item1price = 8
var item2price = 15
var item3price = 10
var item4price = 7
var item5price = 15
var item6price = 20
var sword_price = 5
var items_bought = 0

var inventory_open = false

var skipped = false
var back_to_menu = false

var price = 0
var can_buy = false
var bible_bought = false
var potato_seeds_bought = false
var potion_bought = false
var guitar_bought = false
var dumbbell_bought = false
var dumbbell_owned = false
var dumbbell_can_be_used = false
var flexing = false

var increase_slash_size = false

var round_read = true
var reading_story = false



var bible_can_be_used = false
var potion_can_be_used = false
var guitar_owned = false
var guitar_can_be_used = false
var music_being_played = false
var stunned_by_music = false
var currently_reading = false
var guitar_bought_once = false
var currently_workingout = false

var min_hit_chance = 1
var max_hit_chance = 50


var item1owned = false
var item2owned = false
var item3owned = false

var enemy_chance = 1

var inv_slot_1 = false
var inv_slot_2 = false
var inv_slot_3 = false
var inv_slot_4 = false

var inv_slot_bible = 0
var inv_slot_potion = 0
var inv_slot_dumbbell = 0
var inv_slot_guitar = 0

var bible_ult = false
var potion_ult = false
var dumbbell_ult = false
var guitar_ult = false

var selected = false
var dragging = false

var player_position = null
var mage_chance = 12
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location 
	return node_instance 
