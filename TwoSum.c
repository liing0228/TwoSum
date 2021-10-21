#include<stdio.h>
int main(){
	int nums[4] = {2,7,11,15}, target = 9;
	for(int i = 0; i<sizeof(nums); i++){
		int complement = target - nums[i];
		for(int j = i+1; j<sizeof(nums);j++){
			if(nums[j]==complement){
				printf("%d %d\n", i, j);
			}
		}
	}

}
