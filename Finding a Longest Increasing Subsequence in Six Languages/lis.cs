using System;

class lis {

	static int Binary_Search(int[] input, int left, int right, int target){
		int i = Array.BinarySearch(input, left, right, target);
		if(i < 0) return i*-1-1;
		else return i;

	}

	static int[] find_lis(int[] input){
		int[] Tail_Table = new int[input.Length];
		int[] Recovery_Table = new int[input.Length];
		
		for(int i = 0; i < input.Length; i++){
		       Tail_Table[i] = 0;
	       		Recovery_Table[i] = -1;
		}

		int length = 1;
		for(int i = 1; i < input.Length; i++){
			if(input[i] == input[i-1]) continue;
			else if (input[i] < input[Tail_Table[0]]){
				Tail_Table[0] = i;
			}
			else if (input[i] > input[Tail_Table[length-1]]){
				Tail_Table[length] = i;
				Recovery_Table[i] = Tail_Table[length-1];
				length++;
			}
			else {
				int Temp = Binary_Search(input, 1, length-1, input[i]);
				Tail_Table[Temp] = i;
				Recovery_Table[i] = Tail_Table[Temp-1];
			}


		}
		int length2 = 0;

		for(int i = Tail_Table[length-1]; i >=0; i = Recovery_Table[i]){
			length2++;
		}
		
		int[] ret = new int[length2];
		int count = 1;

		for(int i = Tail_Table[length-1]; i >=0; i = Recovery_Table[i]){
			ret[ret.Length-count] = input[i];
			count++;
		}
		
		return ret;


	}


	static void Main(string[] args) {
		Console.WriteLine("Please input a series of numbers seperated by spaces.");
		string g = Console.ReadLine();
		string[] nums = g.Split(' ');
		int[] sequence = new int[nums.Length];
		for(int i = 0; i < nums.Length; i++){
			sequence[i] = Int32.Parse(nums[i]);
		}
		int[] seq2 = find_lis(sequence);
		Console.WriteLine(string.Join(",", seq2));

	}


}

