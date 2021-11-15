package yoplle.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import yoplle.vo.NoticeVO;

public interface NoticeService {
	
	//게시글 작성
	public void create(NoticeVO vo)throws Exception;
	//게시글 상세보기	
	public NoticeVO read(int bno)throws Exception;
	//게시글 수정
	public void update(NoticeVO vo)throws Exception;
	//게시글 삭제
	public void delete(int bno)throws Exception;
	//게시글 전체 목록
	public List<NoticeVO> listAll()throws Exception;
	//게시글 조회
	public void increaseViewcnt(int bno, HttpSession session)throws Exception;
	
	
}
