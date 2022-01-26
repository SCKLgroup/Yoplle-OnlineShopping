package yoplle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yoplle.dao.RecipeDAO;
import yoplle.vo.PagingVO;
import yoplle.vo.RecipeComVO;
import yoplle.vo.RecipeDeVO;
import yoplle.vo.RecipeIngrVO;
import yoplle.vo.RecipeVO;

@Controller
public class RecipeController {
	@Autowired
	private RecipeDAO dao;

	// 레시피 리스트 출력
	@RequestMapping(value = "/yoplle/recipeList.do") 
	public String recipeList(Model model, @RequestParam(value = "sort", defaultValue = "lastest") String sort,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 페이징
		PagingVO vo = new PagingVO(page, dao.recipeCount());
		map.put("page", page);
		map.put("totalPage", vo.getTotalPage());
		map.put("start", vo.getStartList());
		map.put("end", vo.getEndList());
		map.put("startPage", vo.getStartPage());
		map.put("endPage", vo.getEndPage());
		
		map.put("sort", sort);
		
		// DB 검색 시 정렬 기준으로 사용
		sort = sort.equals("like") ? "rpe_like" : "rpe_date";
		map.put("dbsort", sort); 

		model.addAttribute("recipeList", dao.selectRecipeList(map));
		model.addAttribute("pageList", map);

		return "yoplle/recipe-grid";
	}
	
	// 레시피 상세 페이지
	@RequestMapping(value = "/yoplle/recipeInfo.do") 
	public String recipeInfoAction(int no, String job, Model model, HttpSession session) {
		model.addAttribute("recipeInfoList", dao.selectInfoRecipe(no));
		model.addAttribute("recipeHashList", dao.selectRecipeHash(no));
		model.addAttribute("recipeIngrList", dao.selectRecipeIngr(no));
		model.addAttribute("recipeDeList", dao.selectRecipeDe(no));
		
		dao.updateRecipeHit(no); //조회수 업데이트

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (!dao.selectRecipeIngrMain(no).isEmpty()) { //주재료가 존재할 경우
			map.put("searchItem", dao.selectRecipeIngrMain(no)); //상품에서 검색할 주재료 리스트
			model.addAttribute("recipeItemList", dao.selectRecipeItem(map)); //해당 레시피에 맞는 주재료 상품 리스트 검색 
		}
		map.put("rpeNo", no);

		if (session.getAttribute("no") != null) { //회원 아이디 세션이 존재할 경우 
			map.put("userNo", session.getAttribute("no"));
			model.addAttribute("likeCheck", dao.selectLikeList(map));
		}
		
		if (job.equals("recipeinfo")) {
			return "yoplle/recipe-detail";
		} else {
			return "yoplle/mainPage";
		}
	}

	// 레시피 좋아요 업데이트
	@RequestMapping(value = "recipeLike.do") 
	@ResponseBody
	public HashMap<String, Object> updateRecipeLike(int userno, int rpeno) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int check = 0; 

		map.put("userNo", userno);
		map.put("rpeNo", rpeno);
		Integer likeList = dao.selectLikeList(map);

		if (likeList == null) {
			dao.insertUserLikeList(map);
		} else { //기존에 좋아요를 한 레시피일 경우
			check = 1;
			dao.deleteUserLikeList(map);
		}
		
		map.put("check", check);
		dao.updateRecipeLike(map);

		map.put("recipeInfo", dao.selectInfoRecipe(rpeno));
		return map;
	}

	@PostMapping(value = "recipeInsert.do")
	public String boardInsertAction(String id, Model model, RecipeIngrVO rivo, RecipeDeVO dvo, RecipeVO rvo,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "files", required = false) List<MultipartFile> fileList,
			MultipartHttpServletRequest request, int userNo) { // httpservlet
		String location = "C:\\Users\\wjchu\\git\\yoplleProject\\src\\main\\webapp\\yoplle\\img\\recipe\\"; //저장될 로컬폴더 위치
		FileOutputStream fos = null;
		String fileName = file.getOriginalFilename(); // 업로드 된 파일의 고유 이름을 fileName에 저장

		if (fileName.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(fileName)); // 경로에 파일네임 붙이기
				fos.write(file.getBytes());
				rvo.setRpe_img(fileName); // RecipeVO에 set rpe_img

			} catch (Exception e) { 
				e.printStackTrace();
			} finally {
				try {
					if (fos != null)
						fos.close();
				} catch (Exception e2) {

				}
			}

		}

		String ingr[] = rivo.getINGR_NAME().split(","); // 재료, 수량은 배열형태로 들어오기때문에 ,구분자로 나누어 배열로 저장
		String quan[] = rivo.getINGR_QUAN().split(",");
		String rpe_de[] = dvo.getRPE_DE_CONTENT().split(","); // 요리순서도 같은 방식

		rvo.setRpe_no(dao.getRpeSequence()); // rpe테이블 시퀀스
		rvo.setUser_no(userNo); // rpe테이블 userno 세팅
		rivo.setINGR_NO(dao.getRpeIngrSequence());// rpe_ingr 테이블 시퀀스값을받아서 ingr테이블의 넘버값에 삽입
		dvo.setRPE_DE_NO(dao.getRpeDeSequence()); // rpe_de 테이블 시퀀스 삽입
		dao.rpeInsert(rvo, userNo);

		for (int i = 0; i < ingr.length; i++) {// 재료가 들어온 수 만큼 for문
			rivo.setINGR_NAME(ingr[i]); // i번째 재료값을 name에 set
			rivo.setINGR_QUAN(quan[i]); // i번째 수량값을 quan에 set

			dao.rpeIngrInsert(rivo); // i번째 재료와 수량에 set이 된 값을 재료테이블에 insert
		}

		fileList = request.getFiles("files"); // files에서 받아온 이미지 리스트
		ArrayList<String> list = new ArrayList<String>();
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			System.out.println("originFileName : " + originFileName);
			System.out.println(mf);
			list.add(originFileName);

			String safeFile = location + originFileName;
			try {
				mf.transferTo(new File(safeFile));// multipartFile을 자바의 파일 객체 File로 변환하기
			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}

		for (int i = 0; i < rpe_de.length; i++) { // 요리 순서 갯수만큼 for문
			dvo.setRPE_DE_CONTENT(rpe_de[i]); // 요리순서
			dvo.setRPE_DE_IMG(list.get(i)); // 요리 순서에 맞는 이미지 (null허용되어있는상태)
			dao.rpeDeInsert(dvo);
		}

		return "redirect:/yoplle/recipeList.do?page=1&sort=lastest";
	}

	@RequestMapping(value = "/yoplle/deleteRecipe.do")
	public String deleteRecipeAction(int no) {
		dao.deleteRecipe(no);
		return "redirect:/yoplle/recipeList.do";
	}

	@RequestMapping(value = "/yoplle/modifyRecipe.do", method = RequestMethod.GET)
	public String modifyRecipePage(RecipeVO vo, int no, Model model) {
		model.addAttribute("list", dao.selectInfoRecipe(no));
		model.addAttribute("listIngr", dao.selectRecipeIngr(no));
		model.addAttribute("listDe", dao.selectRecipeDe(no));
		System.out.println("수정페이지 가는것완료");
		return "/yoplle/recipeModify";
	}

	@RequestMapping(value = "modifyRecipeAction.do")
	public String modifyRecipeAction(String id, Model model, RecipeIngrVO rivo, RecipeDeVO dvo, RecipeVO rvo,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "files", required = false) List<MultipartFile> fileList,
			MultipartHttpServletRequest request, int rpeno, int[] ingrno, int[] deno) {

		String location = "C:\\Users\\wjchu\\git\\yoplleProject\\src\\main\\webapp\\yoplle\\img\\recipe\\";
		FileOutputStream fos = null;
		String fileName = file.getOriginalFilename();

		if (fileName.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(fileName));
				fos.write(file.getBytes());
				rvo.setRpe_img(fileName);

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (fos != null)
						fos.close();
				} catch (Exception e2) {

				}
			}

		}

		rvo.setRpe_no(rpeno);
		dao.rpeModify(rvo, rpeno);

		for (int i = 0; i < ingrno.length; i++) {
			System.out.println(ingrno[i]);
		}
		String ingr[] = rivo.getINGR_NAME().split(",");
		String quan[] = rivo.getINGR_QUAN().split(",");
		String de[] = dvo.getRPE_DE_CONTENT().split(",");

		for (int i = 0; i < ingr.length; i++) {
			System.out.println(ingr[i]);
			System.out.println(quan[i]);
			rivo.setINGR_NAME(ingr[i]);
			rivo.setINGR_QUAN(quan[i]);
			rivo.setINGR_NO(ingrno[i]);
			dao.rpeIngrModify(rivo, ingrno[i]);
		}
		
		System.out.println("de부분");
		
		for (int i = 0; i < deno.length; i++) {
			System.out.println(deno[i]);
		}

		for (int i = 0; i < de.length; i++) {
			System.out.println(de[i]);
			dvo.setRPE_DE_CONTENT(de[i]);
			dvo.setRPE_DE_NO(deno[i]);
			dao.rpeDeModify(dvo, deno[i]);
			
		}
//		fileList = request.getFiles("files");
//		ArrayList<String> list = new ArrayList<String>();
//		for (MultipartFile mf : fileList) {
//			String originFileName = mf.getOriginalFilename(); // 썝蹂 뙆 씪 紐
//			list.add(originFileName);
//
//			String safeFile = location + originFileName;
//			try {
//				mf.transferTo(new File(safeFile));
//			} catch (IllegalStateException e) {
//
//				e.printStackTrace();
//			} catch (IOException e) {
//
//				e.printStackTrace();
//			}
//
//		}

		return "redirect:/yoplle/recipeList.do?page=1&sort=lastest";
	}

	// 댓글 리스트 출력 
	@RequestMapping(value = "recipeReplyList.do")
	@ResponseBody
	public HashMap<String, Object> recipeReplyList(int rpe_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", dao.countRecipeReply(rpe_no));
		map.put("replyList", dao.selectRecipeReply(rpe_no));
		return map;
	}
	
	// 댓글 작성
	@RequestMapping(value = "recipeReply.do")
	@ResponseBody
	public HashMap<String, Object> inserRecipeReply(RecipeComVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		dao.inserRecipeReply(vo); //작성한 댓글 정보 DB에 저장
		map.put("count", dao.countRecipeReply(vo.getRpe_no())); //댓글 개수
		map.put("replyList", dao.selectRecipeReply(vo.getRpe_no())); //댓글 리스트 출럭

		return map;
	}

	// 댓글 삭제 
	@RequestMapping(value = "deleteRecipeReply.do")
	@ResponseBody
	public HashMap<String, Object> deleteRecipeReply(int rpe_no, int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		dao.deleteRecipeReply(no); //댓글 삭제 
		map.put("count", dao.countRecipeReply(rpe_no)); //댓글 개수
		map.put("replyList", dao.selectRecipeReply(rpe_no)); //댓글 리스트 출력
		
		return map;
	}
}
