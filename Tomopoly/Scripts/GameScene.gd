extends Node2D

onready var label = get_node("textoPruebas")


var parsedText = ""
var testName = ""
var usedNames = []
var rePlace

# En este script lo que tiene que pasar es que al apretar siguiente se haga:
#	Se mapea el actualGameMode con los posibles modos de juego
#	Se cambia el label.text a alguna prueba aleatoria de la lista de pruebas de ese modo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Al apretar el boton "Siguiente"
func _on_Button_pressed():
	if len(Global.pruebasPasadasAcumuladas) == 0: # Si estoy avanzando hacia lo desconocido
		Global.pruebasPasadas.append(label.text)
		
		# Aqui abajo es lo que hace que reciba la prueba con el formato de los _ como nombre
		#	y los reemplaze por nombres distintos
		parsedText = Global.pruebasIngame[Global.roundNumber % len(Global.pruebasIngame)]
		while parsedText.count("_") != 0:
			testName = Global.chooseName(Global.nameList, usedNames)
			rePlace = parsedText.find("_")
			parsedText[rePlace] = testName
			usedNames.append(testName)
		
		#TODO Agregar igual que arriba el reemplazo de categorias de cultura chupistica, nombres de equipo y todo
		
		usedNames = []
		Global.roundNumber += 1
		label.text = parsedText
		
	else: # Si estoy avanzando entre las que aprete volver
		Global.pruebasPasadas.append(label.text)
		label.text = Global.pruebasPasadasAcumuladas.pop_back()


func _on_hideMenu_pressed():
	z_index = 1


func _on_Back_pressed():
	if len(Global.pruebasPasadas) == 0:
		Global.firstTimeSideMenu = true
		get_tree().change_scene("res://Scenes/GameModes.tscn")
	else:
		Global.pruebasPasadasAcumuladas.append(label.text)
		label.text = Global.pruebasPasadas.pop_back()
