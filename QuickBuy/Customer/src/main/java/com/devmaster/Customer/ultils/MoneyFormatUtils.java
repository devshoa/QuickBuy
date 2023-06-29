package com.devmaster.Customer.ultils;

import java.text.DecimalFormat;

public class MoneyFormatUtils {

	public static Double vndToUsd(Double vnd) {
		return vnd / 2352750;
	}
	
	
	public static String formatVnd(Double vnd) {
		DecimalFormat vndFormat = new DecimalFormat("#,### VNĐ");
		return vndFormat.format(vnd);
	}
	
	
}
