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

@Controller
@RequestMapping("/yoplle/*")
public class NoticeController {

	@Inject
	NoticeService noticeservice;
	
	@RequestMapping("list.do")//관리자
	public ModelAndView list() throws Exception{
		List<NoticeVO>list=noticeservice.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yoplle/notice_list");
		mav.addObject("list",list);
		return mav;
	}
	
	
	@RequestMapping("list2.do")//유저
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
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int NOTI_NO)throws Exception{
		noticeservice.delete(NOTI_NO);
		return"redirect:list.do";
	}
}
