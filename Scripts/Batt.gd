extends CharacterBody2D

const Speed = 200

var target = null

func _physics_process(delta: float) -> void:
	
	if target:
		_attack(delta)
	
	move_and_slide()
	
	


func _attack(delta: float):
	var direction = (target.position - position).normalized()
	position += direction * Speed * delta




func _on_signal_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target = body
