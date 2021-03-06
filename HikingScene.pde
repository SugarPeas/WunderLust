//----------------------------------------
//SKETCH CONTROLS HIKING SCENE
//---------------------------------------- 
class HikingScene extends BaseScene{
  
    
//----------------------------------------
//CONSTRUCTOR
//----------------------------------------  
HikingScene(PApplet pa){ super(pa); }
  
  
//---------------------------------------- 
//SCENE SETUP
//----------------------------------------
void begin()
{ 
  clearPort();
  
  //video init and setup
  myMovie = new JMCMovie(parent, "hiking.mp4", RGB);
  myMovie.play();
  
  //used to center video
  movieX = (displayWidth - 1920) / 2;
  movieY = (displayHeight - 1080) / 2;
  
  //animation init and setup
  gifAnimation = Gif.getPImages(parent, "hiking.gif");
  gifFrame = 0;
   
  //used to center animation
  gifX = (displayWidth - gifAnimation[0].width) / 2;
  gifY = (displayHeight - gifAnimation[0].height) / 2;
  
  //start timers
  savedPauseTime = millis();
  savedFadeTime = millis();
  
  //init for video progress bar
  progressY = displayHeight - 80;
}
  
  
  
//---------------------------------------- 
//DISPLAY THE SCENE
//----------------------------------------
void draw()
{ 
  background(0);
  interactiveVideo();
  super.draw();
}
 
 
//---------------------------------------- 
//CLEARS SERIAL PORT BUFFER
//----------------------------------------
void clearPort()
{ 
  hikePort.clear(); 
}


//---------------------------------------- 
//HANDLES ARDUINO INTERACTION
//----------------------------------------
void userInteraction()
{ 
  //if data is available...
  if(hikePort.available() > 0){
      val = hikePort.readStringUntil('\n'); //store data
      
      //trigger next video section
      if(val != null){
          //start playing video
          working = true;
          fadeIn = false;
          
          //restart timers
          savedPlayTime = millis();
          savedFadeTime = millis();
      }
  }
}



//---------------------------------------- 
//ADVANCE TO NEXT SCENE - CLIMBING
//----------------------------------------
void mousePress() 
{
  clearPort();
  myMovie.dispose(); 
  setScene(2);
}
  
}//end class
