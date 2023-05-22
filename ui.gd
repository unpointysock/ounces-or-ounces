extends Control


signal new_player_named(player_name)


func _on_NewGameButton_pressed():
	$StartMenu/StartMenuButtons.hide()
	$StartMenu/CreatePlayerMenu.show()


func _on_CreatePlayerButton_pressed():
	emit_signal("new_player_named", $StartMenu/CreatePlayerMenu/NameInput.text)
	$StartMenu/CreatePlayerMenu.hide()
	$StartMenu/GameTitleLabel.hide()

# iirc there's a better way to do this, but it works for now
func _on_QuitButton_pressed():
	get_tree().quit()
