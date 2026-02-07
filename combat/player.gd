extends Node
var draw_pile = []
var discard_pile = []
var exhaust_pile = []
var hand = []

var playerhp=100
var empty_deck_damage=25
var draw_pile_size = 0
var discard_pile_size=0
var max_plays_per_turn=10
var plays_left=0
var new_card=CardData
func _ready() -> void:
	draw_pile.clear()
	draw_pile.append_array([
		"brick",
		"brick",
		"brick",
		"draw1",
		"draw1"
	])

	%hp.value=playerhp
	draw_pile.shuffle()
	player_turn_start()

func player_turn_start():
	plays_left = max_plays_per_turn
	%hand_ui.draw(5)

func player_end_turn():
	for c in hand:
		discard_pile.append(c)
		update_discard_pile_size()
	hand.clear()
	enemy_turn()

func enemy_turn():
	%enemy.act()
	player_turn_start()



func update_draw_pile_size():
	draw_pile_size = draw_pile.size()
	%deckcounter.text= str(draw_pile.size())

func reshuffle():
	draw_pile = discard_pile
	discard_pile = []
	draw_pile.shuffle()
	update_draw_pile_size()
func discard_random():
	var c = hand.pick_random()
	hand.erase(c)
	discard_pile.append(c)
	update_discard_pile_size()

func take_damage(amount):
	playerhp -= amount

func update_discard_pile_size():
	discard_pile_size=discard_pile.size()
				
func check_empty_deck():
	if draw_pile.is_empty() and hand.is_empty():
		deal_damage(empty_deck_damage)
func deal_damage(damage):
	%enemy.take_damage(damage)
