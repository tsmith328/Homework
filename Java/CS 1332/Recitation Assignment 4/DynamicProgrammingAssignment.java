/**
 * Assignment to teach dynamic programming using 3 simple example problems:
 * 1. Fibonacci numbers
 * 2. Longest common subsequence
 * 3. Edit distance
 * 
 * @author Julia Ting (julia.ting@gatech.edu)
 */
public class DynamicProgrammingAssignment {
	public static int num_calls = 0; //DO NOT TOUCH

	/**
	 * Calculates the nth fibonacci number: fib(n) = fib(n-1) + fib(n-2).
	 * Remember that fib(0) = 0 and fib(1) = 1.
	 * 
	 * This should NOT be done recursively - instead, use a 1 dimensional
	 * array so that intermediate fibonacci values are not re-calculated.
	 * 
	 * The running time of this function should be O(n).
	 * 
	 * @param n A number 
	 * @return The nth fibonacci number
	 */
	public static int fib(int n) {
		num_calls++; //DO NOT TOUCH
		int[] fibArr = new int[n + 1];
		if (n > 0) {
    		fibArr[1] = 1;
    		for (int i = 2; i <= n; i++) {
    		    fibArr[i] = fibArr[i - 1] + fibArr[i - 2];
    		}
		}
		return fibArr[n];
	}
	
	/**
	 * Calculates the length of the longest common subsequence between a and b.
	 * 
	 * @param a
	 * @param b
	 * @return The length of the longest common subsequence between a and b
	 */
	public static int lcs(String a, String b) {
		num_calls++; //DO NOT TOUCH
		int[][] lcsArr = new int[a.length() + 1][b.length() + 1];
		for (int i = 1; i < a.length() + 1; i++) {
		    for (int j = 1; j < b.length() + 1; j++) {
		        if (a.charAt(i - 1) == b.charAt(j - 1)) {
		            lcsArr[i][j] = lcsArr[i - 1][j - 1] + 1;
		        } else {
		            lcsArr[i][j] = Math.max(lcsArr[i][j - 1], lcsArr[i - 1][j]);
		        }
		    }
		}
		return lcsArr[a.length()][b.length()];
	}

	/**
	 * Calculates the edit distance between two strings.
	 * 
	 * @param a A string
	 * @param b A string
	 * @return The edit distance between a and b
	 */
	public static int edit(String a, String b) {
		num_calls++; //DO NOT TOUCH
		int[][] editArr = new int[a.length() + 1][b.length() +1];
		for (int i = 0; i < a.length() + 1; i++) {
		    editArr[i][0] = i;
		}
		for (int i = 0; i < b.length() + 1; i++) {
		    editArr[0][i] = i;
		}
		for (int i = 1; i < a.length() + 1; i++) {
		    for (int j = 1; j < b.length() + 1; j++) {
		        int diff = 0;
		        if (a.charAt(i - 1) != b.charAt(j - 1)) {
		            diff = 1;
		        }
	            editArr[i][j] = Math.min(editArr[i - 1][j - 1] + diff,
	                    Math.min(editArr[i][j - 1] + 1, editArr[i - 1][j] + 1));
		    }
		}
		return editArr[a.length()][b.length()];
	}
}

