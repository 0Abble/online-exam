package io.renren.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JWTTokenUtils {

    //设置过期时间
    private static final long EXPIRE_DATE=30*60*100000;
    //token秘钥
    private static final String TOKEN_SECRET = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9";

    public static String token (String username,String password){

        String token = "";
        try {
            //过期时间
            Date date = new Date(System.currentTimeMillis()+EXPIRE_DATE);
            //秘钥及加密算法
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            //设置头部信息
            Map<String,Object> header = new HashMap<>();
            header.put("typ","JWT");
            header.put("alg","HS256");
            //携带username，password信息，生成签名
            token = JWT.create()
                    .withHeader(header)
                    .withClaim("account",username)
//                    .withClaim("password",password).withExpiresAt(date)
                    .withClaim("password",password)
                    .sign(algorithm);
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
        return token;
    }


    public static boolean verify(String token){
        /**
         * @desc   验证token，通过返回true
         * @params [token]需要校验的串
         **/
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            Map<String, Claim> claims = jwt.getClaims();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return  false;
        }
    }

    /**
     * 验证token.并且登录用户id
     */
    public static String geAccountByToken(String token) throws Exception {
        try {
            Map<String, Claim> claims = JWT.require(Algorithm.HMAC256(TOKEN_SECRET))
                    .build()
                    .verify(token)
                    .getClaims();
            return claims.get("account").asString();
        } catch (TokenExpiredException e) {
            throw new Exception("token已失效，请重新登录", e);
        } catch (JWTVerificationException e) {
            throw new Exception("token验证失败！", e);
        }
    }
    public static void main(String[] args) throws Exception {
//        System.out.println(token("lijun", "lijun"));
        System.out.println(geAccountByToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6ImE5NzU2NzY4MmMxYzhhYzFiM2VjZmZlNmM4MjI1YWQyYTliNzI4YmQ0YWY2YjA5YzdmMmZmNDdiNDUwOTE2NmQiLCJleHAiOjE2NzMwNzg4NTYsInVzZXJuYW1lIjoiMjEzMTAxMDYxOCJ9.LWTcDTvgYJD1WH-cP0E-YzrijDTrjs-jSSXicOCfRFk"));
    }


}
