package yoplle.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yoplle.dao.OrderDAO;
import yoplle.vo.OrderDeCartVO;
import yoplle.vo.OrderDeVO;
import yoplle.vo.OrderInfoVO;


@Controller
public class OrderController {
	
	@Autowired
	private OrderDAO dao;

	
	@RequestMapping(value="/yoplle/cartTake.do")
	public String cartTakeout(String no, String id, Model model){
		String num[]=no.split("#"); // view에서 상품 번호를 받을 때 #을 구분자로 사용하였기 때문에 나누어 줌
		
		List<Integer> nums = new ArrayList<Integer>();
		for(int i=0; i<num.length; i++) {
			nums.add(Integer.parseInt(num[i]));
		}

		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("no", nums);
		model.addAttribute("it", dao.selectCartItem(map));
		
		return "/yoplle/cart-checkout";
	}


	@RequestMapping(value="/yoplle/checkSuc.do") // 단일 주문
	public String checkcSuccess(int no, int ea, OrderInfoVO oivo, OrderDeVO odvo) {
		Map<String, Object> sda = new HashMap<String, Object>();
		int i = dao.stockCheck(no) - ea;
		System.out.println(i);
		sda.put("ea", i);
		sda.put("no", no);
		int orderNo = dao.getOrderInfoSequence();
		oivo.setOrder_no(orderNo);
		odvo.setOrder_no(orderNo);
		odvo.setOr_de_no(dao.getOrderDeSequence());
		odvo.setItem_no(no);
		odvo.setOr_de_price(dao.getItemPrice(no) * ea);
		dao.insertOrderInfo(oivo);
		dao.insertOrderDe(odvo);
		dao.stockDownAction(sda);
		return "yoplle/shopping-success";
	}

	@RequestMapping(value="/yoplle/checkSucCart.do") // 추가 장바구니에서 여러 개 돌릴 때 사용
	public String checkSucCart(int[] itemno, OrderInfoVO oivo, OrderDeCartVO odvo) {
		
		List<Integer> nums = new ArrayList<Integer>();
		for(int i=0; i<itemno.length; i++) {
			nums.add(itemno[i]);
		}
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("userNo", oivo.getUser_no());
		map.put("itemNo", nums);
		int x =odvo.getItem_noV().length;
		int orderNo=dao.getOrderInfoSequence();
		oivo.setOrder_no(orderNo);
		dao.insertOrderInfo(oivo);
		for(int y=0; y<x; y++) {
			HashMap<String, Object>sda=new HashMap<String, Object>();
			int i=dao.stockCheck(odvo.getItem_noV()[y])-odvo.getOr_de_quanV()[y];
			sda.put("ea", i);
			sda.put("no", odvo.getItem_noV()[y]);
			odvo.setOrder_no(orderNo);
			odvo.setOr_de_no(dao.getOrderDeSequence());
			odvo.setOr_de_back("n");
			odvo.setOr_de_price(odvo.getOr_de_priceV()[y]);
			odvo.setOr_de_quan(odvo.getOr_de_quanV()[y]);
			odvo.setItem_no(odvo.getItem_noV()[y]);
			dao.insertOrderDe(odvo);
			dao.stockDownAction(sda);
		}
		dao.deleteCartSet(map);
		return "yoplle/shopping-success";
	}
}

