import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
public void setup() {
  size(500, 500);
  arduino = new Arduino(this, Arduino.list()[0], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}
boolean unblocked = true;
int taps = 0;
public void draw() {
  background(192);
  int y = arduino.analogRead(5);
  ellipse(y, 2*y, y^2, y);
  if(y < 20 && unblocked) {
    unblocked = false;
    taps++;
    System.out.println(taps);
    textSize(50);
    fill(0);
    text("Tap!", 200, 200);
    fill(255);
  }
  if(y > 100)
    unblocked = true;
  if(frameCount > 600) {
    System.out.println("You were able to tap " + taps + " times in 10 seconds");
    noLoop();
  }
}
