public class test03_01 {
	public static void main(String [] args){
		char letter = 'C' ;
		switch (letter){
			case 'A':
			case 'a':
				System.out.println("Some kind of A.");
			case 'B':
			case 'b':
				System.out.println("Some kind of B.");
				break;
			//default:
			//	System.out.println("Something else.");
			//	break;
		}
	}	
}