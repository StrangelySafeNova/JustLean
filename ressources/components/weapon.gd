# Représente une arme, a obligatoirement besoin de :
# - rotation point (n'importe quel Node2D)
# - meat (qui contient le sprite, l'animation, hitbox, etc)
# la meat DOIT être enfant du rotation point
class_name Weapon
extends Node2D

@onready var _collision_shape = $CollisionShape2D

# nom de l'animation donné lors de la création de l'animation (dans meat)
@export var attack_animation: String
# longueur de l'animation (en secondes)
@export var attack_length: float
# la meat
@export var meat: WeaponMeat
# point autour duquel l'arme tourne
@export var rotation_point: Node2D
# distance entre le rotation point et la meat
@export var point_meat_distance: int
# Domage de l'arme
@export var damage: int

func _ready() -> void:
	meat.position.x = point_meat_distance
	meat.hitbox.damage = damage
	z_index = 7 # pour que les armes apparaisent au dessus des autres éléments
	

func attack() -> void:
	meat.play(attack_animation)

# Pour les attaques, l'animation devrait être utilisée pour activer/désactiver
# les hitboxes, pas les fonctions
func disable() -> void:
	_collision_shape.set_disable(true)

func enable() -> void:
	_collision_shape.set_disable(false)
