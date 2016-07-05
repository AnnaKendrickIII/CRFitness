package com.init;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
//已測試網址: 
//http://www.jsoup.org
/**
* 執行本程式時必須加上VM參數: -Xmx1024m
* @author 王憲春
*
*/
public class TestJsoup extends TimerTask{
	
	String mainSite ; 		// ex: http://www.iiiedu.org.tw
	String baseToken ;  	// ex: iiiedu.org.tw 
	Set<String> visitedUrls = new HashSet<>();
	Set<String> exclusiveUrls = new HashSet<>();
	PrintWriter out, logOK, logNG ;

	@Override
	public void run() {
		Document doc;
		try {
			doc = Jsoup.connect("http://tw.running.biji.co/index.php?q=competition").get();
			Elements nextLinks = doc.select(".com_detail_info div");	
			for (Element link : nextLinks) {
				System.out.println(link.text()+":"+link.absUrl("href"));
			}
		} catch (IOException e) {
		
			e.printStackTrace();
		}		
	}
	
	public static void main(String[] args) throws IOException  {
//		TestJsoup ra = new TestJsoup("http://www.iiiedu.org.tw");
		
//		 Timer timer = new Timer();
//	        long delayTime = 1 * 1000;
//	        long period = 5 * 1000;
//	        timer.schedule(new TestJsoup(), delayTime, period);
//		
		Document doc;
		doc = Jsoup.connect("http://www.ibodygo.com.tw/index.aspx").timeout(10*1000).get();
		//日期
		Elements element_date = doc.select(".tablestyle tbody tr:gt(1):not(.noborder)>td:nth-child(1)");
		//賽事名
		Elements element_name= doc.select(".tablestyle tbody tr:gt(1)>td:nth-child(2)");			
		//賽事連結
		Elements element_link = doc.select(".tablestyle tbody tr:gt(1)>td:nth-child(2) a");		
		//縣市
		Elements element_counties = doc.select(".tablestyle tbody tr:gt(1):not(.noborder)>td:nth-child(3)");
		//地點
		Elements element_location = doc.select(".tablestyle tbody tr:gt(1):not(.noborder)>td:nth-child(4)");
		//報名時間
		Elements element_registrationTime = doc.select(".tablestyle tbody tr:gt(1):not(.noborder)>td:nth-child(6)");
		for(int i=0;i<element_date.size();i++){
			System.out.println(element_date.get(i).text()+":"+element_name.get(i).text()
			+element_link.get(i).absUrl("href"));
			System.out.println(element_counties.get(i).text()+" ,"+element_location.get(i).text()
					+" ,"+element_registrationTime.get(i).text());
		}
		
//		for(Element link:nextLinks){
//			System.out.println(link.text());			
//		}		
			



	        
//		ra.linkTraversal(ra.mainSite);
	}
	
	public TestJsoup() {
	}
	//建構子帶網址進來
	public TestJsoup(String url) {
		mainSite = url;
		extractBaseToken();
		readExclusiveURL();
		try {
			out = new PrintWriter(new FileWriter("visitedURL.txt"));
			logOK = new PrintWriter(new FileWriter("visitedLogOK.txt"));
			logNG = new PrintWriter(new FileWriter("visitedLogNG.txt"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void extractBaseToken() {
		// url=http://localhost:8080/example/index.jsp
		int start = mainSite.indexOf("//") + 2;
		String seg = mainSite.substring(start);
		int end = seg.indexOf("/") == -1 ? seg.length() : seg.indexOf("/") ;
	
		String url = seg.substring(0, end);
		String verifyToken = "www." ;
		if (url.startsWith(verifyToken)){
			baseToken = url.substring(verifyToken.length());
		} else {
			baseToken = url;
		}		
		System.out.println("baseToken=" + baseToken);
	}

	private void readExclusiveURL() {
		try {
			BufferedReader br = new BufferedReader(new FileReader(
					"ExclusiveURL.txt"));
			String line = null;
			while ((line = br.readLine()) != null) {
				System.out.println("line="+line.trim());
				exclusiveUrls.add(line.trim());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void linkTraversal(String url) throws IOException {
		int idx = 0 ;
        if ( (idx = url.indexOf("#")) != -1){
        	url = url.substring(0, idx);
        }
		if (needsToVisit(url)) { // 如果需要拜訪此網址
			logOK.println("需要拜訪------->" + url);
			logOK.flush();
			if (url.indexOf("java.sun.com")!=-1){
				    System.out.println("注意!!!");
					System.exit(0);
			}
			visitedUrls.add(url);
			
			try {
				out.println(url);
				out.flush();
				Document doc = Jsoup.connect(url).get(); // 連上此網站並取去對應的網頁

				/* ... 處理網頁內的資料 ... */
				Elements nextLinks = doc.select("a[href]");
				System.out.println("-->nextLinks.size=" + nextLinks.size());
				for (Element link : nextLinks) {
					linkTraversal(link.absUrl("href")); // Recursive call 
				}
			} catch (org.jsoup.HttpStatusException ex) {
				System.out.println("Http Status Exception:" + ex.getMessage()
						+ url);
			} catch (java.net.MalformedURLException ex) {
				System.out.println("MalformedURL Exception:" + ex.getMessage()
						+ url);
			} catch (java.io.IOException ex) {
				System.out.println("IO Exception:" + ex.getMessage()
						+ url);
			} catch (Exception ex) {
				System.out.println("Exception:" + ex.getMessage()
						+ url);
			} 
		} else {
			logNG.println("不需拜訪------->url=" + url);
			logNG.flush();
		}
	}

	private boolean  needsToVisit(String url) {
		if (visitedUrls.contains(url)) {
			return false;
		}
		if (url.indexOf(baseToken) != -1){
			//System.out.println("baseToken==>" + baseToken + ", url=" + url);
			return true;
		}
		for(String s: exclusiveUrls){
			if (url.indexOf(s) != -1){
				return false;
			}
		}
		System.out.println("NG------->baseToken=" + baseToken + ", url=" + url);
		return false; 		
	}
	

//	private void savevisitedUrls() {
//	try {
//		PrintWriter out = new PrintWriter(new FileWriter("visitedURL.txt"));
//		for(String s :  visitedUrls){
//			out.println(s);
//		}
//		out.close();
//	} catch (IOException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//	
//}
}
