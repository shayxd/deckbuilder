extends Node2D

class_name CardDatabase

var cards := {} # id -> CardData

func _ready():
	load_all_cards()

func load_all_cards():
	var dir = DirAccess.open("res://cards/")
	if dir == null:
		push_error("Card data directory not found")
		return

	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if file.ends_with(".tres"):
			var card := load("res://cards/" + file) as CardData

			if card and card.id != "":
				cards[card.id] = card
		file = dir.get_next()
	dir.list_dir_end()

func get_card(id: String) -> CardData:
	return cards.get(id)
