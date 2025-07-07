// Exit if player isn't loaded
if !instance_exists(oPlayer) { exit; }

// Camera Size
var camHeight = camera_get_view_height(view_camera[0]);
var camWidth = camera_get_view_width(view_camera[0]);

// Camera Coordinates centered on the player
var camX = oPlayer.x - camWidth / 2;
var camY = oPlayer.y - camHeight / 2;

// Room Border Constraints (to keep the camera inside the room)
camX = clamp(camX, 0, room_width - camWidth);
camY = clamp(camY, 0, room_height - camHeight);

// Check all left blockers
with (oCameraLeftBlocker) {
    if (bbox_right > camX && bbox_right < camX + camWidth && !(bbox_bottom < camY || bbox_top > camY + camHeight)) {
        camX = max(camX, bbox_right); // Adjust camX only if within range
    }
}

// Check all right blockers
with (oCameraRightBlocker) {
    if (bbox_left < camX + camWidth && bbox_left > camX && !(bbox_bottom < camY || bbox_top > camY + camHeight)) {
        camX = min(camX, bbox_left - camWidth); // Adjust camX only if within range
    }
}

// Check all up blockers
with (oCameraUpBlocker) {
    if (bbox_bottom > camY && bbox_bottom < camY + camHeight && !(bbox_right < camX || bbox_left > camX + camWidth)) {
        camY = max(camY, bbox_bottom); // Adjust camY only if within range
    }
}

with (oCameraDownBlocker) {
    if (bbox_top < camY + camHeight && bbox_top > camY && !(bbox_right < camX || bbox_left > camX + camWidth)) {
        camY = min(camY, bbox_top - camHeight);
    }
}

// Camera Smoothing
finalCamX += (camX - finalCamX) * camTrailSpd;
finalCamY += (camY - finalCamY) * camTrailSpd;

// Camera Position Setup
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);