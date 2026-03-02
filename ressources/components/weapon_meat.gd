# Comprends le corps de l'arme (le sprite), son animation et sa hitbox
# la structure est très libre, il faut seulement avoir un animation player,
# une animation d'attaque et une hitbox, le reste peut être fait comme on le 
# désire
class_name WeaponMeat
extends Node2D

@export var animation_player: AnimationPlayer
@export var hitbox: HitBox

func play(animation: String) -> void:
	animation_player.play(animation)
