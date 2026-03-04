class_name FollowState
extends State

@export var this: CharacterBody2D
@export var speed: float
@export var stop_distance: int = 10

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if this && owner.player:
		var direction = owner.player.position - this.position
		owner.velocity = direction.normalized() * speed

		if direction.length() <= stop_distance:
			owner.velocity = Vector2.ZERO

			# joue l'animation idle seulement si elle ne joue pas déjà
			if owner.animated_sprite.animation != "idle":
				owner.animated_sprite.play("idle")
