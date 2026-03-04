extends CharacterBody2D

@export var health: int

@onready var player = %Player
@onready var animated_sprite = %AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(player)

# TODO: finite state machine
# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	print("Damage taken:", damage)
	print("Current health:", health)

	if health <= 0:
		die()
	
func die() -> void:
	queue_free()
