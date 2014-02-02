/*
 * Button Example
 *
 *   Spacebrew library button example that send and receives boolean messages.
 *
 */
import spacebrew.*;
float lastRun=0;
float waitTime=0;
boolean go;
long lastTime = 0;
String server="sandbox.spacebrew.cc";
String name="Go";
String description ="Freeze game server, sends out stop/go messages";

Spacebrew sb;

color color_on = color(255, 255, 50);
color color_off = color(255, 255, 255);
int currentColor = color_off;

void setup() {

  frameRate(240);
  size(500, 400);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers
  sb.addPublish( "stop/go", "boolean", true );


  // declare your subscribers
  sb.addSubscribe( "debug messages", "boolean" );

  // connect to spacebre
  sb.connect(server, name, description );
}

void draw() {
  if (millis()>(lastRun+waitTime)) {
    if (go == false) {
      go=true;
    }
    else {
      go=false;
    }
    GO();
    newWait();
    lastRun=millis();
  }
}

void GO() {
  // send message to spacebrew
  sb.send( "stop/go", go);
}


void newWait() {
  waitTime=random(5000,10000);
}

void onBooleanMessage( String name, boolean go ) {
  println("got bool message " + name + " : " + go);

  //  // update background color
  //  if (go == true) {
  //    currentColor = color_on;
  //  }
  //  else {
  //    currentColor = color_off;
}
