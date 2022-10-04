int sliderX;
int sliderY;
int[][] knoppen = {  
  {0, 0, 0, 0, #2102F0, #010003}, 
  {0, 0, 0, 0, #2102F0, #010003}, 
  {0, 0, 0, 0, #2102F0, #010003}, 
  {0, 0, 0, 0, #2102F0, #010003}, 
  {0, 0, 0, 0, #2102F0, #010003}, 
  {0, 0, 0, 0, #2102F0, #010003} };
int[][] sliders = {  
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0} };

void initialiseerInterface() {
  sliderX = width / 10;
  sliderY = height / 13;
  for (int i = 0; i < sliders.length; i++) {
    sliders[i][0] = sliderX;
    sliders[i][1] = sliderY * (i + 3);
    sliders[i][2] = width - 2 * sliderX;
    sliders[i][3] = height / 30;
    sliders[i][4] = sliderX;
  }
  knoppen[0][2] = width / 4; 
  knoppen[0][3] = height / 12;
  knoppen[0][1] = height - knoppen[0][3];
  knoppen[0][0] = width / 2 - knoppen[0][2] / 2;
  knoppen[1][1] = height / 15;
  knoppen[1][2] = width / 4; 
  knoppen[1][3] = height /15;
  knoppen[1][0] = width / 2 - knoppen[1][2] / 2;
  knoppen[2][2] = width / 8; 
  knoppen[2][3] = height / 15;
  knoppen[2][1] =height - knoppen[2][3];
  knoppen[2][0] = width / 2 + knoppen[2][2];
  knoppen[3][2] = width / 8 ; 
  knoppen[3][3] = height / 15;
  knoppen[3][1] = height - knoppen[3][3];
  knoppen[3][0] = width / 2 - 2 * knoppen[3][2];
  knoppen[4][2] = width / 4; 
  knoppen[4][3] = height / 20;
  knoppen[4][1] = height - knoppen[4][3] * 3;
  knoppen[4][0] = width / 2 - knoppen[4][2] / 2;
  knoppen[4][2] = width / 4; 
  knoppen[5][2] = width / 10; 
  knoppen[5][3] = height / 30;
}

void tekenKnop(String tekstKnop, int index) {
  tekenVormKnop(knoppen[index][0], knoppen[index][1], knoppen[index][2], knoppen[index][3], knoppen[index][4]);
  tekenTekst(tekstKnop, knoppen[index][0] + knoppen[index][2] / 2, knoppen[index][1] + knoppen[index][3] / 2, knoppen[index][2] / 10, knoppen[index][5]);
}

void tekenVormKnop(int x, int y, int breedte, int hoogte, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
}

void tekenTekst(String tekst, int x, int y, int size, int tekstKleur) {
  fill(tekstKleur);
  textSize(size);
  textAlign(CENTER, CENTER);
  text(tekst, x, y);
}

void tekenSlider(int index, String tekst) {
  tekenSliderRechthoek(sliders[index][0], sliders[index][1], sliders[index][2], sliders[index][3], 255);
  tekenSliderKnop(sliders[index][4], sliders[index][1] + sliders[index][3] / 2, (sliders[index][3] * 15) / 10);
  tekenTekst(tekst, (sliders[index][0] + sliders[index][2]) / 2, sliders[index][1] - sliders[index][3], height / 30, #FFFFFF);
}

void tekenSliderRechthoek(int x, int y, int breedte, int hoogte, int kleur) {
  fill(kleur);
  rect(x, y, breedte, hoogte);
}

void tekenSliderKnop(int x, int y, int straal) {
  fill(255, 0, 0);
  circle(x, y, straal);
}

int berekenHoeveelheid(int index, int hoeveel) {
  return ceil((sliders[index][4] - sliders[index][0]) /  berekenenGrootteSliderDelenDoor(index, hoeveel) + 1);
}

int berekenenGrootteSliderDelenDoor(int index, int getal) {
  return (sliders[index][2]) / getal;
}

void verplaatsSlider(int slidersIndex) {
  if (mouseX < sliders[slidersIndex][2] + sliders[slidersIndex][0] && mouseX > sliders[slidersIndex][0] && mouseY < sliders[slidersIndex][3] + sliders[slidersIndex][1] && mouseY > sliders[slidersIndex][1]) {
    sliders[slidersIndex][4] = mouseX;
  }
}

boolean isDeMuisOverDezeKnop(int index) {
  //println(mouseX > x && mouseX < x + breedte && mouseY > y && mouseY < y + hoogte);
  return mouseX > knoppen[index][0] && mouseX < knoppen[index][0] + knoppen[index][2] && mouseY > knoppen[index][1] && mouseY < knoppen[index][1] + knoppen[index][3] ;
}
