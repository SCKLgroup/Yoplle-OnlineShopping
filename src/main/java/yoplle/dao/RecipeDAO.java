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
import yoplle.vo.RecipeComVO;
import yoplle.vo.RecipeDeVO;
import yoplle.vo.RecipeHashVO;
import yoplle.vo.RecipeIngrVO;
import yoplle.vo.RecipeVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class RecipeDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public Integer getRpeSequence() { //레시피 시퀀스
		return this.getSqlSession().selectOne("getRpeSequence");
	}
	
	public Integer getRpeIngrSequence() { //레시피 재료 시퀀스
		return this.getSqlSession().selectOne("getRpeIngrSequence");
	}
	
	public Integer getRpeDeSeSequence() { //레시피상세 내의 순서 시퀀스
		return this.getSqlSession().selectOne("getRpeDeSeSequence");
	}
	
	public Integer getRpeDeSequence() { //레시피상세 시퀀스
		return this.getSqlSession().selectOne("getRpeDeSequence");
	}

	public List<RecipeHashVO> selectRecipeHash(int no) { //레시피 해시태그 
		return this.getSqlSession().selectList("selectRecipeHash",no);
	}
	public List<RecipeIngrVO> selectRecipeIngr(int no) { //레시피 재료
		return this.getSqlSession().selectList("selectRecipeIngr",no);
	}
	public List<RecipeDeVO> selectRecipeDe(int no) { //레시피 순서
		return this.getSqlSession().selectList("selectRecipeDe",no);
	}
	public List<RecipeIngrVO> selectRecipeIngrMain(int no) { //레시피 재료
		return this.getSqlSession().selectList("selectRecipeIngrMain",no);
	}
	public List<ItemVO> selectRecipeItem(HashMap<String, Object>map) { //레시피에서 상품 추천
		return this.getSqlSession().selectList("selectRecipeItem",map);
	}
	
	//레시피 조회수 업데이트
	public void updateRecipeHit(int no) { 
		this.getSqlSession().update("updateRecipeHit",no);
	}
	
	public Integer recipeCount() { //레시피 수
		return this.getSqlSession().selectOne("getTotalRecipe");
	}

	//레시피 리스트
	public List<RecipeVO> selectRecipeList(HashMap<String, Object> map) { 
		return this.getSqlSession().selectList("selectRecipeList", map);
	}

	public RecipeVO selectInfoRecipe(int no) { //레시피 상세 
		return this.getSqlSession().selectOne("selectInfoRecipe", no);
	}
	
	public void rpeInsert(RecipeVO vo,int no) { //레시피 입력
		this.getSqlSession().insert("recipeInsert", vo);
	}
	
	public void rpeIngrInsert(RecipeIngrVO vo) { //레시피 재료 입력 
		this.getSqlSession().insert("recipeIngrInsert", vo);
	}
	
	public void rpeDeInsert(RecipeDeVO vo) { //레시피 과정 입력
		this.getSqlSession().insert("rpeDeInsert", vo);
	}
	
	public void deleteRecipe(int no) { //레시피 삭제 
		this.getSqlSession().delete("recipeDelete", no);
	}
	
	
	// 좋아요한 레시피 유무 체크
	public Integer selectLikeList(HashMap<String, Object> map) { 
		return this.getSqlSession().selectOne("selectLikeList", map);
	}
	
	// 좋아요한 레시피 추가
	public void insertUserLikeList(HashMap<String, Object> map) { 
		this.getSqlSession().insert("insertUserLikeList", map);
	}
	
	// 좋아요한 레시피 삭제
	public void deleteUserLikeList(HashMap<String, Object> map) {
		this.getSqlSession().delete("deleteUserLikeList",map);
	}
	
	// 레시피 좋아요 수 업데이트
	public void updateRecipeLike(HashMap<String, Object> map) { 
		this.getSqlSession().update("updateRecipeLike",map);
	}
	
	
	public void rpeModify(RecipeVO vo,int rpeno) {
		this.getSqlSession().update("rpeModify", vo);
	}

	public void rpeIngrModify(RecipeIngrVO vo,int ingrno) {
		this.getSqlSession().update("rpeIngrModify", vo);
	}
	
	public void rpeDeModify(RecipeDeVO vo,int deno) {
		this.getSqlSession().update("rpeDeModify", vo);
	}
	
	// 댓글 개수
	public int countRecipeReply(int rpe_no) {
		return this.getSqlSession().selectOne("countRecipeReply",rpe_no);
	}	
	
	// 댓글 리스트
	public List<RecipeComVO> selectRecipeReply(int rpe_no){
		return this.getSqlSession().selectList("selectRecipeReply",rpe_no);
	}
	
	// 댓글 순서
	public Integer getComRefSeq() {
		return this.getSqlSession().selectOne("getComRefSeq");
	}
	
	// 댓글 작성 
	public void inserRecipeReply(RecipeComVO vo){
		this.getSqlSession().insert("inserRecipeReply",vo);
	}
	
	// 댓글 삭제 
	public void deleteRecipeReply(int rpe_no) {
		this.getSqlSession().delete("deleteRecipeReply",rpe_no);
	}
	
	public List<RecipeVO> selectMypageList(int userNo) {
			return this.getSqlSession().selectList("MypageList", userNo);
	}
	
}