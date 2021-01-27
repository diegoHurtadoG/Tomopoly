extends Node2D


#Este script es el del template, solo tiene el boton back, que lo que deberia hacer es
#	Si estoy jugando, cambio a la prueba anterior segun la lista de pruebas hechas
#	Si ya estoy en la ultima prueba, podria no hacer nada o ir al menu

var count = 0
onready var nameContainer = get_node("Control/Panel/textAndButton/Names")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Back_pressed():
	# Aqui se puede hacer un try/catch para el problema de que el ultimo back cambia a otra escena
	get_tree().change_scene(Global.prevScene)
	# Aqui tengo que hacer que en el label ponga la prueba pasada guardad en la lista de global
	pass



func _on_SideMenu_pressed():
	z_index = 1 #Esta parte sirve para que se vea el menu
	
	# Aqui abajo es para que los nombres aparezcan en la lista
	if len(Global.nameList) == 0:
		pass
	else:
		var firstPlayerLE = get_node("Control/Panel/textAndButton/Names/playerName")
		firstPlayerLE.text = Global.nameList[0]
		count += 1
		var customFont = firstPlayerLE.get_font("font")
		customFont.size = 20
		if Global.firstTimeSideMenu:
			for name in Global.nameList:
				if count == 1:
					count += 1
					continue
				var addedName = LineEdit.new()
				addedName.add_font_override("font", customFont)
				addedName.text = name
				count += 1
				nameContainer.add_child(addedName)
				Global.firstTimeSideMenu = false
		else:
			pass


func _on_hideMenu_pressed():
	z_index = 0
