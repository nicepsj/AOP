package com.multi.erp.naver.clova;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class OCRUtil {
	static String apiURL = "https://scss119stu.apigw.ntruss.com/custom/v1/19880/fbbc17ca091ca1b8d393ca74da1a935fd0c488756f0a14f77fc8cf2b38e7c171/infer";
	static String secretKey = "WUx3b1ZzZVBsWXdLZHdqWWZJV1JTY0NHUXF6bUloVU8=";
	//static String imageFile = "YOUR_IMAGE_FILE";
	//업로드해서 OCR서비스의 처리 결과를 리턴하는 메소드 - 컨트롤러에서 호출될 메소드(서비스역할)
	public static String getJsonText(String imagename) {
		StringBuffer response = null;
		try {
			//http통신을 하기 위한 객체생성
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			//http통신을 위한 객체에 설정한 값들
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			//OCR서비스를 실행하기 위해서 request에 설정할 값들을 json으로 생성
			//json만드는 코드를 jackson라이브러리로 변경
			//ObjectMapper라는 객체를 이용해서 JSONObject와 JSONArray를 생성하고 작업
			//JSONObject -> ObjectNode
			//JSONArray -> ArrayNode
			ObjectMapper mapper = new ObjectMapper();
			ObjectNode json = mapper.createObjectNode();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			
			ObjectNode image = mapper.createObjectNode();
			image.put("format", "jpg");
			image.put("name", "demo");
			
			ArrayNode images = mapper.createArrayNode();
			images.add(image);
			json.putArray("images").addAll(images);
			String postParams = json.toString();
			System.out.println("^^^^^^^^^^^^^^^^^^"+postParams);
			
			//http요청하기
			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imagename);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();
			//처리 후 response되면 response변수에 응답데이터를 저장
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return response.toString();
	}
	//OCR서비스로 처리 하기 위해서 naver 서버로 업로드 
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
}
