void tekenHighScoreScherm() {
  for (int i = 0; i< highScores.length; i++) {
    tekenTekst(getHighScoreNaam(i) + ": " + getHighScore(i), width / 2, height / 15 * (i + 1), width / 20, #FF0000);
  }
  tekenKnop( "Menu", 0);
}

void gekliktOpHighScoreScherm() {
  if (isDeMuisOverDezeKnop(0)) {
    setScherm(STARTSCHERM);
  }
}
