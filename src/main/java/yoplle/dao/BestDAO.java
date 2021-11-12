package yoplle.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import yoplle.vo.RecipeVO;
import yoplle.vo.ShopBestVO;

@Repository
@ComponentScan(value="yoplle.dao")
public class BestDAO extends SqlSessionDaoSupport {
	
	@Resource(name="sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public List<ShopBestVO> productBestList(){
		return this.getSqlSession().selectList("shopBestList");
	}
	
	public List<RecipeVO> recipeBestList(HashMap<String, Object> map){
		return this.getSqlSession().selectList("selectRecipeList",map);
	}

}
