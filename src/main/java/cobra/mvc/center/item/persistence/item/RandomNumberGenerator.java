package cobra.mvc.center.item.persistence.item;

import java.util.Random;

public class RandomNumberGenerator {
	
	//Ư�� �ڸ����� �����߻���
	public static int randomNumber(int size) {
		
		//size�� ���� �ڸ�����ŭ�� �ڸ����� ���� ���ڰ� ������
		//�ִ� 9�ڸ�������
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
