package yoplle.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import yoplle.vo.NoticeVO;

public interface NoticeService {

	public void create(NoticeVO vo)throws Exception;
	
	public NoticeVO read(int bno)throws Exception;
	
	public void update(NoticeVO vo)throws Exception;
	
	public void delete(int bno)throws Exception;
	
	public List<NoticeVO> listAll()throws Exception;
	
	public void increaseViewcnt(int bno, HttpSession session)throws Exception;
	
	
}
