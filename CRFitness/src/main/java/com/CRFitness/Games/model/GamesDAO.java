package com.CRFitness.Games.model;

import java.io.IOException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional(transactionManager = "transactionManager")
@Repository("gamesDAO")
public class GamesDAO implements GamesDAO_interface {

	private static final String GET_ALL_STMT = "from GamesVO";
	private static final String DELETE_ALL = "delete  Games";
	@Autowired
	private SessionFactory sessionFactory;

	public GamesDAO() {

	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}


	@Override
	public boolean Delete_All() {	
		int num = this.getSession().createSQLQuery(DELETE_ALL).executeUpdate();
		if(num==1){
			return true;
		}else{
			return false;
		}	
	}
	
	@Override
	public boolean insert(GamesVO gamesVO) {
		if (gamesVO != null) {
			this.getSession().saveOrUpdate(gamesVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(GamesVO gamesVO) {
		if (gamesVO != null) {
			this.getSession().saveOrUpdate(gamesVO);
			return true;
		}
		return false;
	}

	@Override
	public List<GamesVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<GamesVO>) query.list();
	}
    public static void main(String[]args){
    	ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		GamesDAO_interface dao = (GamesDAO_interface) context.getBean("gamesDAO");
		Document doc;
		GamesVO gamesVO=new GamesVO();
		dao.Delete_All();
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
					dao.insert(gamesVO);
				} 
				} catch (IOException e) {
					
					e.printStackTrace();
				}						
		((ConfigurableApplicationContext) context).close();
    	
    }
}
