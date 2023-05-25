package cobra.mvc.center.item.persistence.item;

import java.util.Random;

public class RandomNumberGenerator {
	
	//특정 자릿수의 난수발생기
	public static int randomNumber(int size) {
		
		//size에 넣은 자리수만큼의 자릿수를 가진 숫자가 생성됨
		//최대 9자리수까지
		String numStr = "1";
	    String plusNum = "1";
	 
	    for (int i = 0; i < size; i++) {
	        numStr += "0";
	 
	        if (i != size - 1) {
	            plusNum += "0";
	        }
	    }
	 
	    Random random = new Random();
	    int result = random.nextInt(Integer.parseInt(numStr)) + Integer.parseInt(plusNum);
	    
	    if (result > Integer.parseInt(numStr)) {
	        result = result - Integer.parseInt(plusNum);
	    }

		return result;
	}
	
	public static void main(String[] args) {
		for(int i = 0; i<200; i++){
			int rn = randomNumber(2);
			System.out.println(rn);
		}
	}
	
}
