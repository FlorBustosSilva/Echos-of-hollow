extends Control


signal opened
signal closed

var isOpen: bool = false

@onready var Inventory: Inv = preload("res://Inventario/Player_Inv.tres")
@onready var Slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready() -> void:
	Inventory.updated.connect(update)
	update()


func update():
	for i in range(min(Inventory.items.size(), Slots.size())):
		Slots[i].update(Inventory.items[i])


func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()
