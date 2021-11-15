package yoplle.dao;

import java.util.List;

import yoplle.vo.NoticeVO;

public interface NoticeDAO {

	public void create(NoticeVO vo)throws Exception;
	
	public NoticeVO read(int bno) throws Exception;
	
	public void update(NoticeVO vo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public List<NoticeVO> listAll() throws Exception;
	
	public void increaseViewcnt(int bno) throws Exception;
	
	
}
