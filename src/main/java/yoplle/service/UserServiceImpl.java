package yoplle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yoplle.dao.UserDAO;
import yoplle.vo.UserInfoVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;

	//아이디 찾기
	@Override
	public UserInfoVO findId(UserInfoVO vo) {
		return dao.findId(vo);
		}

	//비밀번호 찾기
	@Override
	public UserInfoVO findPassword(UserInfoVO vo) {
		return dao.findPassword(vo);
	}

	//비밀번호 바꾸기
	@Override
	public void updatePassword(UserInfoVO vo) {
		dao.updatePassword(vo);
	}
	
	
}
