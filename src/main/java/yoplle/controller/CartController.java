package yoplle.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import yoplle.dao.CartDAO;
import yoplle.dao.ItemDAO;
import yoplle.dao.UserDAO;
import yoplle.vo.CartVO;


@Controller
public class CartController {

	@Autowired
	private CartDAO cartdao;
	@Autowired
	private UserDAO userdao;
	@Autowired
	private ItemDAO itemdao;
	
	@RequestMapping(value="/yoplle/rightNow.do") 
	public String rightNowTake(int no, @RequestParam(value="ea",defaultValue="1") int ea, Model model, String id, String job) { 
		model.addAttribute("iteminfo", itemdao.selectInfoItem(no));
		model.addAttribute("userinfo", userdao.userInfoSelect(id));
		model.addAttribute("ea", ea);

		if(job.equals("buy")) {
			return "yoplle/checkout";
		}else {
			HashMap<String, Object> map =new HashMap<String, Object>();
			map.put("user_id", id);
			map.put("item_no", no);
			Integer quan=cartdao.cartCheckAction(map);
			if(quan==null) {
				map.put("cart_quan", ea);
				cartdao.insertCartAction(map);
			}else {
				map.put("cart_quan", ea+quan);
				cartdao.updateCartAction(map);
			}
			return "yoplle/shopping-cart";
		}
		
	}
	
	@RequestMapping(value="cartInsert.do")
	public String insertCartAction(String id) { //장바구니 출력
		
		return "yoplle/shopping-cart";
	}

	@RequestMapping(value="cartSelect.do")
	@ResponseBody
	public List<CartVO> selectCartAction(String id) { //장바구니 출력
		return cartdao.selectCartAction(id);
	}

	@RequestMapping(value="/yoplle/cart.do")
	public String selectCartAction(Model model,String id) { 
		return "yoplle/shopping-cart";
	}
	
	@RequestMapping(value="cartDelete.do")
	@ResponseBody
	public List<CartVO> selectDeleteCart(@RequestParam(value="no[]")List<String> no, Model model,String id) {
		for(String s :no) {
			cartdao.selectDeleteCart(Integer.parseInt(s));
		}
		return cartdao.selectCartAction(id);
	}
	
	@RequestMapping(value="quanUpdate.do")
	@ResponseBody
	public List<CartVO> quanUpdateAction(String cart_no, String cart_quan, String id) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cartno", cart_no);
		map.put("quan", cart_quan);
		
		cartdao.updateCartQuan(map);
	
		return cartdao.selectCartAction(id);
	}



}

