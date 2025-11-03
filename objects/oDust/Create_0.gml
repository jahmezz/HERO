x = random(room_width);
y = random(room_height);

dir = irandom_range(0, 359);            // initial direction
spd = random_range(0.1, 0.4);           // slightly faster now
turn_rate = random_range(0.1, 0.5);     // how fast it meanders

alpha = random_range(0.3, 0.7);
size = random_range(0.8, 1.5);
pulse = random(360);

depth = -1; // behind hero

