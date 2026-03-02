class_name Weapon
extends Node2D

@onready var _collision_shape = $CollisionShape2D

@export var attack_animation: String

func disable() -> void:
	_collision_shape.set_disable(true)

func enable() -> void:
	_collision_shape.set_disable(false)
