extends Control

var pending_card: CardData
var pending_card_ui: Control
var discard_needed: int
var discard_mode=false


func play_card(card: CardData, card_view):
	if %player.plays_left <= 0:
		return
	
	if %player.hand.size() - 1 < card.cost:
		return # not enough cards to discard

	# enter discard-selection mode
	pending_card = card
	discard_needed = card.cost_discard

	%hand_ui.enter_discard_mode(discard_needed)


func enter_discard_mode(amount):
	discard_mode = true
	discard_needed = amount

func on_discard_selected(card: CardData, card_ui):
	if not discard_mode:
		return
	
	# prevent discarding the played card
	if card == pending_card:
		return
	
	%player.hand.erase(card)
	%player.discard.append(card)
	%player.card_ui.queue_free()

	discard_needed -= 1
	
	if discard_needed <= 0:
		resolve_pending_card()
func resolve_pending_card():
	discard_mode = false
	%player.plays_left -= 1

	# apply effect
	%enemy.take_damage(pending_card.damage)

	# move played card to discard
	%player.hand.erase(pending_card)
	%player.discard.append(pending_card)
	%player.pending_card_ui.queue_free()

	pending_card = null
	pending_card_ui = null
