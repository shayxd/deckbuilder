extends Node2D
var draw_pile = ["Brick",'Brick','Brick','Brick','Brick','Brick','draw1','draw1','draw1','draw1']
var discard_pile = []
var exhaust_pile = []
var hand = []



func draw(n := 1):
	for i in n:
		if draw_pile.is_empty():
			trigger_empty_deck_damage()
			reshuffle()
		if draw_pile.is_empty():
			return
		hand.append(draw_pile.pop_back())

func reshuffle():
	draw_pile = discard_pile
	discard_pile = []
	draw_pile.shuffle()

func trigger_empty_deck_damage():
	%enemy.take_damage(5)
