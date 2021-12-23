package yoplle.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import yoplle.vo.CartVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class CartDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	// 장바구니 리스트
	public List<CartVO> selectCartAction(String id) {
		return this.getSqlSession().selectList("selectCart", id);
	}
	
	// 장바구니 동일 상품 체크
	public CartVO cartCheckAction(HashMap<String, Object> map) {
		return this.getSqlSession().selectOne("cartCheck", map);
	}
	
	// 장바구니 담기
	public void insertCartAction(HashMap<String, Object> map) { 
		this.getSqlSession().insert("insertCart", map);
	}

	// 장바구니 수량 업데이트
	public void updateCartQuan(HashMap<String, Object>map) {
		this.getSqlSession().update("updateCartQuan", map);
	}
	
	// 장바구니 상품 삭제
	public void selectDeleteCart(int no) {
		this.getSqlSession().delete("selectDeleteCart", no);
	}
	
	
}