extends State

@export var this: CharacterBody2D
@export var player: CharacterBody2D
@export var weight: int


func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if this:
		var new_position = (player.position - this.position) / (weight * 10)
		this.position += new_position
		if new_position:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")
		
		if new_position.x < 0:
			animated_sprite.flip_h = true
		elif new_position.x > 0:
			animated_sprite.flip_h = false


