final int STARTSCHERM = 1;
final int SPELSCHERM = 2;
final int EINDSCHERM = 3;
final int HIGHSCORESCHERM = 4;
int scherm = 1;
void setup() { 
  size(600, 600);
  clear();
  initialiseerInterface();
  initialiseerSpelScherm();
  initialiseerEindScherm();
}

void draw () {
  clear();
  switch(scherm) {
  case STARTSCHERM:
    tekenStartScherm();
    break;
  case SPELSCHERM:
    tekenSpelScherm();
    break;
  case EINDSCHERM:
    tekenEindScherm();
    break;
  case HIGHSCORESCHERM:
    tekenHighScoreScherm();
    break;
  }
}

void setScherm(int nieuwScherm) {
  scherm = nieuwScherm;
}

void mousePressed() {
  switch(scherm) {
  case STARTSCHERM:
    gekliktOpStartScherm();
    break;
    //println(scherm);
  case SPELSCHERM:
    break;
  case EINDSCHERM:
    gekliktOpEindScherm();
    break;
  case HIGHSCORESCHERM:
    saveStrings("highscoresnaam.txt", highScoresNamen);
    saveBytes("highscore.dat", highScores);
    gekliktOpHighScoreScherm();
    break;
  }
}

void keyPressed() {
  switch(scherm) {
  case STARTSCHERM: 
    invoerenNaam();
    break;
  case SPELSCHERM: 
    activeerMovement();
  }
}

void mouseDragged() {
  mouseDragOpStartScherm();
}
