extends State

@export var this: CharacterBody2D
@export var speed: float

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if this && owner.player:
		owner.velocity = (owner.player.position - this.position).normalized() * speed
