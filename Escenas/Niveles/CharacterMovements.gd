extends CharacterBody2D

const SPEED = 300.0

@onready var sprite = $Sprite2D
@onready var anim_player = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	if velocity.length() > 0:
		anim_player.play("run")
		if direction.x != 0:
			anim_player.flip_h = direction.x < 0
	else:
		anim_player.play("IDLE")
