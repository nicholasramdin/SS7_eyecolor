import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port

void setup() {
  size(1080, 700);
 
 
 
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] to match the port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }

  //draws black ellipse over white bg
  background(255);
  fill (0);
  ellipse (500, 400, 500, 500);
  //println (val); //prints to Processing console

  //set ranges of color values for smaller ellipses to change depending on pot val

  if (val>0 && val<50)
  {
    fill(76, 120, 176);
  } else if (val>51 && val<100)

  {
    fill(255);
  } else if (val>101 && val<200)

  {
    fill(40, 120, 180);
  } else if (val>201 && val<255)

  {
    fill(130, 50, 60);
  }

  // draws two smaller ellipses that move on the x-axis using potentiometer val and changes fill based on pot val

  ellipse(150+val, 300, 150, 150);
  ellipse(850-val, 300, 150, 150);
  println (val); //prints to Processing console
}
