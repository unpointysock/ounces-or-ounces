extends Node


const SAVES_INDEX = "user://saves.save"

var player_data = load("res://data/current_player_data.tres")

var is_player : bool = false
var current_save_folder : String

var rng = RandomNumberGenerator.new()


func get_saves_index() -> Array:
	var index_array = []
	var index = File.new()
	if (index.open(SAVES_INDEX, File.READ) == OK):
		while index.get_position() < index.get_len():
			var save = parse_json(index.get_line())
			index_array.append(save)
	return index_array


func save():
	print_debug(get_tree().root.get_child(1))
	print_debug(player_data.get_data_as_dict())
	var save_file = File.new()
	save_file.open(build_save_path(player_data.save_folder), File.WRITE)
	save_file.store_line(to_json(player_data.get_data_as_dict()))
	save_file.close()
	


func create_new_save_folder(player_name: String) -> String:
	rng.randomize()
	var new_random = rng.randi_range(1, 9999)
	var folder = Directory.new()
	var folder_name = build_folder_name(player_name, new_random)
	while folder.open(folder_name) == OK:
		folder_name = build_folder_name(player_name, new_random)
	folder.make_dir(folder_name)
	return folder_name


func build_folder_name(player_name: String, new_random: int) -> String:
	var folder_name = "user://" + str(new_random) + "_" + player_name
	return folder_name


func build_save_path(save_folder: String) -> String:
	var date_time = get_date_time_as_string()
	var path = (save_folder + "/" + date_time + ".save")
	print_debug(path)
	return path


func get_date_time_as_string() -> String:
	var date_time_dict = Time.get_datetime_dict_from_system()
	var date_time_string = ( str(date_time_dict.year) + "_" 
			+ str(date_time_dict.month) + "_" + str(date_time_dict.day)
			+ str(date_time_dict.hour) + "_" + str(date_time_dict.minute)
			+ "_" + str(date_time_dict.second))
	return date_time_string

