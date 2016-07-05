package com.CRFitness.Games.model;

import java.util.List;

import org.hibernate.Session;

public interface GamesDAO_interface {

	public boolean insert(GamesVO gamesVo);

	public boolean update(GamesVO gamesVo);

	public boolean Delete_All();
	
	public List<GamesVO> getAll();

}