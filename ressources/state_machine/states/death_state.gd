class_name DeathState
extends State

@export var animation_name: String = "death"

var death_position: Vector2

func enter() -> void:
	# Disable collision
	owner.collision_layer = 0
	# Save death position
	death_position = owner.position
	# Resets velocity so that walking animation does not play
	owner.velocity = Vector2.ZERO

	owner.animated_sprite.play(animation_name)
	await owner.animated_sprite.animation_finished
	owner.queue_free()

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	owner.velocity = Vector2.ZERO
	owner.position = death_position
