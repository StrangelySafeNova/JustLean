class_name HurtBox
extends Area2D

signal recieve_damage(damage: int)

func _init() -> void:
	collision_layer = 0
	collision_mask = 2

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		if owner.has_method("take_damage"):
			owner.take_damage(hitbox.get_damage())
			recieve_damage.emit(hitbox.get_damage())
