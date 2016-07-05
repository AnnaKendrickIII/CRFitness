package com.CRFitness.Games.model;

public class GamesVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer gamesNumber;		
	private String gamesDate;			
	private String gamesName;		
	private String gamesUrl;			
	private String counties;		
	private String location;			
	private String registrationTime;
	public Integer getGamesNumber() {
		return gamesNumber;
	}
	public void setGamesNumber(Integer gamesNumber) {
		this.gamesNumber = gamesNumber;
	}
	public String getGamesDate() {
		return gamesDate;
	}
	public void setGamesDate(String gamesDate) {
		this.gamesDate = gamesDate;
	}
	public String getGamesName() {
		return gamesName;
	}
	public void setGamesName(String gamesName) {
		this.gamesName = gamesName;
	}
	public String getGamesUrl() {
		return gamesUrl;
	}
	public void setGamesUrl(String gamesUrl) {
		this.gamesUrl = gamesUrl;
	}
	public String getCounties() {
		return counties;
	}
	public void setCounties(String counties) {
		this.counties = counties;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(String registrationTime) {
		this.registrationTime = registrationTime;
	}		
	
	

}
