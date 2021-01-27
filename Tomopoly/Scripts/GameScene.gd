extends Node2D

onready var label = get_node("textoPruebas")

# En este script lo que tiene que pasar es que al apretar siguiente se haga:
#	Se mapea el actualGameMode con los posibles modos de juego
#	Se cambia el label.text a alguna prueba aleatoria de la lista de pruebas de ese modo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Al apretar el boton "Siguiente"
func _on_Button_pressed():
	label.text = Global.pruebasIngame[0]


func _on_hideMenu_pressed():
	z_index = 1
