//ArrayCopy
//二维数组的复制
public class example04_02{
  public static void main(String args[]){
    int c[][],d[][],i,j;
    c=new int[2][2];
    d=new int[3][3];
    System.out.println("  Array d");
    for (i=0;i<d.length;i++){
      for (j=0;j<d[i].length;j++){
      	d[i][j]=i+j;
        System.out.print( d[i][j]+"  "); 
      }
      System.out.println();
    }
    c=d;
	c[0][0] = 4;
    System.out.println("  Array c");
    for (i=0;i<d.length;i++){
      for(j=0;j<d[i].length;j++)
        System.out.print( d[i][j]+"  ");
      System.out.println( );
    }
  }
} 