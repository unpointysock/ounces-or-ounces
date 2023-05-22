extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum states {
	START_MENU,
	PAUSE_MENU,
	PLAY
}

var state

export (Resource) var current_player_data

# Called when the node enters the scene tree for the first time.
func _ready():
	state = states.START_MENU
	SaveLoad.is_player = false
	$UI.connect("new_player_named", self, "create_new_player")
	print_debug(current_player_data.get_data_as_dict())	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (state == states.START_MENU) :
#		print_debug(state)
		pass
	if (state == states.PAUSE_MENU) :
		pass
	if (state == states.PLAY) :
		pass

# create the save folder (outputs its name), update the player data, save
func create_new_player(player_name: String):
	print_debug(player_name)
	
	var save_folder = SaveLoad.create_new_save_folder(player_name)

	current_player_data.set("save_folder", save_folder)
	current_player_data.set("player_name", player_name)
	current_player_data.set("l1_completed", false)
	current_player_data.set("l2_completed", false)
	current_player_data.set("l3_completed", false)
	current_player_data.set("l4_completed", false)
	current_player_data.set("l5_completed", false)

	SaveLoad.save()

