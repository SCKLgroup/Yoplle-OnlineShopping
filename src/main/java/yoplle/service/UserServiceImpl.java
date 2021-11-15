package yoplle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yoplle.dao.UserDAO;
import yoplle.vo.UserInfoVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;

/*	@Override
	public UserVO loginUser(UserVO vo) {
		return userDAO.loginUser(vo);
	}*/
	@Override
	public UserInfoVO findId(UserInfoVO vo) {
		return dao.findId(vo);
		}

	@Override
	public UserInfoVO findPassword(UserInfoVO vo) {
		return dao.findPassword(vo);
	}

	@Override
	public void updatePassword(UserInfoVO vo) {
		dao.updatePassword(vo);
	}
	
	
}
