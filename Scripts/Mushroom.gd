extends CharacterBody2D

const Speed = 150

var target = null

@onready var animated_enemie: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if target:
		_attack(delta)
		
	move_and_slide()

func _attack(delta: float)->void:
	var direction = (target.position - position).normalized()
	position += direction * Speed * delta
	#animated_enemie.play("attack")

func _on_sight_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target = body
		animated_enemie.play("Walk")


func _on_sight_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		target = null
		animated_enemie.play("Idle")
