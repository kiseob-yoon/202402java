package Lotto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class LottoGenerator {

	public static void main(String[] args) {
		Set<Integer> lottoNumbers = new HashSet<>();
		
		Random random = new Random();
		while(lottoNumbers.size() < 6) {
			int number = random.nextInt(45) + 1;
			lottoNumbers.add(number);
		}
		System.out.println("로또 번호: ");
		List<Integer> sortedNumbers = new ArrayList<>(lottoNumbers);
		Collections.sort(sortedNumbers);
		for(int num : sortedNumbers) {
			System.out.print(num+" ");
		}
	}

}
