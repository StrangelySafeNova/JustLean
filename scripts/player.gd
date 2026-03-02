extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("ui_left", "ui_right")
	var ydirection := Input.get_axis("ui_up", "ui_down")
	var direction: Vector2 = Vector2(xdirection, ydirection).normalized()

	if direction.x:
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

	move_and_slide()
