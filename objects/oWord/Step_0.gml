// gentle bob
float_t += 0.05;
y += sin(float_t) * 0.3;

// fade in
alpha = clamp(alpha + 0.02, 0, 1);