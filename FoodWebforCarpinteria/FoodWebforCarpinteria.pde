import java.util.*;
import java.lang.*;

// --------------------- Sketch-wide variables ----------------------
Table table;
String[] allSpeciesName = new String[128];
int speciesNum;
ArrayList<Species> allSpecies = new ArrayList<Species>();
float bigCircleDia = 600;
float interval;
PShape bigCircle;
PImage img;
String description;
boolean predPray = true, paraHost = true, predHost = true, paraPara = true;
int buttonX = 50, buttonY = 120;
// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.

// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.


void setup(){
  size(1650, 900);
  smooth(); 
  // ELLIPSE x, y, width, height
  bigCircle = createShape(ELLIPSE,725,475,bigCircleDia,bigCircleDia);  
  // Load the data table.
  table = loadTable("carpinteria.csv");
  // The first row of the table saves all the name of species in the food web.
  // Extract them all and save them in a String array.
  TableRow row0 = table.getRow(0);
  for (int i = 2;i < row0.getColumnCount();i++){
    allSpeciesName[i-2] = row0.getString(i);
  }
  // The first two columns are not species name
  // Initialize save all species information into an arraylist
  for (int i = 3; i < table.getRowCount(); i++){
    allSpecies.add(new Species(table.getRow(i), bigCircleDia, i-3));
    } 
  speciesNum = allSpecies.size();
  
}

void mousePressed(){
  if (mouseX <= buttonX+10 && mouseX >= buttonX && mouseY <= buttonY+10 && mouseY >= buttonY) {
    if (predPray == false) predPray = true;
    else predPray = false;
  }
  if (mouseX <= buttonX+10 && mouseX >= buttonX && mouseY <= buttonY+30 && mouseY >= buttonY+20) {
    if (paraHost == false) paraHost = true;
    else paraHost = false;
  }
  if (mouseX <= buttonX+10 && mouseX >= buttonX && mouseY <= buttonY+50 && mouseY >= buttonY+40) {
    if (predHost == false) predHost = true;
    else predHost = false;
  }
  if (mouseX <= buttonX+10 && mouseX >= buttonX && mouseY <= buttonY+70 && mouseY >= buttonY+60) {
    if (paraPara == false) paraPara = true;
    else paraPara = false;
  }
}


void draw()
{
 background(255); 
 shape(bigCircle,0,0);
 stroke(0);
 textSize(15);
 fill(0);
 text("Subwebs (click to select)", 45, 110);
 
 if (predPray) fill(152,78,163);
 else noFill();
 rect(buttonX, buttonY, 10, 10);
 fill(152,78,163);
 text("pedator-prey", buttonX+13, buttonY+10); 
 
 if (paraHost) fill(247,129,191);
 else noFill();
 rect(buttonX, buttonY+20, 10, 10);
 fill(247,129,191);
 text("parasite-host", buttonX+13, buttonY+30);
 
 if (predHost) fill(78,179,211);
 else noFill();
 rect(buttonX, buttonY+40, 10, 10);
 fill(78,179,211);
 text("predator-parasite", buttonX+13, buttonY+50);
 
 if (paraPara) fill(153,153,153);
 else noFill();
 rect(buttonX, buttonY+60, 10, 10);
 fill(153,153,153);
 text("parasite-parasite", buttonX+13, buttonY+70);
 
 int tplX = 40, tplY = 350;
 fill(255,255,51); rect(tplX, tplY, 10, 10);
 fill(255,127,0); rect(tplX, tplY+20, 10, 10);
 fill(228,26,28); rect(tplX, tplY+40, 10, 10);
 fill(152,78,163); rect(tplX, tplY+60, 10, 10);
 fill(247,129,191); rect(tplX, tplY+85, 10, 10);
 fill(102,166,30); rect(tplX, tplY+105, 10, 10);
 fill(78,179,211); rect(tplX, tplY+150, 10, 10);
 fill(153,153,153); rect(tplX, tplY+170, 10, 10);
 
 textSize(13);
 fill(0);
 text("Types of links", tplX, 340);
 textSize(12);
 text("first intermediate host", tplX+20, tplY+10);
 text("first and second intermediate host", tplX+20, tplY+30);
 text("second intermediate host", tplX+20, tplY+50);
 text("final intermediate host", tplX+20, tplY+70);
 text("predator-prey and egg predator", tplX+20, tplY+90);
 text("predation on free-living cercarial", tplX+20, tplY+110);
 text("stage of a trematode and", tplX+20, tplY+125);
 text("micropredation (mosquito)", tplX+20, tplY+140);
 text("predation on parasite in a host", tplX+20, tplY+160); 
 text("parasite-parasite", tplX+20, tplY+180);
 
 int tpsX = 55, tpsY = 250;
 fill(102,194,165); circle(tpsX, tpsY, 15);
 fill(1252,141,98); circle(tpsX, tpsY+20, 15);
 fill(141,160,203); circle(tpsX, tpsY+40, 15);
 
 fill(0);
 textSize(14);
 text("Types of species", tpsX-10, tpsY-15);
 textSize(14);
 text("Basal", tpsX+10, tpsY+5);
 text("Freeliving", tpsX+10, tpsY+25);
 text("Parasite", tpsX+10, tpsY+45);
 
 //textSize(12);
 //text("Citation: ", 970, 500);
 //text("CLafferty, K. D., R. F. Hechinger, J. C. Shaw, K. L. Whitney ", 970, 520);
 //text("and A. M. Kuris (in press) ", 970, 535);
 //text("Food webs and parasites in a salt marsh ecosystem. ", 970, 555);
 //text("In Disease ecology: community structure and pathogen", 970, 575);
 //text("dynamics (eds S. Collinge and C. Ray). ", 970, 590);
 //text("Oxford University Press, Oxford.", 970, 605);
 
 //noFill();
 //rect(960, 480, 350, 140);
 //rect(80, 300, 220, 350);
 
 //textSize(18);
 //text("Killdeer", 90, 325);
 //img = loadImage("image/41.jpg");
 //image(img, 95, 330, 180, 120);
 //textSize(15);
 //description = "Charadrius vociferus (Killdeer) is a species of bird in the family Charadriidae. It is found in the Neotropics and the Nearctic. It is a carnivore.";
 //text(description, 90, 465, 200, 650);
 
 for(int i = 0; i < speciesNum; i++){
   shape(allSpecies.get(i).getShape(),0,0);
 }
 for(int i = 0; i < speciesNum; i++){
     int t=i;
     pushMatrix();
     fill(0);
     textSize(10);
     rotate(t*PI/64);
     translate(allSpecies.get(t).getXNum()*cos(t*PI/64)+allSpecies.get(t).getYNum()*sin(t*PI/64), -allSpecies.get(t).getXNum()*sin(t*PI/64)+allSpecies.get(t).getYNum()*cos(t*PI/64)+3);
     text(allSpecies.get(t).getName(), 0,0);
     popMatrix();
 
   for(int j = 0; j < speciesNum; j++){
     float ijRelation = allSpecies.get(i).getRelations().get(j);
     // draw links if two speceis have relations
     if(ijRelation!=0) {
       if (predPray){
         if(ijRelation==1) {
           strokeWeight(0.5);
           stroke(255,255,51);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         }
         if(ijRelation==1.2||ijRelation==1.25) {
           strokeWeight(0.5);
           stroke(255,127,0);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         }
         if(ijRelation==2||ijRelation==2.5) {
           strokeWeight(0.5);
           stroke(228,26,28);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         }
         if(ijRelation==3) {
           strokeWeight(0.5);
           stroke(152,78,163);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());          }
       }
       if(paraHost){
         if(ijRelation==4||ijRelation==4.1||ijRelation==4.11||ijRelation==4.2) {
           strokeWeight(0.45);
           stroke(247,129,191);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         }
       }
       if (predHost){
         if(ijRelation==5||ijRelation==6) {
           strokeWeight(0.5);
           stroke(102,166,30);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         } 
         if(ijRelation==7||ijRelation==8) {
           strokeWeight(0.25);
           stroke(78,179,211);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         } 
       }
       if (paraPara){
         if(ijRelation==9) {
           strokeWeight(0.5);
           stroke(153,153,153);
           line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
         } 
       }
     }
   }
 }
}
