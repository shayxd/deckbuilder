extends Resource
class_name CardData
@export var id: String
@export var name: String
@export var description: String
@export var element: String
@export var cost_discard := 0
@export var free := false
@export var effects := [] # array of EffectData
@export var art: Texture2D
