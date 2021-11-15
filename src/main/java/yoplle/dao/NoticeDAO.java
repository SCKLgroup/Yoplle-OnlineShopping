package yoplle.dao;

import java.util.List;

import yoplle.vo.NoticeVO;

public interface NoticeDAO {
<<<<<<< HEAD
	//게시글 작성
	public void create(NoticeVO vo)throws Exception;
	//게시글 상세보기	
	public NoticeVO read(int bno) throws Exception;
	//게시글 수정
	public void update(NoticeVO vo) throws Exception;
	//게시글 삭제
	public void delete(int bno) throws Exception;
	//게시글 전체 목록
	public List<NoticeVO> listAll() throws Exception;
	//게시글 조회수 증가
=======

	public void create(NoticeVO vo)throws Exception;
	
	public NoticeVO read(int bno) throws Exception;
	
	public void update(NoticeVO vo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public List<NoticeVO> listAll() throws Exception;
	
>>>>>>> branch 'master' of https://github.com/lmrae0624/yoplleProject.git
	public void increaseViewcnt(int bno) throws Exception;
	
	
}
