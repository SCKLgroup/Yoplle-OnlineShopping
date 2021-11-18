package yoplle.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import yoplle.dao.ItemDAO;
import yoplle.dao.OrderDAO;
import yoplle.dao.UserDAO;
import yoplle.vo.OrderDeCartVO;
import yoplle.vo.OrderDeVO;
import yoplle.vo.OrderInfoVO;


@Controller
public class OrderController {
	
	@Autowired
	private OrderDAO dao;
	@Autowired
	private UserDAO userdao;
	@Autowired
	private ItemDAO itemdao;

	
	@RequestMapping(value="/yoplle/cartTake.do") // 카트 주문 출력
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

	@RequestMapping(value="/yoplle/itemOrder.do") 
	public String itemOrder(int itemno, @RequestParam(value="ea",defaultValue="1") int ea, Model model, String id) { 
		model.addAttribute("iteminfo", itemdao.selectInfoItem(itemno)); //상품 정보
		model.addAttribute("userinfo", userdao.userInfoSelect(id)); //회원 정보
		model.addAttribute("ea", ea); //구매할 상품 개수 
		
		return "yoplle/checkout";
	}
	
	@RequestMapping(value="/yoplle/checkSuc.do") // 단일 주문
	public String checkcSuccess(int no, int ea, OrderInfoVO oivo, OrderDeVO odvo) {
		Map<String, Object> sda = new HashMap<String, Object>();
		int i = dao.stockCheck(no) - ea;
		System.out.println(i);
		sda.put("ea", i);
		sda.put("no", no);
		int orderNo = dao.getOrderInfoSequence(); // Order_de와 OrderInfo에서 같은 값을 사용
		oivo.setOrder_no(orderNo);
		odvo.setOrder_no(orderNo);
		odvo.setOr_de_no(dao.getOrderDeSequence());
		odvo.setItem_no(no);
		odvo.setOr_de_price(dao.getItemPrice(no) * ea);
		dao.insertOrderInfo(oivo); // OrderInfo 테이블에 데이터 추가
		dao.insertOrderDe(odvo); // Order_De 테이블에 데이터 추가
		dao.stockDownAction(sda); // 상품 재고에서 결제한 수량 감소
		return "yoplle/shopping-success";
	}

	@RequestMapping(value="/yoplle/checkSucCart.do") // 다중 상품 구매
	public String checkSucCart(int[] itemno, OrderInfoVO oivo, OrderDeCartVO odvo) {
		
		List<Integer> nums = new ArrayList<Integer>();
		for(int i=0; i<itemno.length; i++) { // 상품 번호를 배열로 받아 List에 추가
			nums.add(itemno[i]);
		}
		// mapper에서 foreach를 사용하기 위해 map 생성
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("userNo", oivo.getUser_no()); 
		map.put("itemNo", nums);
		int x =odvo.getItem_noV().length; // 카트 안의 상품만큼 for문 돌리기 위해 생성
		int orderNo=dao.getOrderInfoSequence();
		oivo.setOrder_no(orderNo);
		dao.insertOrderInfo(oivo);
		for(int y=0; y<x; y++) {
			HashMap<String, Object>sda=new HashMap<String, Object>(); // 수량 감소를 위해 map 생성
			int i=dao.stockCheck(odvo.getItem_noV()[y])-odvo.getOr_de_quanV()[y]; // 구매한 수량과 현재 아이템 재고 수식
			sda.put("ea", i);
			sda.put("no", odvo.getItem_noV()[y]);
			odvo.setOrder_no(orderNo);
			odvo.setOr_de_no(dao.getOrderDeSequence());
			odvo.setOr_de_back("n");
			odvo.setOr_de_price(odvo.getOr_de_priceV()[y]);
			odvo.setOr_de_quan(odvo.getOr_de_quanV()[y]);
			odvo.setItem_no(odvo.getItem_noV()[y]);
			dao.insertOrderDe(odvo); // OrderDe 테이블에 데이터 생성
			dao.stockDownAction(sda);
		}
		dao.deleteCartSet(map);
		return "yoplle/shopping-success";
	}
}

