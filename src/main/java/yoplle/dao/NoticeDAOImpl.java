package yoplle.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yoplle.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	SqlSession SqlSession;

	@Override
	public void create(NoticeVO vo) throws Exception {
		SqlSession.insert("insert",vo);
	}

	@Override
	public NoticeVO read(int bno) throws Exception {
		return SqlSession.selectOne("view",bno);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		SqlSession.update("updateArticle",vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		SqlSession.delete("deleteArticle",bno);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		return SqlSession.selectList("listAll");
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		SqlSession.update("increaseViewcnt",bno);
	}
	
	
}
