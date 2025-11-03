// drift
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// gentle wrap-around
if (x < 0) x += room_width;
if (x > room_width) x -= room_width;
if (y < 0) y += room_height;
if (y > room_height) y -= room_height;

// pulse animation
pulse += 0.02;

// wrap around screen
if (x < 0) x += room_width;
if (x > room_width) x -= room_width;
if (y < 0) y += room_height;
if (y > room_height) y -= room_height;