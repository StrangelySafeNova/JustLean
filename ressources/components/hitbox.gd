class_name HitBox
extends Area2D

@export var damage: int

func set_damage(new_damage: int) -> void:
	damage = new_damage

func get_damage() -> int:
	return damage

func _init() -> void:
	collision_layer = 2
	collision_mask = 0
