extends Control

# Este script me va a servir para controlar el side menu

var menuShown = false
onready var playerInput = get_node("Panel/textAndButton/Names/nameContainer/playerName")
onready var nameBox = get_node("Panel/textAndButton/Names")


func _on_hideMenu_pressed():
	if (menuShown == false):
		$movementFromSide.play("PanelMovementIn")
		menuShown = true
	else:
		$movementFromSide.play("PanelMovementOut")
		menuShown = false


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
	var newHBoxContainer = HBoxContainer.new()
	var newDeleteButton = Button.new()
	var newLineEdit = LineEdit.new()
	Global.playerNumber += 1
	
	newLineEdit.rect_min_size = Vector2(300, 0)
	newLineEdit.placeholder_text = "Jugador " + str(Global.playerNumber)
	var customFont = playerInput.get_font("font")
	customFont.size = 20
	newLineEdit.add_font_override("font", customFont)
	
	newDeleteButton.text = "X"
	newDeleteButton.add_font_override("font", customFont)
	
	newHBoxContainer.add_child(newLineEdit)
	newHBoxContainer.add_child(newDeleteButton)
	nameBox.add_child(newHBoxContainer)
