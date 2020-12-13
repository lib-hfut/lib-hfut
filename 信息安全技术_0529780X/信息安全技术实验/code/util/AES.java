package util;

import java.io.*;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AES {
    private static final String CHARSET = "utf-8";
    public static byte[] encrypt(byte[] key, byte[] data) {
        //if (key.length != 16) {
        if (key.length-16!=0) {
            throw new RuntimeException("Invalid AES key length (must be 16 bytes)");
        }
        try {
            SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] niv=new byte[16];
            for(int i=0;i<16;i++){
            	niv[i]=key[i];
            }
            IvParameterSpec iv = new IvParameterSpec(niv);
            cipher.init(Cipher.ENCRYPT_MODE, seckey, iv);
            byte[] result = cipher.doFinal(data);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("encrypt fail!", e);
        }
    }

    public static byte[] decrypt(byte[] key, byte[] data) {
      //if (key.length != 16) {
        if (key.length-16!=0) {
            throw new RuntimeException("Invalid AES key length (must be 16 bytes)");
        }
        try {
            SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] niv=new byte[16];
            for(int i=0;i<16;i++){
            	niv[i]=key[i];
            }
            IvParameterSpec iv = new IvParameterSpec(niv);
            cipher.init(Cipher.DECRYPT_MODE, seckey, iv);
            byte[] result = cipher.doFinal(data);
            return result; // 解密
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("decrypt fail!", e);
        }
    }

    public static String decrypt(String key,String data){
        String r="";
        try {
            r= bytesToString(decrypt(key.getBytes(CHARSET),Base64.decode(data.getBytes(CHARSET))));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return r;
    }

    public static String encrypt(String key,String data){
        String r="";
        try {
            r=new String(Base64.encode(encrypt(key.getBytes(CHARSET),data.getBytes(CHARSET))));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return r;
    }

    public static byte[] genarateRandomKey() {
        KeyGenerator keygen = null;
        try {
            keygen = KeyGenerator.getInstance("AES/CBC/PKCS5Padding");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("genarateRandomKey fail!", e);
        }
        SecureRandom random = new SecureRandom();
        keygen.init(random);
        Key key = keygen.generateKey();
        return key.getEncoded();
    }

    public static String encryptFile(String password, String srcFile, String destFile) {

        if (password== null || password.length() < 8) {
            throw new RuntimeException("加密失败，key不能小于8位");
        }
        try {
            byte[] key=password.getBytes();
            byte[] niv=new byte[16];
            for(int i=0;i<16;i++){
                niv[i]=key[i];
            }
            IvParameterSpec iv = new IvParameterSpec(niv);
            SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, seckey, iv);
            InputStream is = new FileInputStream(srcFile);
            OutputStream out = new FileOutputStream(destFile);
            CipherInputStream cis = new CipherInputStream(is, cipher);
            byte[] buffer = new byte[1024];
            int r;
            while ((r = cis.read(buffer)) > 0) {
                out.write(buffer, 0, r);
            }
            cis.close();
            is.close();
            out.close();
            return destFile;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static String decryptFile(String password, String srcFile, String destFile) {
        if (password== null || password.length() < 8) {
            throw new RuntimeException("加密失败，key不能小于8位");
        }
        try {
            File file = new File(destFile);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
            byte[] key=password.getBytes();
            byte[] niv=new byte[16];
            for(int i=0;i<16;i++){
                niv[i]=key[i];
            }
            IvParameterSpec iv = new IvParameterSpec(niv);
            SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            byte[] enCodeFormat = secretKey.getEncoded();
            SecretKeySpec seckey = new SecretKeySpec(enCodeFormat, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, seckey, iv);
            InputStream is = new FileInputStream(srcFile);
            OutputStream out = new FileOutputStream(destFile);
            CipherOutputStream cos = new CipherOutputStream(out, cipher);
            byte[] buffer = new byte[1024];
            int r;
            while ((r = is.read(buffer)) >= 0) {
                cos.write(buffer, 0, r);
            }
            cos.close();
            is.close();
            out.close();
            return destFile;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }


    public static String bytesToString(byte[] bytes){
        StringBuffer sBuffer=new StringBuffer();
        for(int i=0;i<bytes.length;i++){
            sBuffer.append((char)bytes[i]);
        }
        return sBuffer.toString();
    }

}
