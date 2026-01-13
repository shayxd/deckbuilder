extends Node
var draw_pile = []
var discard_pile = []
var exhaust_pile = []
var hand = []
var handsize=5
var playerhp=100
var empty_deck_damage=25

func _ready() -> void:
	%hp.value=playerhp
	player_turn_start()

func player_turn_start():
	draw(handsize)

func player_end_turn():
	for c in hand:
		discard_pile.append(c)
	hand.clear()
	enemy_turn()

func enemy_turn():
	enemy.act()
	player_turn_start()
func draw(n := 1):
	for i in n:
		if draw_pile.is_empty():
			reshuffle()
		if draw_pile.is_empty():
			return
		hand.append(draw_pile.pop_back())

func reshuffle():
	draw_pile = discard_pile
	discard_pile = []
	draw_pile.shuffle()
	
func discard_random():
	var c = hand.pick_random()
	hand.erase(c)
	discard_pile.append(c)
func apply_effect(card: Card):
	match card.effect:
		"apply_element":
			enemy.element_state[card.element] = enemy.element_state.get(card.element, 0) + card.value

		"conditional_damage":
			if enemy.element_state.get(card.element, 0) > 0:
				enemy.take_damage(card.value)
				
func check_empty_deck():
	if draw_pile.is_empty() and hand.is_empty():
		trigger_empty_deck_damage()
