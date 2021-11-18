package yoplle.service;

import yoplle.vo.UserInfoVO;

public interface UserService {

	//findId dao 호출
	UserInfoVO findId(UserInfoVO vo);
	
	//findPassword dao 호출
	UserInfoVO findPassword(UserInfoVO vo);
	
	//updatePassword dao 호출
	void updatePassword(UserInfoVO vo);

}