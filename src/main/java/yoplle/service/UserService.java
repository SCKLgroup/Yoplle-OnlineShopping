package yoplle.service;

import java.util.List;


import yoplle.vo.UserInfoVO;

public interface UserService {

//	UserInfoVO loginUser(UserInfoVO vo);
	
	UserInfoVO findId(UserInfoVO vo);
	
	UserInfoVO findPassword(UserInfoVO vo);
	
	void updatePassword(UserInfoVO vo);

}