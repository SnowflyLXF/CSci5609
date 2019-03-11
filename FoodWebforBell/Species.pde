import java.util.*;

public class Species {
  private String name;
  private String type;
  private ArrayList<Float> relations = new ArrayList<Float>();
  private PShape shape;
  private float diameter;
  private float xCor;
  private float yCor;
  private int index;
  private final int speciesNum = 12;
  private final float interval = (float)360/13;

  public Species(TableRow speciesRow, float bigCircleDia, int index){
  for(int i = 0; i < speciesRow.getColumnCount(); i++){
      if(i==0) type = speciesRow.getString(i);
      else if(i==1) name = speciesRow.getString(i);
      else relations.add(speciesRow.getFloat(i));
    }
    diameter = (float)(bigCircleDia * Math.PI / speciesNum)/2;
    xCor = (float)(640+Math.cos(Math.toRadians(index*interval))*bigCircleDia/2);
    yCor = (float)(360+Math.sin(Math.toRadians(index*interval))*bigCircleDia/2);
    drawShape();
  }
  
  private void drawShape(){
    // ELLIPSE x, y, width, height
    shape = createShape(ELLIPSE, xCor,yCor ,diameter ,diameter);
    // If type is Basal, set the color to royal blue.
    if (type.equals("plant")) shape.setFill(color(161,218,180));
    // If type is Freeliving, set the color to Spring Green1.
    else if (type.equals("herbivore")) shape.setFill(color(65,182,196));
    // If type is Basal, set the color to Orange Red.
    else if (type.equals("predator")) shape.setFill(color(34,94,168));
    shape.setStroke(false);
  }
  
  public String getName(){
    return name;
  }
  
  public String getType(){
    return type;
  }
  
  public ArrayList<Float> getRelations(){
    return relations;
  }
  
  public PShape getShape(){
    return shape;
  }
  
  public float getXCor(){
    return xCor;
  }
  public float getYCor(){
    return yCor;
  }
}
  
