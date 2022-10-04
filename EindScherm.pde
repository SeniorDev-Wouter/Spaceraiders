int eindSchermTekstY;
int eindSchermTekstX;
String[] highScoresNamen = {"proRaider","bram","michiel","maureen","noob","noob2","noob3","noob4","noob5","noob6"};
byte highScores[] = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10};

byte getHighScore(int index) {
  return highScores[index];
}

String getHighScoreNaam(int index) {
  return highScoresNamen[index];
}

void gekliktOpEindScherm() {
  if (isDeMuisOverDezeKnop(2)) {
    setScherm(STARTSCHERM);
  } else if (isDeMuisOverDezeKnop(3)) {
    setScherm(SPELSCHERM);
    resetSpeelveld();
    resetSpeler();
    genereerSpeelVeld();
  } 
  if (isDeMuisOverDezeKnop(0)) {
    setScherm(STARTSCHERM);
    veranderHighScores();
  }
}

void initialiseerEindScherm() {
  highScoresNamen = loadStrings("highscoresnaam.txt");
  highScores = loadBytes("highscore.dat"); 
  eindSchermTekstY = height / 2;
  eindSchermTekstX = width / 2;
}

void tekenEindScherm() {
  if (level < speelveld.length - 1) {
    tekenEindSchermTekst(eindSchermTekstX, eindSchermTekstY);
    if (getDead() == false) {
      tekenKnop( "Menu", 2);
      tekenKnop( "Next Level", 3);
    } else if (getDead()) {
      tekenKnop( "Menu", 2);
      tekenKnop( "Try Again", 3);
    }
  } else {
    tekenEindSchermTekst(eindSchermTekstX, eindSchermTekstY);
    tekenKnop( "Menu", 0);
  }
}

void veranderHighScores() {
  for (int i = 0; i < highScores.length; i++) {
    if (highScores[i] < score) {
      for (int j = highScores.length - 1; j > i; j--) {
        highScores[j] = highScores[j - 1]; 
        highScoresNamen[j] = highScoresNamen[j - 1];
      }
      highScores[i] = byte(getScore());
      highScoresNamen[i] = getNaam();
      i = highScores.length;
    }
    saveStrings("highscoresnaam.txt", highScoresNamen);
    saveBytes("highscore.dat", highScores);
  }
}

void tekenEindSchermTekst(int eindSchermTekstX, int eindSchermTekstY) {
  if (level < speelveld.length) {
    if (getDead()) {
      tekenTekst("Gameover", eindSchermTekstX, eindSchermTekstY, width / 20, #ff0000);
    } else if (getDead() == false) {
      tekenTekst( "You completed the level, Your score: " + getScore(), eindSchermTekstX, eindSchermTekstY, width / 30, #ff0000);
    }
  } else { 
    tekenTekst( "You completed the game. Your score: " + getScore(), eindSchermTekstX, eindSchermTekstY, width / 30, #ff0000);
  }
}
