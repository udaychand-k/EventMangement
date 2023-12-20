public class MyException extends Exception {
    public static void main(){
    try
    {
     throw new NullPointerException();
    }
    catch (NullPointerException e)
    {
        String x = e.getTypeName(); //System.npe
        List<String> s =x.split('\\.'); //(s,npe)
		System.debug(x+s) ;
    }
        
    }
}