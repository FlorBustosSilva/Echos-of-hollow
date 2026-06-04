extends CharacterBody2D
class_name Player

var Speed = 300



@onready var AnimatedSprite = $SpriteAnimated
@export var Inventory: Inv

var last_direction = "Down"


func _ready() -> void:
	AnimatedSprite.play("Idle_Down")

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()


func get_input():
	var input_direction = Input.get_vector("Left","Right","Up","Down")
	
	if input_direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		update_animation("Idle")
		return
		
	if (abs(input_direction.x)>abs(input_direction.y)):
		
		if (input_direction.x>0):
			last_direction = "Right"
		else:
			last_direction = "Left"
			
	else:
		
		if (input_direction.y > 0):
			last_direction = "Down"
			
		else:
			last_direction = "Up"
			
	update_animation("Run")
	
	velocity = input_direction * Speed
		


func update_animation(state):
	AnimatedSprite.play(state+"_"+last_direction)


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		area.collect(Inventory)
