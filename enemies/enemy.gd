extends Node2D


var enemy_hp = 50
var element_state := {}
signal enemy_lost_hp
func take_damage(amount):
	enemy_hp -= amount
	enemy_lost_hp.emit()
	if enemy_hp <= 0:
		die()
func act():
	%player.take_damage(10)
func die():
	queue_free()
