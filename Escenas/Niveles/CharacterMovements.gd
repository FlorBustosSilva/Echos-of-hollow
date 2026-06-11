extends CharacterBody2D

const SPEED = 200.0

@onready var animated_sprite = $Player

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
	
	velocity = direction.normalized() * SPEED
	move_and_slide()
	
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("run_right")
			else:
				animated_sprite.play("run_left")
		else:
			if direction.y > 0:
				animated_sprite.play("run_down")
			else:
				animated_sprite.play("run_up")
	else:
<<<<<<< HEAD
		anim_player.play("idle")
=======
		animated_sprite.play("idle") 
>>>>>>> 0ca6dde (health bar, boss added and loading screen)
