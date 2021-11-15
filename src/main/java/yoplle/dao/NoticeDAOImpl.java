package yoplle.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yoplle.vo.NoticeVO;

//현재 클래스를 dao bean으로 등록
@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	SqlSession SqlSession;

	//게시글 작성
	@Override
	public void create(NoticeVO vo) throws Exception {
		SqlSession.insert("insert",vo);
	}

	//게시글 상세보기
	@Override
	public NoticeVO read(int bno) throws Exception {
		return SqlSession.selectOne("view",bno);
	}

	//게시글 수정
	@Override
	public void update(NoticeVO vo) throws Exception {
		SqlSession.update("updateArticle",vo);
	}

	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		SqlSession.delete("deleteArticle",bno);
	}

	//게시글 전체 목록
	@Override
	public List<NoticeVO> listAll() throws Exception {
		return SqlSession.selectList("listAll");
	}

	//게시글 조회수 증가

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		SqlSession.update("increaseViewcnt",bno);
	}
	
	
}
