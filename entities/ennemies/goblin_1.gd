extends CharacterBody2D

@export var health: int
@export var weight: int

@onready var player = %Player
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# TODO: finite state machine
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var new_position = (player.position - position) / (weight * 10)
	position += new_position
	if new_position:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	if new_position.x < 0:
		animated_sprite.flip_h = true
	elif new_position.x > 0:
		animated_sprite.flip_h = false

func take_damage(damage: int) -> void:
	health -= damage
	print("Damage taken:", damage)
	print("Current health:", health)

	if health <= 0:
		die()
	
func die() -> void:
	queue_free()
