package yoplle.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import yoplle.vo.ItemVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class MainDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public List<ItemVO> selectAjaxMainList() {
		return this.getSqlSession().selectList("selectAjaxMainList");
	}
	
	public List<ItemVO> selectMainItemBest() { // 메인페이지 상품 베스트
		return this.getSqlSession().selectList("mainItemBest");
	}

//	public List<RecipeVO> selectMainRecipe() { // 메인페이지 레시피 베스트
//		return this.getSqlSession().selectList("selectMainRecipe");
//	}
}