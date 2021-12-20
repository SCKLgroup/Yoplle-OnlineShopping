package yoplle.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yoplle.dao.ItemDAO;
import yoplle.dao.RecipeDAO;
import yoplle.dao.BestDAO;

@Controller
public class BestController{
	
	@Autowired
	private BestDAO bestdao;
	
	@RequestMapping(value="/yoplle/productBest.do") // 상품 베스트
	public String productBestList(Model model) {
		model.addAttribute("probest", bestdao.productBestList());
		return "yoplle/shop-best";
	}
	
	@RequestMapping(value="/yoplle/recipeBest.do") // 레시피 베스트
	public String recipeBestList(Model model) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("dbsort", "rpe_like");
		map.put("start", 1);
		map.put("end", 20);
		
		model.addAttribute("recipeBestList", bestdao.recipeBestList(map));
		return "yoplle/recipe-best";
	}
}
