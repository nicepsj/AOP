package test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


//Clova OCR서비스를 제공하는 서버에 접속이 되는지 테스트
public class Test {

	public static void main(String[] args) {
		String apiURL
		= "https://scss119stu.apigw.ntruss.com/custom/v1/19880/fbbc17ca091ca1b8d393ca74da1a935fd0c488756f0a14f77fc8cf2b38e7c171/infer";
			
		String secretKey = "WUx3b1ZzZVBsWXdLZHdqWWZJV1JTY0NHUXF6bUloVU8=";
		//디스크에서 서버로 전송할 파일을 준비
		String imagename = "20221228030247.jpg";
		String imagepath = Paths.get(System.getProperty("user.dir") , "src","main","webapp","WEB-INF","static","images").toString();
		String imageFile = imagepath+"\\"+imagename;
		System.out.println(imageFile);		
		try {
			//http통신을 위해 준비
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			//Http통신을 담당하는 객체에 속성을 설정
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			//요청객체에 필요한 값을 셋팅
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			//API를 요청하기 위해 필요한 모든 값들을 json객체로 만들어서 전송
			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			
			//이미지파일을 base64로 인코딩
			File f = new File(imageFile);
			FileInputStream fis = new FileInputStream(f);
			//파일을 바이트로(바이너리데이터로) 변환
			byte[] byteArray = new byte[(int)f.length()];
			//바이너리로 변환된 파일을 읽기
			fis.read(byteArray);
			//바이너리데이터를 base64로 인코딩
			String imageString = Base64.getEncoder().encodeToString(byteArray);
			System.out.println(imageString);
			//base64형식으로 변환된 이미지를 json에 전송
			image.put("data", imageString); // image should be public, otherwise, should use data
		
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.add(image);
			json.put("images", images);
			String postParams = json.toString();
			
			//전송
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			//응답되는 데이터를 StringBuffer에 추가하기
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			//응답을 출력하기
			System.out.println(response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}

