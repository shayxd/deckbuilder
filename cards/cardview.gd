extends Control
class_name CardView

signal played(card_view)

var data: CardData

func setup(card_data: CardData):
	data = card_data
	$Name.text = data.name
	$Description.text = data.description
	$Art.texture = data.art

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("played", self)
