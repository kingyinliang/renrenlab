package com.renrenlab.rlab.common.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtils {

	public static String encrypt(String source) {
		return md5(source);
	}
	
	public static String encrypt(String source, String salt) {
		return md5(source + salt);
	}
	
	public static String md5(String input) {
		String md5 = null;
		if (null == input) return null;
		try {
			// Create MessageDigest object for MD5
			MessageDigest md = MessageDigest.getInstance("MD5");
			// Update input string in message digest
			try {
				md.update(input.getBytes("utf-8"), 0, input.length());
			} catch (UnsupportedEncodingException e) {
				throw new AssertionError(e);
			}
			// Converts message digest value in base 16 (hex)
			md5 = new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return md5;
	}
	

	
	

	
	

	
}
