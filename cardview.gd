
extends Control
class_name CardView
signal played(card_view)
signal discard_selected(card_data: CardData, card_view: CardView)
@onready var name_label: Label = $Name
@onready var description_label: Label = $Description
@onready var art_texture: TextureRect = $Art

var data: CardData = null
func _ready():
	custom_minimum_size = Vector2(100, 150)


func setup(card_data: CardData):
	data = card_data
	$Name.text = data.name
	$Description.text = data.description
	$Art.texture = data.art

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if %UI.discard_mode:
			emit_signal("discard_selected", data, self)
		else:
			emit_signal("played", self)

func set_discard_highlight(active: bool):
	modulate = Color(1, 0.7, 0.7) 
