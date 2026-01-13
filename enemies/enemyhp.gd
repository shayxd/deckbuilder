extends ProgressBar
func _ready() -> void:
	%enemyhp.value=%enemy.enemy_hp



func _on_enemy_enemy_lost_hp() -> void:
	%enemyhp.value=%enemy.enemy_hp
