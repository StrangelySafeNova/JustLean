extends RigidBody2D

@export var health: int

@onready var player = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage: int) -> void:
	health -= damage
	print("Damage taken:", damage)
	print("Current health:", health)

	if health <= 0:
		die()
	
func die() -> void:
	print("Goblin died")
	health = 20
