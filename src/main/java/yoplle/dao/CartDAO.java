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
	
	public List<CartVO> selectCartAction(String id) { //장바구니 출력
		return this.getSqlSession().selectList("selectCart", id);
	}
	
	public CartVO cartCheckAction(HashMap<String, Object> map) { //장바구니 동일 상품 체크
		return this.getSqlSession().selectOne("cartCheck", map);
	}
	
	public void insertCartAction(HashMap<String, Object> map) { //장바구니 담기
		this.getSqlSession().insert("insertCart", map);
	}

	public void updateCartQuan(HashMap<String, Object>map) { //장바구니 수량 업데이트
		this.getSqlSession().update("updateCartQuan", map);
	}

	public void selectDeleteCart(int no) { //장바구니 상품 삭제
		this.getSqlSession().delete("selectDeleteCart", no);
	}
	
	
	
//	public int countCart(int no) {
//		return this.getSqlSession().selectOne("countCart", no);
//	}
	
//	public void updateCartAction(HashMap<String, Object> map) { //장바구니 상품 개수 업데이트
//	this.getSqlSession().update("updateCart", map);
//}
	
}