package yoplle.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import yoplle.dao.NoticeDAO;
import yoplle.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	NoticeDAO noticeDao;

	//게시글 작성
	@Override
	public void create(NoticeVO vo) throws Exception {
		String NOTI_TITLE=vo.getNOTI_TITLE();
		String NOTI_CONTENT=vo.getNOTI_CONTENT();
		int EMP_NO=vo.getEMP_NO();
		
		vo.setNOTI_TITLE(NOTI_TITLE);
		vo.setNOTI_CONTENT(NOTI_CONTENT);
		vo.setEMP_NO(EMP_NO);
		noticeDao.create(vo);
	}

	//게시글 상세보기
	@Override
	public NoticeVO read(int bno) throws Exception {
		return noticeDao.read(bno);
	}

	//게시글 수정
	@Override
	public void update(NoticeVO vo) throws Exception {
		noticeDao.update(vo);
	}
	
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		noticeDao.delete(bno);
	}

	//게시글 전체 목록
	@Override
	public List<NoticeVO> listAll() throws Exception {
		return noticeDao.listAll();
	}

	//게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		//세션에 저장된 조회시간을 검색한다
		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행되지 않는다.
		if(session.getAttribute("update_time_"+bno)!=null) {
			//세션에서 읽어온다.
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		//시스템의 현재 시간을 current_time에 저장해준다.
		long current_time=System.currentTimeMillis();
		//일정시간이 경과 후에 조회수를 증가처리해준다. 24*60*60*1000(=24시간)
		//시스템현재 시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time-update_time>5*1000) {
			noticeDao.increaseViewcnt(bno);
			//세션에 시간을 저장 : "update_time_"+bno는 다른 변수와 중복되지 않게 명명한 것이다.
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
	
	
}
