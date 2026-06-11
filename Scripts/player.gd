extends CharacterBody2D
class_name Player

var Speed = 300



@onready var AnimatedSprite = $SpriteAnimated
@export var Inventory: Inv

var is_attacking: bool = false
var last_direction: Vector2 = Vector2.DOWN


func _ready() -> void:
	AnimatedSprite.play("Idle_Down")

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Attack") and not is_attacking:
		attack()
	
	if is_attacking:
		velocity = Vector2.ZERO
		return
	
	get_input()
	process_animation()
	move_and_slide()


func get_input():
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	
	if input_direction != Vector2.ZERO:
		velocity = input_direction * Speed
		last_direction = input_direction
	else:
		velocity = Vector2.ZERO
	
	
	
	velocity = input_direction * Speed
		


func attack():
	is_attacking = true
	update_animation("Ataque", last_direction)
	
	print("Ataque")
	
	


func process_animation():
	if is_attacking:
		return
	if velocity != Vector2.ZERO:
		update_animation("Run",last_direction)
	else:
		update_animation("Idle",last_direction)


func update_animation(prefix: String,dir: Vector2)->void:
	if dir.x != 0:
		AnimatedSprite.flip_h = dir.x < 0
		AnimatedSprite.play(prefix+"_Right")
	elif dir.y < 0:
		AnimatedSprite.play(prefix+"_Up")
	elif dir.y > 0:
		AnimatedSprite.play(prefix+"_Down")
	


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		area.collect(Inventory)


func _on_sprite_animated_animation_finished() -> void:
	if is_attacking:
		is_attacking = false
