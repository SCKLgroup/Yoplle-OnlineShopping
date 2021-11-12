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

import yoplle.vo.CartVO;
import yoplle.vo.FaqListVO;
import yoplle.vo.ItemVO;
import yoplle.vo.RecipeDeVO;
import yoplle.vo.RecipeHashVO;
import yoplle.vo.RecipeIngrVO;
import yoplle.vo.RecipeVO;
import yoplle.vo.ReviewVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class ReviewDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	// 문의--------------------------------
	public int getFaqSequence() {
		return this.getSqlSession().selectOne("getFaqSequence");
	}
	
	public List<FaqListVO> selectFaqList(int no) { //문의 리스트
		return this.getSqlSession().selectList("selectFaqList", no);
	}

	public void insertFaq(FaqListVO vo) { //문의 작성
		this.getSqlSession().insert("insertFaqList", vo);
	}

	
	// 리뷰--------------------------------
	public int getReviewSequence() {
		return this.getSqlSession().selectOne("getReviewSequence");
	}
	
	public List<ReviewVO> selectReviewList(int no) { //리뷰 리스트
		return this.getSqlSession().selectList("selectReview", no);
	}

	public int checkOrderUser(Map<String, Object> map) { //구매자 체크
		return this.getSqlSession().selectOne("checkOrderUser");
	}
	
	public void insertReview(ReviewVO vo) { //리뷰 작성
		this.getSqlSession().insert("insertReview", vo);
	}
	

}