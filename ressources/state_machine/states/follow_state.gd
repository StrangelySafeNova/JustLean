class_name FollowState
extends State

@export var this: CharacterBody2D
@export var speed: float

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
