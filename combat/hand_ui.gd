extends HBoxContainer
var handsize=5
@export var card_view: PackedScene
var new_card=""
func _ready():
	# Optional: Draw initial cards for testing
		draw(1)
func draw(n := 1):
	for i in n:
		if %player.draw_pile.is_empty():
			%player.check_empty_deck()
			%player.reshuffle()		
		if %player.draw_pile.is_empty():
			return
		new_card=%player.draw_pile.pop_back()
		%player.update_draw_pile_size()
		var card = card_view.instantiate(Cardsdb.get_card(new_card))



func enter_discard_mode(amount):
	for card_view in get_children():
		card_view.set_discard_highlight(true)
