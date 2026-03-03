extends State

@export var this: CharacterBody2D
@export var weight: int

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if this && owner.player:
		var new_position = (owner.player.position - this.position) / (weight * 10)
		this.position += new_position
		if new_position:
			owner.animated_sprite.play("walk")
		else:
			owner.animated_sprite.play("idle")
		
		if new_position.x < 0:
			owner.animated_sprite.flip_h = true
		elif new_position.x > 0:
			owner.animated_sprite.flip_h = false
