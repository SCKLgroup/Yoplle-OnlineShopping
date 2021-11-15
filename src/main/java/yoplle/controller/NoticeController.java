package yoplle.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yoplle.service.NoticeService;
import yoplle.vo.NoticeVO;

<<<<<<< HEAD
@Controller		// 현재 클래스를 컨트롤러 빈(bean)으로 등록한다.
@RequestMapping("/yoplle/*")
public class NoticeController {
	
	// 의존관계를 주입한다 -> NoticeserviceImpl생성
	// IOC 의존관계 역전(원래 개발자가 해왔던 일을 컨테이너라는 객체 관리 프로그램이 알아서 해줌)
	@Inject
	NoticeService noticeservice;
	
	//관리자 부분
	@RequestMapping("list.do")//게시글 목록
	public ModelAndView list() throws Exception{
		List<NoticeVO>list=noticeservice.listAll();
		//ModelAndView - 모델과 뷰 선언
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yoplle/admin-notice-management");//뷰를 list.jsp로 설정
		mav.addObject("list",list);//데이터를 저장
		return mav;//list.jsp로 List가 전달된다.
	}
	
	//사용자 부분
	@RequestMapping("list2.do")
	public ModelAndView list2() throws Exception{
		List<NoticeVO>list=noticeservice.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yoplle/notice");
		mav.addObject("list",list);
		return mav;
	}
	
	//관리자 부분
	//게시글 상세내용 조회,게시글의 조회수를 증가시킨다.
	//HttpSession 세션객체이다.
	@RequestMapping(value="yoplle/view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session)throws Exception{
		//조회수 증가 처리
		noticeservice.increaseViewcnt(bno,session);
		//모델(데이터)+뷰(화면)를 함께 전달하는 객체이다.
		ModelAndView mav=new ModelAndView();
		//뷰의 이름을 설정한다
		mav.setViewName("yoplle/notice_view");
		//뷰에 전달할 데이터이다.
		mav.addObject("dto",noticeservice.read(bno));
		return mav;
	}
	
	//사용자 부분
	@RequestMapping(value="yoplle/view2.do",method=RequestMethod.GET)
	public ModelAndView view2(@RequestParam int bno, HttpSession session)throws Exception{
		noticeservice.increaseViewcnt(bno,session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("yoplle/notice_view_user");
		mav.addObject("dto",noticeservice.read(bno));
		return mav;
	}

	//게시글 작성화면
	@RequestMapping(value="write.do", method=RequestMethod.GET)//method="전송방식"
	public String write() {
		return "/yoplle/notice_Write";//notice_Write.jsp로 이동
	}
	
	//게시글 작성처리
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute NoticeVO vo)throws Exception{
		noticeservice.create(vo);
		return "redirect:list.do";
	}
	
	//게시글 수정
	//폼에서 입력한 내용들은 @ModelAttribute NoticeVO vo로 전달된다.
	@RequestMapping(value="update.do",method=RequestMethod.POST)
	public String delete(@ModelAttribute NoticeVO vo)throws Exception{
		noticeservice.update(vo);
		return"redirect:list.do";
	}
	
	//게시글을 삭제해준다.
=======
@Controller
@RequestMapping("/yoplle/*")
public class NoticeController {

	@Inject
	NoticeService noticeservice;
	
	@RequestMapping("list.do")//������
	public ModelAndView list() throws Exception{
		List<NoticeVO>list=noticeservice.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yoplle/notice_list");
		mav.addObject("list",list);
		return mav;
	}
	
	
	@RequestMapping("list2.do")//����
	public ModelAndView list2() throws Exception{
		List<NoticeVO>list=noticeservice.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yoplle/notice");
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="yoplle/view2.do",method=RequestMethod.GET)
	public ModelAndView view2(@RequestParam int bno, HttpSession session)throws Exception{
		noticeservice.increaseViewcnt(bno,session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("yoplle/notice_view_user");
		mav.addObject("dto",noticeservice.read(bno));
		return mav;
	}
	
	@RequestMapping(value="yoplle/view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session)throws Exception{
		noticeservice.increaseViewcnt(bno,session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("yoplle/notice_view");
		mav.addObject("dto",noticeservice.read(bno));
		return mav;
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write() {
		return "/yoplle/notice_Write";
	}
	
	@RequestMapping(value="yoplle/insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute NoticeVO vo)throws Exception{
		noticeservice.create(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="update.do",method=RequestMethod.POST)
	public String delete(@ModelAttribute NoticeVO vo)throws Exception{
		noticeservice.update(vo);
		return"redirect:list.do";
	}
	
>>>>>>> branch 'master' of https://github.com/lmrae0624/yoplleProject.git
	@RequestMapping("delete.do")
	public String delete(@RequestParam int NOTI_NO)throws Exception{
		noticeservice.delete(NOTI_NO);
		return"redirect:list.do";
	}
}
