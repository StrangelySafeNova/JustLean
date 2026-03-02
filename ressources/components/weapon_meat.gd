# Comprends le corps de l'arme (le sprite), son animation et sa hitbox
class_name WeaponMeat
extends Node2D

@export var animation_player: AnimationPlayer

func play(animation: String) -> void:
	animation_player.play(animation)
