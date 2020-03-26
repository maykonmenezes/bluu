extends Control

export var zone_text = "Fusion"
export var location = "Fusion"
var coins_counter = 0
var health_step = 4
var STATE = 0
var die_button = -1
enum {STATE_INGAME, STATE_PAUSE, STATE_DIE_BUTTONS, STATE_CHANGE_SCENE}

func _process(delta):
	if STATE == STATE_DIE_BUTTONS:
		if Input.is_action_just_pressed("jump_1"):
			die_button = 0
			STATE = STATE_CHANGE_SCENE
		elif Input.is_action_just_pressed("shoot_1"):
			die_button = 1
			STATE = STATE_CHANGE_SCENE
	elif STATE == STATE_CHANGE_SCENE:
		$'game_over/anim'.play("do")
		set_process(false)

func _ready():
	#s$'change_scene/zone'.text = zone_text
	$'change_scene/loc'.text = location
	update_health()

func update_health():
	var players = get_tree().get_nodes_in_group("player")
	$'hud/health/1/under'.rect_size.x = players[0].health_max * health_step
	$'hud/health/1/line'.rect_size.x = players[0].health * health_step

func update_coins():
	coins_counter += 1 
	$'hud/health/1/coins'.text = str(coins_counter)

func _on_checker_timeout():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() <= 0:
		$'game_over/anim'.play("game_over")
		$'checker'.stop()

func on_final():
	var coins = get_tree().get_nodes_in_group("coin")
	if coins_counter >= 34:
		get_tree().call_group('final', 'finish')
		$'game_over2/anim'.play("game_over")
		$'game_over2/'
		$'checker'.stop()
	else:
		$'hud/health/1/tip'.text = "You left some coins"
		$'hud/health/1/anim'.play("anim")

func die_menu_end():
	if die_button == 0:
		get_tree().change_scene("res://Scenes/fusion.tscn")
	elif die_button == 1:
		get_tree().quit()

func die_menu_buttons():
	STATE = STATE_DIE_BUTTONS
	set_process(true)
