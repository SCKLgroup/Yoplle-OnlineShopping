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

	@Override
	public void create(NoticeVO vo) throws Exception {
		String NOTI_TITLE=vo.getNOTI_TITLE();
		String NOTI_CONTENT=vo.getNOTI_CONTENT();
		int EMP_NO=vo.getEMP_NO();
/*
		NOTI_TITLE=NOTI_TITLE.replace("<", "&lt;");
		NOTI_TITLE=NOTI_TITLE.replace(">", "&gt;");
		writer=writer.replace("<", "&lt;");
		writer=writer.replace(">", "&gt;");
		
		NOTI_TITLE=NOTI_TITLE.replace(" ", "&nbsp;nbsp;");
		writer=writer.replace(" ", "&nbsp;nbsp;");

		NOTI_CONTENT=NOTI_CONTENT.replace("\n", "<br>");*/
		vo.setNOTI_TITLE(NOTI_TITLE);
		vo.setNOTI_CONTENT(NOTI_CONTENT);
		vo.setEMP_NO(EMP_NO);
		noticeDao.create(vo);
	}

	@Override
	public NoticeVO read(int bno) throws Exception {
		return noticeDao.read(bno);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		noticeDao.update(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		noticeDao.delete(bno);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time=0;
		
		if(session.getAttribute("update_time_"+bno)!=null) {
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		
		if(current_time-update_time>5*1000) {
			noticeDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
	
	
}
