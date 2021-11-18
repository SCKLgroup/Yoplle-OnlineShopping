
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
	
	@RequestMapping(value="/yoplle/cartIn.do") 
	public String cartInsert(int itemno, @RequestParam(value="ea",defaultValue="1") int ea, Model model, String id) { 
		model.addAttribute("iteminfo", itemdao.selectInfoItem(itemno)); //상품 정보
		model.addAttribute("userinfo", userdao.userInfoSelect(id)); //회원 정보
		model.addAttribute("ea", ea); //장바구니에 담을 상품 개수 

		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("user_id", id);
		map.put("item_no", itemno);
		
		CartVO cart=cartdao.cartCheckAction(map);
		
		if(cart==null) { //기존 장바구니에 해당 상품이 없을 경우
			map.put("cart_quan", ea);
			cartdao.insertCartAction(map);
		}else { //기존 장바구니에 해당 상품이 있을 경우 개수 업데이트 
			map.put("cart_quan", ea+cart.getCart_quan());
			map.put("cart_no", cart.getCart_no());
			cartdao.updateCartQuan(map);
		}
		return "yoplle/shopping-cart";
	}

	@RequestMapping(value="/yoplle/itemOrder.do") 
	public String itemOrder(int itemno, @RequestParam(value="ea",defaultValue="1") int ea, Model model, String id) { 
		model.addAttribute("iteminfo", itemdao.selectInfoItem(itemno)); //상품 정보
		model.addAttribute("userinfo", userdao.userInfoSelect(id)); //회원 정보
		model.addAttribute("ea", ea); //구매할 상품 개수 
		
		return "yoplle/checkout";
	}
	
	@RequestMapping(value="cartSelect.do")
	@ResponseBody
	public List<CartVO> selectCartAction(String id) { //장바구니 출력
		return cartdao.selectCartAction(id);
	}

	
	@RequestMapping(value="cartDelete.do")
	@ResponseBody
	public List<CartVO> selectDeleteCart(@RequestParam(value="no[]")List<String> no, Model model,String id) {//장바구니 상품 삭제
		for(String s :no) {
			cartdao.selectDeleteCart(Integer.parseInt(s));
		}
		return cartdao.selectCartAction(id);
	}
	
	@RequestMapping(value="quanUpdate.do")
	@ResponseBody
	public List<CartVO> quanUpdateAction(String cart_no, String cart_quan, String id) { //장바구니 상품 수 업데이트
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cart_no", cart_no);
		map.put("cart_quan", cart_quan);
		
		cartdao.updateCartQuan(map);
	
		return cartdao.selectCartAction(id);
	}

//	@RequestMapping(value="/yoplle/cart.do")
//	public String selectCartAction(Model model,String id) { 
//		return "yoplle/shopping-cart";
//	}
	
//	@RequestMapping(value="cartInsert.do")
//	public String insertCartAction(String id) { //장바구니 출력
//		return "yoplle/shopping-cart";
//	}

}

