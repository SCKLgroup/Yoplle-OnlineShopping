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

	@PostMapping(value = "/yoplle/login.do") // login.jsp에서 id,password 값을 받아옴
	public String logCheck(HttpSession session, String id, String password, String recipe, String cart, String itemno) {
		boolean state = dao.signIn(id, password);

		if (state) {
			session.setAttribute("id", id);
			String userNo = String.valueOf(dao.idTonumber(id)); // id에 맞는 userNo값을 저장.
			session.setAttribute("no", userNo); // 후에 userno를 사용해야하니 세션화
			session.setMaxInactiveInterval(6000); // 6000초 세션
		}

		if (state == true) {
			if (recipe != null) { //레시피작성할때 필요한 로그인일시
				return "redirect:recipeMake.jsp";
			} else if (cart != null) { //카트에서 장바구니에 담을때 필요한 로그인일시
				return "redirect:shopInfo.do?no=" + itemno + "&job=iteminfo";
			}
			return "redirect:mainPage.do";
		} else {
			session.setAttribute("error", "ID 혹은 PASSWORD가 맞지 않습니다. 다시 입력해주세요."); //비밀번호나 아이디가 틀렸을때 에러문구 반환
			session.setMaxInactiveInterval(1);
			return "redirect:login.jsp";
		}
	}

	@RequestMapping(value = "/yoplle/logout.do") //로그아웃
	public String logout(HttpSession session) {
		session.invalidate(); //세션 소멸
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

	@RequestMapping(value = "/yoplle/signup.do") // 회원 가입
	public String userInsertAction(UserInfoVO vo) {
		dao.insertUser(vo); // 회원 정보 추가
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

	@RequestMapping(value = "/yoplle/recipelogin.do") //레시피작성 시 필요한 로그인 요청이 들어왔을때.
	public String recipelogin(HttpServletRequest request, HttpSession session) {
		session.setAttribute("recipe", "recipemake"); //레시피로그인이라는 걸 알려주기 위한 반환값
		session.setMaxInactiveInterval(2);
		return "redirect:login.jsp";

	}

	@RequestMapping(value = "/yoplle/cartlogin.do", method = RequestMethod.POST) //카트 장바구니 담을때 필요한 로그인요청
	public String cartlogin(HttpServletRequest request, HttpSession session,int itemno) {
		
		session.setAttribute("itemno", itemno); //상품의 고유번호를 세션화 해서 넘겨줌
		session.setAttribute("cart", "cart"); //카트에서 로그인했음을 알려주는 반환값
		session.setMaxInactiveInterval(20);
		return "redirect:login.jsp";

	}

	@RequestMapping(value = "/yoplle/mypage.do") //마이페이지
	public String mypageAction(Model model, String id) {
		model.addAttribute("userinfo", dao.userInfoSelect(id)); //아이디와 일치하는 유저의 정보를 가져옴
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

	// 회원 리스트 출력(관리자 페이지)
	@RequestMapping(value = "userList.do")
	@ResponseBody
	public HashMap<String, Object> selectUser(@RequestParam(value = "job", defaultValue = "user_no") String job,
			@RequestParam(value = "sort", defaultValue = "desc") String sort) { 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("job", job); // 정렬 기준 설정
		map.put("sort", sort);

		map.put("countUser", dao.countUser()); // 유저 수 카운트
		map.put("userList", dao.selectUser(map)); // 정렬 기준에 따른 회원 리스트 출력

		return map;
	}

	// 회원 삭제(관리자 페이지)
	@RequestMapping(value = "userDelete.do")
	@ResponseBody
	public HashMap<String, Object> deleteUser(int no, String job, String sort) { 
		dao.deleteUser(no); // 해당 유저 삭제

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("job", job); // 정렬 기준 설정
		map.put("sort", sort);

		map.put("countUser", dao.countUser()); // 유저 수 카운트
		map.put("userList", dao.selectUser(map)); // 정렬 기준에 따른 회원 리스트 출력

		return map; // 회원 삭제 후 다시 회원 리스트 출력
	}

	@RequestMapping(value = "/yoplle/mypagelist.do") //마이페이지에서 레시피 리스트
	public String mypagelistAction(String id, int userNo, Model model) {

		model.addAttribute("recipe", rdao.selectMypageList(userNo));

		return "/yoplle/personal-mylist";
	}

	@RequestMapping(value = "/yoplle/myrecipe.do") //마이페이지 레시피에서 각 링크별로 이동하는 루트
	public String myrecipeAction(int rpe_no) {
		return "redirect:/yoplle/recipeInfo.do?no=" + rpe_no + "&job=recipeinfo";
	}

}
