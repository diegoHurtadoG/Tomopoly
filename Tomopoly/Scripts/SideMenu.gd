extends Control

# Este script me va a servir para controlar el side menu

var menuShown = false



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
