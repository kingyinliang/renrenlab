package com.renrenlab.cms.common.util;

import org.apache.http.Consts;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;


public class PasswordUtils {

	public static String encrypt(String source) {
		return md5(source);
	}
	
	public static String encrypt(String source, String salt) {
		return md5(source + salt);
	}
	
	public static String md5(String input) {

		String md5 = null;

		if (null == input)
			return null;

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
	
	public static String makeClass(Class<?> EntityClass, Class<?> VoClass) {
		StringBuilder sb = new StringBuilder();
		String p1 = makeSimpleVo(EntityClass, VoClass);
		String p2 = makeComplexVo(EntityClass, VoClass);
		String p3 = makeSimpleVo(VoClass, EntityClass);
		sb.append(p1);
		sb.append("\r\n\r\n");
		sb.append(p2);
		sb.append("\r\n\r\n");
		sb.append(p3);
		
		return sb.toString();
	}
	
	
	public static String makeSimpleVo(Class<?> EntityClass, Class<?> VoClass) {
		StringBuilder makeVoMethodSB = new StringBuilder();
		makeVoMethodSB.append(String.format("public static %s make%s(%s src) {\r\n",
				VoClass.getSimpleName(), VoClass.getSimpleName(), EntityClass.getSimpleName()));
		makeVoMethodSB.append(String.format("\r\n"
				+ "%s dst = new %s();"
				+ "\r\n\r\n",
				VoClass.getSimpleName(), VoClass.getSimpleName()));
		
		List<Method> exists = getCopyMethods(EntityClass, VoClass, 1);
		List<Method> unExists = getCopyMethods(EntityClass, VoClass, 0);
		
		String functionBody = genCodeSimple(exists, unExists);
		
		makeVoMethodSB.append(functionBody);
		
		makeVoMethodSB.append("\r\n"
				+ "return dst;\r\n"
				+ "}\r\n");
		return makeVoMethodSB.toString();
	}
	
	
	public static String makeTypeToVar(String TypeName) {
		return TypeName.replaceFirst(
				TypeName.substring(0, 1)
				, TypeName.substring(0, 1).toLowerCase());
	}
	public static String makeComplexVo(Class<?> EntityClass, Class<?> VoClass) {
		List<Method> exists = getCopyMethods(EntityClass, VoClass, 1);
		List<Method> unExists = getCopyMethods(EntityClass, VoClass, 0);
		StringBuilder sb = new StringBuilder();
		StringBuilder params = new StringBuilder();
		for(Method method : unExists) {
			Class<?> setType = method.getParameterTypes()[0];
			String name = method.getName().replaceFirst("set", "");
			params.append(String.format("%s %s,", 
					setType.getSimpleName()
					, makeTypeToVar(name)));
			
		}
		params.replace(params.lastIndexOf(","), params.lastIndexOf(",")+1, "");
		
		String body = genCodeComplex(exists, unExists);
		sb.append(String.format(
				"public static %s make%s(%s src, \r\n"
				+ " %s) {\r\n"
				+ "%s dst = new %s();\r\n"
				+ "\r\n"
				+ "%s\r\n"
				+ "return dst;\r\n"
				+ "}\r\n"
				, VoClass.getSimpleName()
				, VoClass.getSimpleName()
				, EntityClass.getSimpleName()
				, params.toString()
				, VoClass.getSimpleName()
				, VoClass.getSimpleName()
				, body));
		
		
		return sb.toString();
	}
	
	public static String genCodeExists(List<Method> exists) {
		StringBuilder sb = new StringBuilder();
		for(Method method : exists) {
			String setMethod = method.getName();
			boolean isPrimitive = method.getParameterTypes()[0].isPrimitive();
			String checkHead = "";
			String checkEnd = "";
			String getMethod = setMethod.replaceFirst("set", "get");
			if(!isPrimitive) {
				checkHead = String.format(
						"if(null != src.%s()) {\r\n"
						, getMethod);
				checkEnd = "}\r\n";
			}
			sb.append(String.format(
					"%s"
					+ "\tdst.%s(src.%s());\r\n"
					+ "%s"
					, checkHead
					, setMethod
					, getMethod
					, checkEnd
					));
		}
		return sb.toString();
	}
	
	public static String genCodeSimple(List<Method> exists, List<Method> unExists) {
		StringBuilder sb = new StringBuilder();
		sb.append(genCodeExists(exists));
		sb.append("\r\n\r\n\r\n//以下方法没有对应的get方法\r\n");
		for(Method method : unExists) {
			String setMethod = method.getName();
			String getMethod = setMethod.replaceFirst("set", "get");
			sb.append(String.format(
					""
					+ "//\tdst.%s(src.%s());\r\n"
					+ ""
					, setMethod
					, getMethod
					));
		}
		
		return sb.toString();
	}
	
	public static String genCodeComplex(List<Method> exists, List<Method> unExists) {
		StringBuilder sb = new StringBuilder();
		sb.append(genCodeExists(exists));
		
		sb.append("\r\n\r\n\r\n//以下方法没有对应的get方法\r\n");
		for(Method method : unExists) {
			String setMethod = method.getName();
			String paramName = makeTypeToVar(setMethod.replaceFirst("set", ""));
			sb.append(String.format(
					""
					+ "\tdst.%s(%s);\r\n"
					+ ""
					, setMethod
					, paramName
					));
		}
		return sb.toString();
	}
	
	public static List<Method> getCopyMethods(Class<?> src, Class<?> dst, int retType) {
		List<Method> exists = new ArrayList<Method>();
		List<Method> unExists = new ArrayList<Method>();
		Method[] setMethods = dst.getMethods();
		//用set方法过滤，找出可以set的字段，并列出没有对应set的字段
		for(Method setMethod: setMethods) {
			String methdName = setMethod.getName();
			if(methdName.startsWith("set")) {
				String refName = methdName.replaceFirst("set", "get");
				try {
					Method getMethod = src.getMethod(refName);
					Class<?>[] paramTypes = setMethod.getParameterTypes();
					if(paramTypes.length != 1) {
						throw new NoSuchMethodException(); 
					}
					if(paramTypes[0] != getMethod.getReturnType()
							) {
						throw new NoSuchMethodException(); 
					}
					
					exists.add(setMethod);
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
					unExists.add(setMethod);
				}
			}
		}
		
		if(retType == 0) {
		return unExists;
		} else{
			return exists;
		}
	}
}
