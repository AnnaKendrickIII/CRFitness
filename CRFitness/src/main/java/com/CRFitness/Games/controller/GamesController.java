package com.CRFitness.Games.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Friendships.model.FriendshipsService;
import com.CRFitness.Friendships.model.FriendshipsVO;
import com.CRFitness.Games.model.GamesService;
import com.CRFitness.Games.model.GamesVO;
import com.CRFitness.Member.model.MemberService;
import com.CRFitness.Member.model.MemberVO;

@Controller
@RequestMapping("/Games")
public class GamesController {

	@Resource(name = "gamesService")
	private GamesService gamesService;

	@RequestMapping(method = RequestMethod.GET, value = "/getAllGames", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<GamesVO> getAllGames() {		
		return gamesService.getAllGames();
	}
}
