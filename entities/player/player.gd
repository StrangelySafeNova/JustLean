extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var weapon: Weapon

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	# bouger l'arme
	rotate_weapon()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	var ydirection := Input.get_axis("up", "down")
	var direction: Vector2 = Vector2(xdirection, ydirection).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		animated_sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite.play("idle")
	
	if direction.x < 0:
		animated_sprite.flip_h = true
	elif direction.x > 0:
		animated_sprite.flip_h = false
		
	velocity.normalized()

	# pour tout qui n'est pas le mouvement
	handle_input()

	move_and_slide()


func handle_input() -> void:
	if Input.is_action_just_pressed("attack") && weapon != null:
		attack()

func attack() -> void:
	weapon.attack()

func rotate_weapon() -> void:
	if (weapon != null &&
	weapon.rotation_point != null &&
	!weapon.meat.animation_player.is_playing()):
		weapon.rotation_point.look_at(get_global_mouse_position())
