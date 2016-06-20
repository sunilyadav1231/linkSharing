import java.security.MessageDigest

/**
 * Created by ttnd on 18/6/16.
 */
class AuthUtils {

    static final String DIGEST_ALGORITHM = "SHA-256"
    static final char[] NIBBLE_TO_CHAR = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']

    static String getDigest(byte[] bytes ){
        try{
            MessageDigest messageDigest =MessageDigest.getInstance(DIGEST_ALGORITHM)
            return
        }catch(Exception e){

        }
    }


    static String byteArrayToHexString(byte[] bytes){
        StringBuilder buffer = new StringBuffer()
        if(bytes){
            for (int i=0;i<bytes.length;i++){
                byte b=bytes[i]
                int I = ((char)b) & 0x0FF
                buffer.append(NIBBLE_TO_CHAR[I>>>4])
                buffer.append(NIBBLE_TO_CHAR[I & 0x0F])
            }
        }
        buffer.toString()
    }
}
