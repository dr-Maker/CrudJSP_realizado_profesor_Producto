
package modelos.vo;


public class Familiapro 
{
    
    private int familiaid;
    private String familiadesc;

    public Familiapro() 
    {
    }

    public Familiapro(int familiaid, String familiadesc) 
    {
        this.familiaid = familiaid;
        this.familiadesc = familiadesc;
    }

    public int getFamiliaid() {
        return familiaid;
    }

    public void setFamiliaid(int familiaid) {
        this.familiaid = familiaid;
    }

    public String getFamiliadesc() {
        return familiadesc;
    }

    public void setFamiliadesc(String familiadesc) {
        this.familiadesc = familiadesc;
    }
    
    
    
    
    
    
}
