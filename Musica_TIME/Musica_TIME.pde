import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

int x = 0;
int y = 50;

float rad;
float level;

void setup() {
  size(800, 800);
  background(0);
  frameRate(60); // Reducir a un valor más razonable
  
  minim = new Minim(this);
  player = minim.loadFile("time.mp3", 1024); // Corrección del método
  player.play(); // Iniciar la reproducción
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
}

void draw() {
  background(0, 20); // Suaviza el rastro de los círculos

  fft.forward(player.mix);
  level = player.mix.level(); // Obtener el nivel real del audio
  rad = level * width; // Ajustar tamaño según volumen

  float r = random(0, 100);
  float g = random(100, 255);
  float b = random(200, 255);
  
  stroke(r, g, b);
  fill(255, 50); // Mejor visibilidad
  ellipse(x, y, rad, rad);
  
  x += 5; // Movimiento más fluido

  if (x > width) {
    x = 0;
    y += 80;
  }
  if (y > height) {
    y = 0;
  }
}
