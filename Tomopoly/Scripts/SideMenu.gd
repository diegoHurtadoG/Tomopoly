extends Control

# Este script me va a servir para controlar el side menu

var menuShown = false
onready var playerInput = get_node("Panel/textAndButton/Names/playerName")
onready var nameBox = get_node("Panel/textAndButton/Names")


func _on_hideMenu_pressed():
	# Esta parte se encarga del movimiento
	if (menuShown == false):
		$movementFromSide.play("PanelMovementIn")
		menuShown = true
	else:
		$movementFromSide.play("PanelMovementOut")
		menuShown = false
	
	# Esta parte maneja la lista de nombres
	Global.nameList = []
	var vboxChild = nameBox.get_child_count()
	for i in range(1, vboxChild):
		var actualChild = nameBox.get_child(i)
		if actualChild.text != "":
			Global.nameList.append(actualChild.text)
	
	print(Global.nameList)


func _on_SideMenu_pressed():
	if (menuShown == false):
		$movementFromSide.play("PanelMovementIn")
		menuShown = true
	else:
		$movementFromSide.play("PanelMovementOut")
		menuShown = false


func _on_addPlayer_pressed():
	if Global.playerNumber == 16:
		#Aqui tirar un mensaje de que ya estan los maximo jugadores
		return
	var newLineEdit = LineEdit.new()
	Global.playerNumber += 1
	
	newLineEdit.rect_min_size = Vector2(300, 0)
	newLineEdit.placeholder_text = "Jugador " + str(Global.playerNumber)
	var customFont = playerInput.get_font("font")
	customFont.size = 20
	newLineEdit.add_font_override("font", customFont)
	
	nameBox.add_child(newLineEdit)
