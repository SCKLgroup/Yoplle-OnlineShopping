package yoplle.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import yoplle.vo.UserInfoVO;

@Repository
@ComponentScan(value = "yoplle.dao")
public class UserDAO extends SqlSessionDaoSupport {

	@Resource(name = "sqlSessionTemplate")
	@Inject
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public int idTonumber(String id) { 
		return this.getSqlSession().selectOne("userNo", id);
	}
	
	public boolean signIn(String id, String password) { //로그인 체크
		String dbPass = this.getSqlSession().selectOne("signIn", id);
		return dbPass != null && dbPass.equals(password);
	}

	public int idCheck(String id) { //아이디 중복 체크
		return this.getSqlSession().selectOne("idCheck",id);
	}
	
	public void insertUser(UserInfoVO vo) { //회원 정보 추가
		this.getSqlSession().insert("insertUser",vo);
	}
	
	public UserInfoVO userInfoSelect(String id) {
		return this.getSqlSession().selectOne("userInfoSelect", id);
	}
	
	
	//////////////////////////
	@Autowired
	private SqlSessionTemplate mybatis;

	//findId() mapper호출
	public UserInfoVO findId(UserInfoVO vo) {
		return mybatis.selectOne("yoplle.findId", vo);
	}

	//findPassword() mapper호출
	public UserInfoVO findPassword(UserInfoVO vo) {
		return mybatis.selectOne("yoplle.findPassword", vo);
	}

	//updatePassword() mapper호출
	public void updatePassword(UserInfoVO vo) {
		mybatis.update("yoplle.updatePassword", vo);
	}
//	public List<ItemVO> selectmainlist() {
//		return this.getSqlSession().selectList("selectMainList");
//	}

	//추가
	public void userModify(UserInfoVO vo, int no) {
			this.getSqlSession().update("userModify", vo);
	}
	
	// 회원 리스트 출력
	public List<UserInfoVO> selectUser(HashMap<String, Object> map){ 
		return this.getSqlSession().selectList("selectUser",map);
	}
	// 회원수 카운트
	public int countUser() { 
		return this.getSqlSession().selectOne("countUser");
	}
	
	// 회원 삭제
	public void deleteUser(int no){
		this.getSqlSession().delete("deleteUser", no);
	}

}