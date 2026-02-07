extends Label

@onready var darw_pile_size=%player
@onready var decklabel=%deckcounter

# Use this method to set text
func _ready():
	text=str(%player.draw_pile_size)
