//----------------------------------------
//SKETCH CONTROLS INTRO MONTAGE
//---------------------------------------- 
class MontageScene extends BaseScene{

  
//---------------------------------------- 
//CONSTRUCTOR
//----------------------------------------
MontageScene(PApplet pa){ super(pa); }


//---------------------------------------- 
//SCENE SETUP
//----------------------------------------
void begin()
{
  //video init and setup
  myMovie = new JMCMovie(parent, "introMontage.mp4", RGB);
  myMovie.loop();
  
  //used to center video
  movieX = (displayWidth - 3840) / 2;
  movieY = (displayHeight - 1024) / 2;
}


//---------------------------------------- 
//DISPLAY THE SCENE
//----------------------------------------
void draw()
{
  background(0);
  super.draw();
    
  //display frame
  tint(255, movieTransparency);
  image(myMovie, 0, 0);
}


//---------------------------------------- 
//ADVANCE TO NEXT SCENE - HIKING
//----------------------------------------
void mousePress() 
{
  myMovie.dispose(); 
  setScene(1);
}
  
}//end class
