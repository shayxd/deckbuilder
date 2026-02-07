extends ProgressBar
@onready var enemy = get_parent()

func _ready() -> void:
	max_value = enemy.enemy_hp
	value = enemy.enemy_hp
	enemy.enemy_lost_hp.connect(_on_enemy_enemy_lost_hp)

func _on_enemy_enemy_lost_hp() -> void:
	value = enemy.enemy_hp
