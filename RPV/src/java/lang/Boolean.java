/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lang;

/**
 *
 * @author Caio Alexandre
 */
public class Boolean implements Comparable<java.lang.Boolean>{

    private boolean b;
    
    public Boolean(boolean b) {
        this.b = b;
    }
    
    public void set(boolean b) {
        this.b = b;
    }
    
    public void toogle() {
        this.b = !b;
    }

    @Override
    public int compareTo(java.lang.Boolean o) {
        return (b == o) ? 0 : (b ? 1 : -1);
    }
    
    public boolean booleanValue() {
        return b;
    }

    @Override
    public String toString() {
        return b ? "true" : "false";
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj instanceof java.lang.Boolean) {
            return b == ((java.lang.Boolean)obj).booleanValue();
        }
        return false;
    }

    @Override
    public int hashCode() {
        return b ? 1231 : 1237;
    }
}