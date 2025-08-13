package env;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.OpFeedbackParam;

public class SupplyHub extends Artifact {
    void init(){
        defineObsProperty("cheese", 3);
        defineObsProperty("tomato", 3);
        defineObsProperty("dough", 3);
    }

    @OPERATION
    public void checkStock(String item, OpFeedbackParam<Integer> qty){
        System.out.println("checkStock called" + item); 
        int currentQty = (Integer) getObsProperty(item).getValue();
        qty.set(currentQty);
    }

    @OPERATION
    public void addStock(String item){
        System.out.println("addStock called" + item); 
        int currentQty = (Integer) getObsProperty(item).getValue();
        updateObsProperty(item, currentQty + 1);
    }

    @OPERATION
    public void  removeStock(String item){
        System.out.println("removeStock called" + item); 
        int currentQty = (Integer) getObsProperty(item).getValue();
        if (currentQty >= 1){
            updateObsProperty(item, currentQty - 1);
        } else {
            System.out.println("cant");
        }
    }

    
}
