//数组参数
//展示数组参数传递地址的方法
package chapter4;

public class example04_07{
  public static void main(String args[ ] ) {
    int c[ ][ ]={{1,2,3,4,5},{6,7,8,9,10}};
    int i,j;
    System.out.println("\n调用arrayMultiply方法前的数组C");
    for (i=0;i<c.length;i++) {
       for (j=0;j<c[i].length;j++)
          System.out.print( c[i][j]+"  "); 
          System.out.println();
    }
    arrayMultiply(c);
    System.out.println("\n调用arrayMultiply方法后的数组C");
    for (i=0;i<c.length;i++)  {
       for (j=0;j<c[i].length;j++)
          System.out.print( c[i][j]+"  "); 
       System.out.println();
    }
  }

  static void  arrayMultiply(int d[ ][ ] )  {
     int k,l;
     for ( k=0;k<d.length;k++)
        for (l=0;l<d[k].length;l++)
            d[k][l]=2*d[k][l];
     System.out.println("  in arrayMultiply");
     for (k=0;k<d.length;k++) {
        for (l=0;l<d[k].length;l++)
            System.out.print( d[k][l]+"  "); 
        System.out.println();
     }
  }
}  