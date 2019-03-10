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
// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.

// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.


void setup(){
  size(1280, 720);
  smooth(); 
  // ELLIPSE x, y, width, height
  bigCircle = createShape(ELLIPSE,640,360,bigCircleDia,bigCircleDia);  
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
 shape(bigCircle,0,0);
 for(int i = 0; i < speciesNum; i++){
   shape(allSpecies.get(i).getShape(),0,0);
 }
 for(int i = 0; i < speciesNum; i ++){
   for(int j = 0; j < speciesNum; j++){
     float ijRelation = allSpecies.get(i).getRelations().get(j);
     // draw links if two speceis have relations
     if(ijRelation!=0) {
       if(ijRelation==1||ijRelation==1.2||ijRelation==1.25) {
         stroke(220,20,60);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       }
       if(ijRelation==2||ijRelation==2.5) {
         stroke(139,0,139);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       }
       if(ijRelation==3) {
         stroke(72,61,139);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       }
       if(ijRelation==4||ijRelation==4.1||ijRelation==4.1||ijRelation==4.2) {
         stroke(128,0,0);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       }  
       if(ijRelation==5){
         stroke(0,128,0);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       } 
       if(ijRelation==6) {
         stroke(255,215,0);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       } 
       if(ijRelation==7) {
         stroke(0,255,127);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       } 
       if(ijRelation==8) {
         stroke(47,79,79);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       } 
       if(ijRelation==9) {
         stroke(100,149,237);
         line(allSpecies.get(i).getXCor(), allSpecies.get(i).getYCor(), allSpecies.get(j).getXCor(), allSpecies.get(j).getYCor());
       } 
     }
   }
 }
}
