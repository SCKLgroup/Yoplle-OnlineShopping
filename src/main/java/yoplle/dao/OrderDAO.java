package yoplle.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import yoplle.vo.CartTakeVO;
import yoplle.vo.OrderDeCartVO;
import yoplle.vo.OrderDeVO;
import yoplle.vo.OrderInfoVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class OrderDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public void insertOrderInfo(OrderInfoVO vo){
		this.getSqlSession().insert("insertOrderInfo", vo);
	}

	public int getOrderInfoSequence() {
		return this.getSqlSession().selectOne("getOrderInfoSequence");
	}
	public int getOrderDeSequence() {
		return this.getSqlSession().selectOne("getOrderDeSequence");
	}
	public int getItemPrice(int itemNo) {
		return this.getSqlSession().selectOne("getItemPrice", itemNo);
	}
	
	public List<CartTakeVO> selectCartItem(Map<String, Object> map){
		return this.getSqlSession().selectList("selectCartTakeout", map);
	}
	public void deleteCartSet(HashMap<String, Object>map) {
		this.getSqlSession().delete("deleteCartSet", map);
	}
	
	public void insertOrderDe(OrderDeVO vo){
		this.getSqlSession().insert("insertOrderDe", vo);
	}
	public void insertOrderDe(OrderDeCartVO vo) {
		this.getSqlSession().insert("insertOrderCartDe", vo);
	}
	// 상품 구매 시 수량 차감
	public void stockDownAction(Map<String, Object> sda) {
		this.getSqlSession().update("stockDownAction", sda);
	}
	// 상품 수량 확인
	public int stockCheck(int no) {
		return this.getSqlSession().selectOne("stockCheck", no);
	}

	
}