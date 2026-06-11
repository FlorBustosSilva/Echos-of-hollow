extends Node2D

func _ready():
	$Jugador.global_position = $Marker2D.global_position
