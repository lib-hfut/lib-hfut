package util;


import java.io.FileInputStream;
import java.io.FileWriter;
import java.security.*;
import java.security.cert.Certificate;

/**
 * @author zhen
 * @Date 2018/4/16 10:58
 */
public class CertExport {

    //导出证书 base64格式
    public static void exportCert(KeyStore keyStore, String alias, String exportFile) throws Exception {
        Certificate certificate = keyStore.getCertificate(alias);
        String encoded = Base64.encode(new String(certificate.getEncoded()));
        FileWriter fw = new FileWriter(exportFile);
        fw.write("------Begin Certificate----- \r\n ");//非必须
        fw.write(encoded);
        fw.write("\r\n-----End Certificate-----");//非必须
        fw.close();
    }

    //得到KeyPair
    public static KeyPair getKeyPair(KeyStore keyStore, String alias, char[] password) {
        try {
            Key key = keyStore.getKey(alias, password);
            if (key instanceof PrivateKey) {
                Certificate certificate = keyStore.getCertificate(alias);
                PublicKey publicKey = certificate.getPublicKey();
                return new KeyPair(publicKey, (PrivateKey) key);
            }
        } catch (UnrecoverableKeyException | NoSuchAlgorithmException | KeyStoreException e) {
            e.printStackTrace();
        }
        return null;
    }

    //导出私钥
    public static void exportPrivateKey(PrivateKey privateKey, String exportFile) throws Exception {

        String encoded = Base64.encode(new String(privateKey.getEncoded()));
        FileWriter fileWriter = new FileWriter(exportFile);
        fileWriter.write("-----Begin Private Key-----\r\n");//非必须
        fileWriter.write(encoded);
        fileWriter.write("\r\n-----End Private Key-----");//非必须
        fileWriter.close();
    }

    //导出公钥
    public static void exportPublicKey(PublicKey publicKey, String exportFile) throws Exception {
        String encoded = Base64.encode(new String(publicKey.getEncoded()));
        FileWriter fileWriter = new FileWriter(exportFile);
        fileWriter.write("-----Begin Public Key-----\r\n");//非必须
        fileWriter.write(encoded);
        fileWriter.write("\r\n-----End Public Key-----");//非必须
        fileWriter.close();
    }

    public static void main(String[] args) throws Exception {
        String keyStoreType = "jks";
        String keystoreFile = "D:\\hfut.keystore";
        String password = "123456"; //keystore的解析密码
        String friendPassword = "123456";//条目的解析密码

        KeyStore keyStore = KeyStore.getInstance(keyStoreType);
        keyStore.load(new FileInputStream(keystoreFile), password.toCharArray());

        String alias = "hfut";//条目别名
        String exportCertFile = "D:\\cert.txt";
        String exportPrivateFile = "D:\\privateKey.txt";
        String exportPublicFile = "D:\\publicKey.txt";

        CertExport.exportCert(keyStore, alias, exportCertFile);
        KeyPair keyPair = CertExport.getKeyPair(keyStore, alias, friendPassword.toCharArray()); //注意这里的密码是你的别名对应的密码，不指定的话就是你的keystore的解析密码
        CertExport.exportPrivateKey(keyPair.getPrivate(), exportPrivateFile);
        CertExport.exportPublicKey(keyPair.getPublic(), exportPublicFile);

        System.out.println("OK");

    }
}



