int[][] spelers = { {0, 0}, 
  {0, 0} };
int spelerSpeed = 2;
int spelerWachtTijd = 0;
boolean movingSpeler1 = false;
boolean movingSpeler2 = false;
int movementSpeler1;
int movementSpeler2;
PImage[] spelerSprites = new PImage[3];
final int OMHOOG = 0;
final int BENEDEN = 1;
final int LINKS = 2;
final int RECHTS = 3;
int score = 0;

int getSpelerCoordinaat(int index, int index2) {
  return spelers[index][index2];
}

void checkZuurstof() {
  if (getZuurstof() < 0) {
    setScherm(EINDSCHERM);
    setDead(true);
  }
}

void tekenZuurstof(int index) {
  rect(breedte*spelers[index][0], hoogte*spelers[index][1], breedte * (getZuurstof() / getZuurstofMax()), hoogte/4);
  // println(zuurstof / 300);
}

void tekenSpeler(int index) {
  spelerWachtTijd ++;
  tekenNaam(index);
  if (index != 1 || !getPlayer2BadRaider()) {
    checkZuurstof();
    tekenZuurstof(index);
    tekenSpelerSprite(spelers[index][0], spelers[index][1], index);
    //println(naam);
  }
  detectSpelerCollision();
  moveSpeler();
  if (index == 1 && getPlayer2BadRaider()) {
    tekenEntity(spelers[index][0], spelers[index][1], 3);
  }
}

void tekenNaam(int index) {
  textAlign(CENTER, CENTER);
  text(naam, breedte*spelers[index][0], hoogte*(spelers[index][1] - 0.3));
}

void resetSpeler() {
  setDead(false);
  movingSpeler1 = false;
  movingSpeler2 = false;
  for (int i = 0; i< spelers.length; i++) {
    spelers[i][0] = 1 + i;
    spelers[i][1] = 1;
  }
}

void tekenSpelerSprite(int x, int y, int index) {
  spelerSprites[0] = loadImage("spelerSprite.png");
  spelerSprites[1] = loadImage("speler2Sprite.png");
  spelerSprites[2] = loadImage("badRaiderSprite.png");
  spelerSprites[index].resize(breedte, hoogte);
  image(spelerSprites[index], x*breedte, y*hoogte);
};

int getScore() {
  return score;
}

void activeerMovement() {
  if (movingSpeler1 == false) {
    switch(keyCode) {
    case UP:
      //println("up");  
      movementSpeler1 = OMHOOG;
      movingSpeler1 = true;
      break;
    case DOWN:
      //println("DOWN");
      movementSpeler1 = BENEDEN;
      movingSpeler1 = true;
      break;
    case LEFT:
      //println("left");
      movementSpeler1 = LINKS;
      movingSpeler1 = true;
      break;
    case RIGHT:
      //println("right");
      movementSpeler1 = RECHTS;
      movingSpeler1 = true;
      break;
    }
  }
  if (movingSpeler2 == false && getHoeveelheidSpelers() == 2) {
    switch(key) {
    case 'w':
      //println("up");  
      movementSpeler2 = OMHOOG;
      movingSpeler2 = true;
      break;
    case 's':
      //println("DOWN");
      movementSpeler2 = BENEDEN;
      movingSpeler2 = true;
      break;
    case 'a':
      //println("left");
      movementSpeler2 = LINKS;
      movingSpeler2 = true;
      break;
    case 'd':
      //println("right");
      movementSpeler2 = RECHTS;
      movingSpeler2 = true;
      break;
    }
  }
}

void moveSpeler() {
  if (spelerWachtTijd % spelerSpeed == 0) {
    if (movingSpeler1 == true) {
      switch (movementSpeler1) {
      case OMHOOG:
        if (detecteerMuur(0, 0, -1)) {
          movingSpeler1 = false;
        } else {
          spelers[0][1] --;
        }
        break;
      case BENEDEN:
        if (detecteerMuur(0, 0, 1)) {
          movingSpeler1 = false;
        } else {
          spelers[0][1] ++;
        }
        break;
      case LINKS:
        if (detecteerMuur(0, -1, 0)) {
          movingSpeler1 = false;
        } else {
          spelers[0][0] --;
        }
        break;
      case RECHTS:
        if (detecteerMuur(0, 1, 0)) {
          movingSpeler1 = false;
        } else {
          spelers[0][0] ++;
        }
        break;
      }
    }
    if (movingSpeler2 == true) {
      switch (movementSpeler2) {
      case OMHOOG:
        if (detecteerMuur(1, 0, -1)) {
          movingSpeler2 = false;
        } else {
          spelers[1][1] --;
        }
        break;
      case BENEDEN:
        if (detecteerMuur(1, 0, 1)) {
          movingSpeler2 = false;
        } else {
          spelers[1][1] ++;
        }
        break;
      case LINKS:
        if (detecteerMuur(1, -1, 0)) {
          movingSpeler2 = false;
        } else {
          spelers[1][0] --;
        }
        break;
      case RECHTS:
        if (detecteerMuur(1, 1, 0)) {
          movingSpeler2 = false;
        } else {
          spelers[1][0] ++;
        }
        break;
      }
    }
  }
}

boolean detecteerMuur(int index, int x, int y){
  return speelveld[level][spelers[index][0] + x][spelers[index][1] + y] == MUUR;
}
