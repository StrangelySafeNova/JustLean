class_name DeathState
extends State

@export var animation_name: String = "death"

func enter() -> void:
	owner.queue_free()

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

