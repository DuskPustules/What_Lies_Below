for (var i = 0; i < ds_list_size(global.HPupgradeLocations); i++) {
    var HPdata = global.HPupgradeLocations[| i];
    if HPdata[? "room"] == room {
		instance_destroy(oHPExpansion);
    }
}