import java.util.Scanner;
import java.util.Arrays;

public class lis{

public static int Binary_Search(int[] input, int l, int right, int target){
	int index = Arrays.binarySearch(input, l, right, target);
	if(index < 0) index = index*-1-1;
	return index;



}
public static void main(String[] args){
	System.out.println("Hello, please  input a sequence of integers seperated by spaces.");
	Scanner sc = new Scanner(System.in);
	String line = sc.nextLine();
	String[] nums = line.split(" ");
	int[] input = new int[nums.length];
	for(int i = 0; i < nums.length; i++){
		input[i] = Integer.parseInt(nums[i]);

	}
	System.out.println(Arrays.toString(lis(input)));
}

public static int[] lis(int[] input){
	int[] Tail_Table = new int[input.length];
	int[] Recovery_Table = new int[input.length];

	for(int i = 0; i < input.length; i++){
		Tail_Table[i] = 0;
		Recovery_Table[i] = -1;
	}

	int length = 1;

	for(int i = 1; i < input.length; i++){
		if(input[i] == input[i-1]) continue;
		else if(input[i] < input[Tail_Table[0]]){
			Tail_Table[0] = i;
		}

		else if(input[i] > input[Tail_Table[length-1]]){
			Tail_Table[length] = i;
			Recovery_Table[i] = Tail_Table[length-1];
			length++;
		}
		else {
			int Temp = Binary_Search(input, 1, length-1, input[i]);
			Tail_Table[Temp] = i;
			Recovery_Table[i] = Tail_Table[Temp - 1];
		}
	}

	int count = 0;

	for(int i = Tail_Table[length-1]; i >= 0; i = Recovery_Table[i]){
		count++;
	}

	int[] ret = new int[count];
	count--;

	for(int i = Tail_Table[length-1]; i >= 0; i = Recovery_Table[i]){
		ret[count] = input[i];
		count--;
	}

	return ret;
}
}
