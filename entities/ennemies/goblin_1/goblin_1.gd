extends CharacterBody2D

@export var health: int
@export var state_machine: FiniteStateMachine

@onready var player = %Player
@onready var animated_sprite = %AnimatedSprite2D

var dead = false

func _physics_process(_delta: float) -> void:
	if velocity.length() > 0:
		animated_sprite.play("walk")
	
	if velocity.x < 0:
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.flip_h = false

	move_and_slide()

func take_damage(damage: int) -> void:
	health -= damage

	if health <= 0:
		state_machine.current_state.Transitioned.emit(state_machine.current_state, "death")
