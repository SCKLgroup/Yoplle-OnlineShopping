package yoplle.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import yoplle.vo.ItemVO;
import yoplle.vo.ShopDeRecipeVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class ItemDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	// 상품 리스트
	public List<ItemVO> selectItemCategory(String category) { 
		return this.getSqlSession().selectList("selectItemCategory",category);
	}
	
	// 상품 상세
	public ItemVO selectInfoItem(int no) {
		return this.getSqlSession().selectOne("selectInfoItem", no);
	}

	// 카테고리별 상품 수
	public Integer itemCount(String category) { 
		return this.getSqlSession().selectOne("getTotalItem", category);
	}
	
	// 상품 리스트
	public List<ItemVO> selectItemList(HashMap<String, Object> map) { 
		return this.getSqlSession().selectList("selectItemList", map);
	}
	
	// 상품 검색
	public List<ItemVO> searchItemList(String search) { 
		return this.getSqlSession().selectList("selectsearchItemList",search);
	}
	
	public List<ShopDeRecipeVO> selectShopDeRecipe(int no){
		return this.getSqlSession().selectList("recipeMatch", no);
	}

	// 상품 리스트 출력 (판매량순)
	public List<ItemVO> selectItemVolume(HashMap<String, Object> map){
		return this.getSqlSession().selectList("selectItemVolume", map);
	}

	public Integer getItemSequence() { // 상품 시퀀스
		return this.getSqlSession().selectOne("getItemSequence");
	}

	public void insertItem(ItemVO vo) { // 상품등록
		this.getSqlSession().insert("insertItem",vo);
	}
	public List<ItemVO> allSelectItem(){
		return this.getSqlSession().selectList("allSelectItem");
	}
	
	//관리자 페이지에서 카테고리별 상품 출력
	public List<ItemVO> selectItemAdminCate(HashMap<String, Object> jobs){
		return this.getSqlSession().selectList("selectItemAdminCate", jobs);
	}
	
	// 추가
	public int countItemAction(HashMap<String, Object> jobs) {
		return this.getSqlSession().selectOne("countItemAction", jobs);
	}
	
	// 추가 -> 아이템 삭제
	public void deleteItemAction(HashMap<String, Object>nos) {
		this.getSqlSession().delete("deleteItemAction", nos);
	}


}