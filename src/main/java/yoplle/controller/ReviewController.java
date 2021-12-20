package yoplle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yoplle.dao.ReviewDAO;
import yoplle.vo.FaqListVO;


@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO dao;
	
	@ResponseBody
	@RequestMapping(value="/yoplle/shopFaq.do") 
	public List<FaqListVO> insertFaq(int no, String job, FaqListVO vo) {
	if(job.equals("newFaq")) {
		vo.setFaq_no(dao.getFaqSequence());
	}
		dao.insertFaq(vo);
		return dao.selectFaqList(no);
	}
	
}

