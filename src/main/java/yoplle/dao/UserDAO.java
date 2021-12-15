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

	public UserInfoVO findId(UserInfoVO vo) {
		System.out.println("==> Mybatis로 findId() 기능 처리");
		return mybatis.selectOne("yoplle.findId", vo);
	}

	public UserInfoVO findPassword(UserInfoVO vo) {
		System.out.println("==> Mybatis로 findPassword() 기능 처리");
		return mybatis.selectOne("yoplle.findPassword", vo);
	}

	public void updatePassword(UserInfoVO vo) {
		System.out.println("==> Mybatis로 updatePassword() 기능 처리");
		mybatis.update("yoplle.updatePassword", vo);
	}
//	public List<ItemVO> selectmainlist() {
//		return this.getSqlSession().selectList("selectMainList");
//	}

	//추가
	public void userModify(UserInfoVO vo, int no) {
			this.getSqlSession().update("userModify", vo);
	}
	
	public List<UserInfoVO> selectUser(HashMap<String, Object> map){ //회원 리스트 출력
		return this.getSqlSession().selectList("selectUser",map);
	}
	
	public void deleteUser(int no){ //회원 삭제
		this.getSqlSession().delete("deleteUser", no);
	}
	public int countUser() { //회원수 카운트
		return this.getSqlSession().selectOne("countUser");
	}

}