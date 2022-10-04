int hoeveelheidSchatten = 10;
int hoeveelheidBadRaiders = 4;
int hoeveelheidDeathTraps = 2;
int hoeveelheidSpelers = 2;
int hoeveelheidRuimteMonsters = 2;
int hoeveelheidZuurstofTanks = 2;
int snelheidIntelligentRuimteMonster = 2;
float zuurstofMax = 20;
String player2RaiderText = "player 2 is raider";
String naam = "Naam";
boolean player2BadRaider = false;
boolean OpNaamBoxGeklikt = false;

boolean getPlayer2BadRaider() {
  return player2BadRaider;
}

String getNaam() {
  return naam;
}

void mouseDragOpStartScherm() {
  if (scherm == STARTSCHERM) {
    for (int i = 0; i < sliders.length; i++) {
      verplaatsSlider(i);
    }
  }
}

void gekliktOpStartScherm() {
  if (isDeMuisOverDezeKnop(0)) {
    berekenWaardes();
    setScherm(SPELSCHERM);
    resetSpel();
    resetSpeelveld();
    resetSpeler();
    genereerSpeelVeld();
  }  
  if (isDeMuisOverDezeKnop(1)) {
    OpNaamBoxGeklikt = true;
    naam = "";
  }
  if (isDeMuisOverDezeKnop(4)) {
    if (player2BadRaider) {
      player2BadRaider = false;
      player2RaiderText = "player 2 is raider";
    } else if (!player2BadRaider) {
      player2BadRaider = true;
      player2RaiderText = "player 2 is badraider";
    }
  }
  if (isDeMuisOverDezeKnop(5)) {
    setScherm(HIGHSCORESCHERM);
  }
}

void invoerenNaam() {
  if (OpNaamBoxGeklikt == true) {
    naam = naam + key;
  }
  //println(naam);
}

void tekenStartScherm() {
  tekenSlider(0, "Amount of Treasure: " + berekenHoeveelheid(0, 20));
  tekenSlider(1, "Amount of Badraiders: " + berekenHoeveelheid(1, 20));
  tekenSlider(2, "Amount of Deathtraps: " + berekenHoeveelheid(2, 5));
  tekenSlider(3, "Amount of Players: " + berekenHoeveelheid(3, 2));
  tekenSlider(4, "Amount of Spacemonsters: " + berekenHoeveelheid(4, 5));
  tekenSlider(5, "Amount of Oxygen Tanks: " + berekenHoeveelheid(5, 20));
  tekenSlider(6, "Speed of Smart Monster: " + berekenHoeveelheid(6, intelligentRuimteMonsterMaxSpeed));
  tekenSlider(7, "Amount of Oxygen: " + berekenHoeveelheid(7, 20));
  tekenKnop("Start", 0);
  tekenKnop(naam, 1);
  tekenKnop(player2RaiderText, 4);
  tekenKnop("Highscores", 5);
}

void berekenWaardes() {
  hoeveelheidSchatten = berekenHoeveelheid(0, 20);
  hoeveelheidBadRaiders = berekenHoeveelheid(1, 20);
  hoeveelheidDeathTraps = berekenHoeveelheid(2, 5);
  hoeveelheidSpelers = berekenHoeveelheid(3, 2);
  hoeveelheidRuimteMonsters = berekenHoeveelheid(4, 5);
  hoeveelheidZuurstofTanks = berekenHoeveelheid(5, 20);
  snelheidIntelligentRuimteMonster = berekenHoeveelheid(6, intelligentRuimteMonsterMaxSpeed);
  zuurstofMax = berekenHoeveelheid(7, 20);
}

float getZuurstofMax() {
  return zuurstofMax * 100;
}

int getSnelheidIntelligentRuimteMonster() {
  return snelheidIntelligentRuimteMonster;
}

int getHoeveelheidZuurstofTanks() {
  return hoeveelheidZuurstofTanks;
}

int getHoeveelheidSchatten() {
  return hoeveelheidSchatten;
}

int getHoeveelheidBadRaiders() {
  return hoeveelheidBadRaiders;
}

int getHoeveelheidDeathTraps() {
  return hoeveelheidDeathTraps;
}

int getHoeveelheidSpelers() {
  return hoeveelheidSpelers;
}

int getHoeveelheidRuimteMonsters() {
  return hoeveelheidRuimteMonsters;
}
