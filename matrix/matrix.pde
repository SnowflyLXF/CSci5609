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



void draw()
{
 background(255); 
 textSize(15);
 
 fill(0);
 //rect(960, 480, 350, 140);
 //rect(80, 300, 220, 350);
 
 textSize(20);
 text("Interaction Matrix", 110, 30);
 
 int tplX = 900, tplY = 120, dist = 20;
 fill(202,178,214); rect(tplX, tplY, 10, 10);
 fill(251,154,153); rect(tplX, tplY+dist, 10, 10);
 fill(227,26,28); rect(tplX, tplY+dist*2, 10, 10);
 fill(178,223,138); rect(tplX, tplY+dist*3, 10, 10);
 fill(166,206,227); rect(tplX, tplY+dist*4, 10, 10);
 fill(31,120,180); rect(tplX, tplY+dist*5, 10, 10);
 fill(253,191,111); rect(tplX, tplY+dist*6.5, 10, 10);
 fill(255,127,0); rect(tplX, tplY+dist*7.5, 10, 10);
 fill(51,160,44); rect(tplX, tplY+dist*8.5, 10, 10);
 
 textSize(13);
 fill(0);
 text("Types of Interaction", tplX, tplY-10);
 textSize(12);
 text("first intermediate host", tplX+20, tplY+dist*0.5);
 text("second intermediate host", tplX+20, tplY+dist*1.5);
 text("final intermediate host", tplX+20, tplY+dist*2.5);
 text("predator-prey", tplX+20, tplY+dist*3.5);
 text("egg predator", tplX+20, tplY+dist*4.5);
 text("predation on free-living cercarial", tplX+20, tplY+dist*5.5);
 text("stage of a trematode", tplX+20, tplY+dist*6);
 text("micropredation (mosquito)", tplX+20, tplY+dist*7);
 text("predation on parasite in a host", tplX+20, tplY+dist*8); 
 text("parasite-parasite", tplX+20, tplY+dist*9);
 
 //img = loadImage("image/41.jpg");
 //image(img, 95, 330, 180, 120);
 //textSize(15);
 //description = "Charadrius vociferus (Killdeer) is a species of bird in the family Charadriidae. It is found in the Neotropics and the Nearctic. It is a carnivore.";
 //text(description, 90, 465, 200, 650);
 noFill();
 stroke(127,201,127);
 strokeWeight(2);
 rect(100, 40, 768, 768);
 
 noStroke();
 for(int i = 0; i < speciesNum; i++){  
   for(int j = 0; j < speciesNum; j++){    
     float ijRelation = allSpecies.get(i).getRelations().get(j);
     if(ijRelation!=0){
       if(ijRelation==1 || ijRelation==1.2 || ijRelation==1.25) fill(202,178,214);
       else if(ijRelation==2 || ijRelation==2.5) fill(251,154,153);
       else if(ijRelation==3) fill(227,26,28);
       else if(ijRelation==4.2) fill(178,223,138);
       else if(ijRelation==5) fill(166,206,227);
       else if(ijRelation==6) fill(31,120,180);
       else if(ijRelation==7 || ijRelation==8) fill(253,191,111);
       else if(ijRelation==9) fill(255,127,0);
       else fill(51,160,44);
       rect(100+i*6, 40+j*6, 6, 6);
     }
   }
 }
 
 
}
