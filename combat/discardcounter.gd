extends Label

var _target_object
var _target_property

# Use this method to set text
func bind_text(target_object, target_property):
	_target_object = target_object
	_target_property = target_property

func _process(_delta: float) -> void:
	text = str(_target_object.get(_target_property))extends Label
