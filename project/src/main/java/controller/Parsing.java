//인덱스에 필요한 영화정보

package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.net.URLEncoder;

import org.apache.coyote.ContinueResponseTiming;
import org.json.JSONArray;
import org.json.JSONObject;

public class Parsing {	
	
	//박스오피스의 영화 이름, 오픈 일자, 순위, 누적 관객수, 오피스 식별코드를 2차원 배열 리턴
	public String[][] getMovieData() throws Exception {

        // 현재 날짜 구하기
        LocalDate now = LocalDate.now().minusDays(1); 
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        
        String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + now.format(formatter);
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");

        int responseCode = con.getResponseCode();

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        JSONObject jsonObj = new JSONObject(response.toString());
        JSONArray jsonArray = jsonObj.getJSONObject("boxOfficeResult").getJSONArray("dailyBoxOfficeList");

        int length = jsonArray.length();
        String[][] movieArr = new String[length][5];

        for (int i = 0; i < length; i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            movieArr[i][0] = jsonObject.getString("movieNm"); //영화 이름
            movieArr[i][1] = jsonObject.getString("openDt"); //오픈 일자
            movieArr[i][2] = jsonObject.getString("rank");; //순위
            movieArr[i][3] = jsonObject.getString("audiAcc"); //누적 관객수
            movieArr[i][4] = jsonObject.getString("movieCd"); //오피스 식별
        }
        return movieArr;
    }

	// 영화 이름을 바탕으로 상세 정보 리턴
	public String[][] getMovieDetail() throws Exception {
		String[][] boxList = getMovieData();
		String[][] boxDetail = new String[boxList.length][4];
		try {
			for (int i = 0; i < boxList.length; i++) {
				StringBuilder urlBuilder = new StringBuilder(
						"https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=N&title=");
				urlBuilder.append("=" + URLEncoder.encode(boxList[i][0], "UTF-8"));
				urlBuilder.append("&ServiceKey=G8C52Q0G7Y8216GV8056");
				URL obj = new URL(urlBuilder.toString());

				HttpURLConnection con = (HttpURLConnection) obj.openConnection();

				con.setRequestMethod("GET");
				con.setRequestProperty("User-Agent", "Mozilla/5.0");

				int responseCode = con.getResponseCode();

				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();

				JSONObject jsonObj = new JSONObject(response.toString());
				JSONArray jsonArray = (JSONArray) jsonObj.get("Data");
				for (int j = 0; j < jsonArray.length(); j++) {
					JSONObject jsonArray1 =  (JSONObject)jsonArray.get(j);
					JSONArray jsonArray2 = jsonArray1.getJSONArray("Result");
					for (int k = 0; k < jsonArray2.length(); k++) {
						JSONObject jsonArray3 = (JSONObject)jsonArray2.get(k);
						JSONArray jsonArray4 = jsonArray3.getJSONObject("plots").getJSONArray("plot");
						boxDetail[i][0] = jsonArray3.getString("runtime"); //상영시간
						boxDetail[i][1] = jsonArray3.getString("rating"); //연령제한
						boxDetail[i][2] = jsonArray3.getString("genre"); //장르
						for (int l = 0; l < jsonArray4.length(); l++) {
							JSONObject jsonArray5 =  (JSONObject)jsonArray4.get(j);							
							boxDetail[i][3] = jsonArray5.getString("plotText"); //영화설명	
						}						
					}	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boxDetail;
	}
	
	//영화 이름을 바탕으로 포스터 이미지 주소 리턴
	public String[] getMovieImage() throws Exception {
		
		String[][] boxList = getMovieData();
        String[] boxPost = new String[boxList.length];
    		for(int i = 0; i < boxList.length; i++) {
    	        try {            
	                // API 요청 주소	        	
	                String apiUrl = "https://api.themoviedb.org/3/search/movie?api_key=9438087812a8e9304a74e341a23d1a9d&language=kr&query=" + boxList[i][0].replaceAll(" ", "%20");                
	                URL url = new URL(apiUrl);
	                HttpURLConnection con = (HttpURLConnection) url.openConnection();
	                con.setRequestMethod("GET");
	
	                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	                String inputLine;
	                StringBuffer response = new StringBuffer();
	                while ((inputLine = in.readLine()) != null) {
	                    response.append(inputLine);
	                }
	                in.close();
	
	                // JSON 파싱
	                JSONObject jsonObject = new JSONObject(response.toString());
	                JSONArray results = jsonObject.getJSONArray("results");
	                JSONObject result = results.getJSONObject(0);
	                String posterPath = result.getString("poster_path");	            
	                boxPost[i] = "https://image.tmdb.org/t/p/original" + posterPath;
    			} catch (Exception e) {
    	            boxPost[i] = "https://ifh.cc/g/ZsJBDy.jpg";                      
    			}
    		}		
		return boxPost;
    }

	// 영화 설명 글자수 제한
	public String textLimit(String str) {	 
		if(str.length() > 100) str = str.substring(0, 97) + "...";		
		return str;
	}

	
}