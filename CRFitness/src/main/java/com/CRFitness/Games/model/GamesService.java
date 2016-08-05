package com.CRFitness.Games.model;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service("gamesService" )
public class GamesService {

	
	@Resource(name="gamesDAO")
	private GamesDAO_interface gamesDAO;
	
	public GamesService(){
		
	}
	
	public List<GamesVO> getAllGames() {
		return gamesDAO.getAll();
	}
	@PostConstruct
	@Scheduled(fixedRate=600000)
	public void addGames() {
		Document doc;
		GamesVO gamesVO=new GamesVO();
		gamesDAO.Delete_All();
				try {
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
					gamesVO.setGamesNumber(i+1);
					gamesVO.setGamesDate(element_date.get(i).text());
					gamesVO.setGamesName(element_name.get(i).text());
					gamesVO.setGamesUrl(element_link.get(i).absUrl("href"));
					gamesVO.setCounties(element_counties.get(i).text());
					gamesVO.setLocation(element_location.get(i).text());
					gamesVO.setRegistrationTime(element_registrationTime.get(i).text());
					gamesDAO.insert(gamesVO);
				} 
				} catch (IOException e) {
					
					e.printStackTrace();
				}								
	}
	

}
