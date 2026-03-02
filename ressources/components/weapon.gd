class_name Weapon
extends Node2D

@onready var _collision_shape = $CollisionShape2D

# nom de l'animation donné lors de la création de l'animation
@export var attack_animation: String
# longueur de l'animation (en secondes)
@export var attack_length: float
# animation player qui contient l'animation
@export var animation_player: AnimationPlayer
# point autour duquel l'arme tourne
@export var rotation_point: Node2D

func attack() -> void:
	animation_player.play(attack_animation)

# Pour les attaques, l'animation devrait être utilisée pour activer/désactiver
# les hitboxes, pas les fonctions
func disable() -> void:
	_collision_shape.set_disable(true)

func enable() -> void:
	_collision_shape.set_disable(false)
