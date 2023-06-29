package com.devmaster.Customer.ultils;

import java.util.Random;

public class RandomCode {
	
	public static String ramdom() {
		Random rand = new Random();
		int randomNumber = rand.nextInt(9000) + 1000;
		return String.valueOf(randomNumber);
	}
}
