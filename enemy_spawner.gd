extends Node3D

@onready var main = get_tree().current_scene
var Enemy = preload("res://enemy.tscn")

@export var _enemy_count:int = 1
@export var _enemy_count_max:int = 70


func spawn():
	var enemy = Enemy.instantiate()
	main.add_child(enemy)
	enemy.transform.origin = transform.origin + Vector3(randf_range(-25, 25), randf_range(-15, 15), 0)


func _on_timer_timeout() -> void:
	for n in range(_enemy_count):
		spawn()


func _on_difficulty_timer_timeout() -> void:
	_enemy_count = min(_enemy_count+1, _enemy_count_max)
