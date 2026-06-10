extends CharacterBody2D
class_name Player

var Speed = 300

@onready var AnimatedSprite = $SpriteAnimated
@onready var attackbox = $Attackbox
@export var Inventory: Inv

var last_direction: Vector2 = Vector2.DOWN
var is_attacking: bool = false
var attackbox_offset: Vector2



func _ready() -> void:
	
	
	AnimatedSprite.play("Idle_Down")
	
	attackbox_offset = attackbox.position
	

func _physics_process(delta: float) -> void:
	
	attackbox.monitoring = false
	
	if Input.is_action_just_pressed("Attack") and not is_attacking:
		attack()
	
	if is_attacking:
		velocity = Vector2.ZERO
		return
	
	get_input()
	process_animation()
	move_and_slide()


func get_input():
	var direction := Input.get_vector("Left","Right","Up","Down")
	
	if direction != Vector2.ZERO:
		velocity = direction * Speed
		last_direction = direction
		update_hitbox_offset()
	else:
		velocity = Vector2.ZERO
	
	
	process_animation()
	


func attack() -> void:
	is_attacking = true
	attackbox.monitoring = true
	play_animation("Attack", last_direction)
	
	print("ataque")

func process_animation()->void:
	if is_attacking:
		return
	if velocity != Vector2.ZERO:
		play_animation("Run", last_direction)
	else:
		play_animation("Idle", last_direction)



func play_animation(prefix: String ,dir: Vector2) -> void:
	if dir.x!=0:
		AnimatedSprite.flip_h = dir.x < 0
		AnimatedSprite.play(prefix + "_Right")
	elif dir.y < 0:
		AnimatedSprite.play(prefix + "_Up")
	elif dir.y > 0:
		AnimatedSprite.play(prefix + "_Down")


func update_hitbox_offset():
	var x := attackbox_offset.x
	var y := attackbox_offset.y
	
	match last_direction:
		Vector2.LEFT:
			attackbox.position = Vector2(-x,y)
		Vector2.RIGHT:
			attackbox.position = Vector2(x,y)
		Vector2.UP:
			attackbox.position = Vector2(y,-x)
		Vector2.DOWN:
			attackbox.position = Vector2(-y,x)





func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		area.collect(Inventory)




func _on_sprite_animated_animation_finished() -> void:
	if is_attacking:
		is_attacking = false


func _on_attackbox_body_entered(body: Node2D) -> void:
	if is_attacking:
		print("hit")
