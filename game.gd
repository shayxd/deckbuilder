extends Node2D
var=deck=[]

func _ready() -> void:
	deck=['brick','brick','brick','brick','brick','brick','draw1','draw1','draw1']



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cards/effectsdata.res")
