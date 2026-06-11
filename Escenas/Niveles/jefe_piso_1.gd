extends CharacterBody2D

@export var velocidad = 120.0

var jugador

func _ready():
	jugador = get_node("../Jugador")
	$FireWorm.play("idle")

func _physics_process(delta):
	if jugador == null:
		return

	var direccion = (jugador.global_position - global_position).normalized()

	velocity = direccion * velocidad

	# Voltear el sprite según la dirección
	if direccion.x < 0:
		$FireWorm.flip_h = true
	elif direccion.x > 0:
		$FireWorm.flip_h = false

	# Cambiar animación
	if velocity.length() > 0:
		if $FireWorm.animation != "walk":
			$FireWorm.play("walk")
	else:
		if $FireWorm.animation != "idle":
			$FireWorm.play("idle")

	move_and_slide()
