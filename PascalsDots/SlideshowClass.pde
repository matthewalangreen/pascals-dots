// Slideshow Class Definition
// Version 1.1
// Matthew Green
// May 29, 2017
// ***************************
class Slideshow
{
  // data  
  ArrayList<String> slides;
  int numSlides;
  
  // constructor 
  Slideshow() {
   slides = new ArrayList<String>();
   numSlides = 0;
  }
  
  // methods
  void addSlide() {
    numSlides++;
    String temp = "pics/"+numSlides+".png";
    slides.add(temp);
    save(temp);
  }
 
  PImage slideAtIndex(int index) {
   return loadImage(slides.get(index)); 
  }
  
  String slidePathAtIndex(int index) {
   return slides.get(index); 
  }
  
  int size() { 
    return slides.size(); 
  }
  
}// end of SlideShow Class 
 

// *************** End of SlideShow Class ************************* //