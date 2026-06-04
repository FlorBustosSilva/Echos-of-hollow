extends CanvasLayer

@onready var Inventory = $Inventory


func _ready() -> void:
	Inventory.close()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Inventario"):
		if Inventory.isOpen:
			Inventory.close()
			
		else:
			Inventory.open()
