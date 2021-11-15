package yoplle.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import yoplle.dao.RecipeDAO;
import yoplle.dao.UserDAO;
import yoplle.service.UserService;
import yoplle.vo.UserInfoVO;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private UserService userService;
	@Autowired
	private RecipeDAO rdao;

	@PostMapping(value = "/yoplle/login.do")
	public String logCheck(HttpSession session, String id, String password, String recipe, String cart, String itemno) {
		boolean state = dao.signIn(id, password);

		if (state) {
			session.setAttribute("id", id);
			String userNo = String.valueOf(dao.idTonumber(id));
			session.setAttribute("no", userNo);
			session.setMaxInactiveInterval(6000);
		}

		if (state == true) {
			if (recipe != null) {
				return "redirect:recipeMake.jsp";
			} else if (cart != null) {
				return "redirect:shopInfo.do?no=" + itemno + "&job=iteminfo";
			}
			return "redirect:mainPage.do";
		} else {
			session.setAttribute("error", "ID 혹은 PASSWORD가 맞지 않습니다. 다시 입력해주세요.");
			session.setMaxInactiveInterval(1);
			return "redirect:login.jsp";
		}
	}

	@RequestMapping(value = "/yoplle/logout.do") // 濡쒓렇�븘�썐
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:mainPage.do";
	}

	@RequestMapping(value = "idCheck.do") // 아이디 중복체크
	@ResponseBody
	public String userIdCheckAction(String user_id) {
		int dbid = dao.idCheck(user_id);
		if (dbid != 0) {
			return "1";
		}
		return "0";
	}

	@RequestMapping(value = "/yoplle/signup.do") //회원 가입
	public String userInsertAction(UserInfoVO vo) {
		dao.insertUser(vo); //회원 정보 추가
		return "yoplle/signup-success";
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////
	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "/yoplle/find_id_form.do")
	public String findIdView() {
		return "yoplle/idFind";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "/yoplle/find_id.do", method = RequestMethod.POST)
	public String findIdAction(UserInfoVO vo, Model model) {
		UserInfoVO user = userService.findId(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("fid", user.getUser_id());
		}

		return "yoplle/idFind";
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "yoplle/find_password_form.do")
	public String findPasswordView() {
		return "yoplle/passFind";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "/yoplle/find_password.do", method = RequestMethod.POST)
	public String findPasswordAction(UserInfoVO vo, Model model) {
		UserInfoVO user = userService.findPassword(vo);
		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getUser_id());
		}

		return "yoplle/passFind";
	}

	// 비밀번호 바꾸기 실행
	@RequestMapping(value = "/yoplle/update_password.do", method = RequestMethod.POST)
	public String updatePasswordAction(@RequestParam(value = "updateid", defaultValue = "", required = false) String id,
			UserInfoVO vo) {
		vo.setUser_id(id);
		System.out.println(vo);
		userService.updatePassword(vo);
		return "yoplle/passFind_success";
	}

	@RequestMapping(value = "/yoplle/adminPage.do")
	public String adminPageAction(String id, String no) {

		return "yoplle/admin-user-management";
	}

	@RequestMapping(value = "/yoplle/recipelogin.do")
	public String recipelogin(HttpServletRequest request, HttpSession session) {
		session.setAttribute("recipe", "recipemake");
		session.setMaxInactiveInterval(2);
		return "redirect:login.jsp";

	}

	@RequestMapping(value = "/yoplle/cartlogin.do", method = RequestMethod.POST)
	public String cartlogin(HttpServletRequest request, HttpSession session) {
		String no = request.getParameter("itemno");
		session.setAttribute("itemno", request.getParameter("itemno"));
		session.setAttribute("cart", "cart");
		session.setMaxInactiveInterval(20);
		return "redirect:login.jsp";

	}

	@RequestMapping(value = "/yoplle/mypage.do")
	public String mypageAction(Model model, String id) {
		model.addAttribute("userinfo", dao.userInfoSelect(id));
		return "/yoplle/personal-inform";
	}

	@RequestMapping(value = "/yoplle/mypageModify.do", method = RequestMethod.POST)
	public String mypageModifyAction(UserInfoVO vo, HttpServletRequest request, Model model) {
		// model.addAttribute("user_id", request.getParameter("user_id"));
		int no = Integer.parseInt(request.getParameter("userNo"));

		vo.setUser_no(no);
		dao.userModify(vo, no);

		return "redirect:/yoplle/mainPage.do";
	}

	@RequestMapping(value = "userList.do") 
	@ResponseBody
	public HashMap<String, Object> selectUser(@RequestParam(value = "job", defaultValue = "user_no") String job,
			@RequestParam(value = "sort", defaultValue = "asc") String sort) { //회원 리스트 출력(관리자 페이지)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("job", job); //정렬 기준 설정
		map.put("sort", sort); 

		map.put("countUser", dao.countUser()); //유저 수 카운트 
		map.put("userList", dao.selectUser(map)); //정렬 기준에 따른 회원 리스트 출력 

		return map;
	}

	@RequestMapping(value = "userDelete.do")
	@ResponseBody
	public HashMap<String, Object> deleteUser(int no, String job, String sort) { //회원 삭제(관리자 페이지)
		dao.deleteUser(no); //해당 유저 삭제

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("job", job); //정렬 기준 설정
		map.put("sort", sort);

		map.put("countUser", dao.countUser()); //유저 수 카운트 
		map.put("userList", dao.selectUser(map)); //정렬 기준에 따른 회원 리스트 출력 

		return map; //회원 삭제 후 다시 회원 리스트 출력 
	}

	@RequestMapping(value = "/yoplle/mypagelist.do")
	public String mypagelistAction(String id, int userNo, Model model) {
		System.out.println("마이페이지 리스트 두 실행");
		System.out.println(userNo);
		model.addAttribute("recipe", rdao.selectMypageList(userNo));

		return "/yoplle/personal-mylist";
	}

	@RequestMapping(value = "/yoplle/myrecipe.do")
	public String myrecipeAction(int rpe_no) {
		return "redirect:/yoplle/recipeInfo.do?no=" + rpe_no + "&job=recipeinfo";
	}

}
