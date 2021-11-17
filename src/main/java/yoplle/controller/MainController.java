package yoplle.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yoplle.dao.BestDAO;
import yoplle.dao.ItemDAO;
import yoplle.dao.RecipeDAO;
import yoplle.vo.ItemVO;


@Controller
public class MainController {
	
	@Autowired
	private ItemDAO itemdao;
	@Autowired
	private BestDAO bestdao;
	@Autowired
	private RecipeDAO recipedao;
	
	@ResponseBody
	@RequestMapping(value="mainPageCategory.do") //메인페이지 카테고리
	public List<ItemVO> mainCategoryAjax(String category) {
		return itemdao.selectItemCategory(category);
	}
	
	@RequestMapping(value = "/yoplle/mainPage.do")
	public String mainlistAction(Model model) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 10);
		map.put("dbsort", "rpe_like");
		
		model.addAttribute("recipeBest", recipedao.selectRecipeList(map));
		
		model.addAttribute("itemList", itemdao.selectItemCategory("과일"));
		model.addAttribute("itemBest", bestdao.productBestList());

		return "yoplle/mainPage";
	}
	

}  

