void keyPressed()
{
  // 1 dot keys... there are lots!
  if (key == 'a') { 
    keys[0] = true; makeDot(); first.trigger();
  } 
  if (key == 'b') { 
    keys[1] = true; makeDot(); first.trigger();
  } 
  if (key == 'c') { 
    keys[2] = true; makeDot(); first.trigger();
  } 
  if (key == 'd') { 
    keys[3] = true; makeDot(); first.trigger();
  } 
  if (key == 'f') { 
    keys[5] = true; makeDot(); first.trigger();
  } 
  if (key == 'g') { 
    keys[6] = true; makeDot(); first.trigger();
  } 
  if (key == 'j') { 
    keys[9] = true; makeDot(); first.trigger();
  } 
  if (key == 'k') { 
    keys[10] = true; makeDot(); first.trigger();
  } 
  if (key == 'o') { 
    keys[14] = true; makeDot(); first.trigger();
  } 
  if (key == 'p') { 
    keys[15] = true; makeDot(); first.trigger();
  } 
  if (key == 'u') { 
    keys[20] = true; makeDot(); first.trigger();
  }  // end of 1 dot makers
  
  // 2 dots
  if (key == 'e') { 
    keys[4] = true; makeDots(2); two.trigger();
  } 
  
  // 3 dots
   if (key == 'h') { 
    keys[7] = true; makeDots(3); three.trigger();
  } 
  if (key == 'i') { 
    keys[8] = true; makeDots(3); three.trigger();
  } 
  
  // 4 dots
  if (key == 'l') { 
    keys[11] = true; makeDots(4); four.trigger();
  } 
  if (key == 'n') { 
    keys[13] = true; makeDots(4); four.trigger();
  } 
  
  // 5 dots
  if (key == 'q') { 
    keys[16] = true; makeDots(5); five.trigger();
  } 
  if (key == 't') { 
    keys[19] = true; makeDots(5); five.trigger();
  }
  
  // 6 dots
  if (key == 'm') { 
    keys[12] = true; makeDots(6); six.trigger();
  } 
  
  // 10 dots
  if (key == 'r') { 
    keys[17] = true; makeDots(10); ten.trigger();
  } 
  if (key == 's') { 
    keys[18] = true; makeDots(10); ten.trigger();
  } 
  
  // get next curve
  //if (key == 'v') { 
  //  keys[21] = true; 
  //  // switch to new curve
  //  aValsIndex++;
  //  if(aValsIndex > aVals.length-1) {
  //   aValsIndex = 0;
  //  }
  //  myGraph.calculateValuePairs(aVals[aValsIndex]); 
  //} 
  
  // get random curve
  if(key == 'v') {
    int t = (int)random(0,aVals.length-1);
    myGraph.calculateValuePairs(aVals[t]);
  }
  
  // black/white toggle background color
  if (key == 'w') { 
    keys[22] = true;
    isBlack = !isBlack;
    if (isBlack) {
      bg = color(0);
    } else {
      bg = color(246);
    }
  } 
  
  // random background color
   if (key == 'x') { 
    keys[23] = true; bg = myMixer.randomColor();
  }
  
  // screenshot
  if (key == 'y') { 
    keys[24] = true; slides.addSlide();
  } 
  
  // fountain
  if (key == 'z') { 
    keys[25] = true;  
    fountainOn = !fountainOn;
    location.update(random(width),random(height));
  }
  
  
} // end keyPressed()

void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  }
  if (key == 'b') { 
    keys[1] = false;
  } 
  if (key == 'c') { 
    keys[2] = false;
  } 
  if (key == 'd') { 
    keys[3] = false;
  } 
  if (key == 'e') { 
    keys[4] = false;
  } 
  if (key == 'f') { 
    keys[5] = false;
  } 
  if (key == 'g') { 
    keys[6] = false;
  } 
  if (key == 'h') { 
    keys[7] = false;
  } 
  if (key == 'i') { 
    keys[8] = false;
  } 
  if (key == 'j') { 
    keys[9] = false;
  } 
  if (key == 'k') { 
    keys[10] = false;
  } 
  if (key == 'l') { 
    keys[11] = false;
  } 
  if (key == 'm') { 
    keys[12] = false;
  } 
  if (key == 'n') { 
    keys[13] = false;
  } 
  if (key == 'o') { 
    keys[14] = false;
  } 
  if (key == 'p') { 
    keys[15] = false;
  } 
  if (key == 'q') { 
    keys[16] = false;
  } 
  if (key == 'r') { 
    keys[17] = false;
  } 
  if (key == 's') { 
    keys[18] = false;
  } 
  if (key == 't') { 
    keys[19] = false;
  } 
  if (key == 'u') { 
    keys[20] = false;
  } 
  if (key == 'v') { 
    keys[21] = false;
  } 
  if (key == 'w') { 
    keys[22] = false;
  } 
  if (key == 'x') { 
    keys[23] = false;
  } 
  if (key == 'y') { 
    keys[24] = false;
  } 
  if (key == 'z') { 
    keys[25] = false;
  } 
}