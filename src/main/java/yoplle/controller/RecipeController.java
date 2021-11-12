package yoplle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import yoplle.vo.UserLikeVO;


@Controller
public class RecipeController {
	@Autowired
	private RecipeDAO dao;


	@RequestMapping(value="/yoplle/recipeList.do")// 레시피 리스트
	public String recipeList(Model model, @RequestParam(value="sort",defaultValue="lastest") String sort, @RequestParam(value="page",defaultValue="1")int page) {
		PagingVO vo = new PagingVO(page,dao.recipeCount());

		HashMap<String, Object> map =new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("totalPage", vo.getTotalPage());
		map.put("start", vo.getStartList());
		map.put("end", vo.getEndList());
		map.put("startPage", vo.getStartPage());
		map.put("endPage", vo.getEndPage());
		map.put("sort",	sort);
		
		sort = sort.equals("like") ? "rpe_like" : "rpe_date";
		map.put("dbsort",sort);
		
		model.addAttribute("recipeList", dao.selectRecipeList(map));
		model.addAttribute("pageList", map);
		
		return "yoplle/recipe-grid";
	}
	
	@RequestMapping(value = "/yoplle/recipeInfo.do") //레시피 상세
	public String recipeInfoAction(int no, String job, Model model,HttpSession session) {
		model.addAttribute("recipeInfoList", dao.selectInfoRecipe(no));
		model.addAttribute("recipeHashList",dao.selectRecipeHash(no));
		model.addAttribute("recipeIngrList",dao.selectRecipeIngr(no));
		model.addAttribute("recipeDeList",dao.selectRecipeDe(no));
		dao.updateRecipeHit(no);
		
		HashMap<String, Object> map =new HashMap<String, Object>();
		if(!dao.selectRecipeIngrMain(no).isEmpty()) {
			map.put("searchItem",dao.selectRecipeIngrMain(no));
			model.addAttribute("recipeItemList", dao.selectRecipeItem(map));
		}
		map.put("rpeNo", no);
		
		if(session.getAttribute("no")!=null) {
			map.put("userNo", session.getAttribute("no"));
			model.addAttribute("likeCheck", dao.selectLikeList(map));
		}
		
		if(job.equals("recipeinfo")) {
			return "yoplle/recipe-detail"; 
		} else {
			return "yoplle/mainPage";
		}
	}
	
	@RequestMapping(value="recipeLike.do") //레시피 좋아요 업데이트
	@ResponseBody
	public HashMap<String, Object> updateRecipeLike(int userno, int rpeno) {
		HashMap<String, Object>map=new HashMap<String, Object>();
		int action=0;

		map.put("userNo", userno);
		map.put("rpeNo", rpeno);
		Integer likeList=dao.selectLikeList(map);
		
		if(likeList==null) { 
			dao.insertUserLikeList(map);
		}else{
			action+=1;
			dao.deleteUserLikeList(map);
		}
		map.put("action", action);
		dao.updateRecipeLike(map);
		
		map.put("recipeInfo", dao.selectInfoRecipe(rpeno));
		return map;
	}

	@RequestMapping(value = "recipeInsert.do")
	public String boardInsertAction(String id, Model model, RecipeIngrVO rivo, RecipeDeVO dvo, RecipeVO rvo,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "files", required = false) List<MultipartFile> fileList,
			MultipartHttpServletRequest request, int userNo) { // httpservlet
		String location = "/Users/m/eclipse-spring/springWeb/src/main/webapp/yoplle/img/recipe/";
		FileOutputStream fos = null;
		String fileName = file.getOriginalFilename();

		if (fileName.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(fileName)); // 경로에 파일네임 붙이기
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

		String ingr[] = rivo.getINGR_NAME().split(",");
		String quan[] = rivo.getINGR_QUAN().split(",");

		String rpe_de[] = dvo.getRPE_DE_CONTENT().split(",");

		System.out.println("배열확인");

		rvo.setRpe_no(dao.getRpeSequence()); // rpe테이블 시퀀스
		rvo.setUser_no(userNo); // rpe테이블 userno 세팅
		rivo.setINGR_NO(dao.getRpeIngrSequence());// rpe_ingr 테이블 시퀀스값을받아서 ingr테이블의 넘버값에 삽입
		dvo.setRPE_DE_NO(dao.getRpeDeSequence()); // rpe_de 테이블 시퀀스 삽입

		System.out.println("2번째");
		dao.rpeInsert(rvo, userNo);

		for (int i = 0; i < ingr.length; i++) {
			System.out.println(ingr[i]);
			System.out.println(quan[i]);
			rivo.setINGR_NAME(ingr[i]);
			rivo.setINGR_QUAN(quan[i]);

			dao.rpeIngrInsert(rivo);

		}

		fileList = request.getFiles("files");
		ArrayList<String> list = new ArrayList<String>();
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			System.out.println("originFileName : " + originFileName);
			System.out.println(mf);
			list.add(originFileName);

			String safeFile = location + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
			
				e.printStackTrace();
			} catch (IOException e) {
	
				e.printStackTrace();
			}

		}
		
		for (int i = 0; i < rpe_de.length; i++) {
			dvo.setRPE_DE_CONTENT(rpe_de[i]);
			dvo.setRPE_DE_IMG(list.get(i));
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
	         MultipartHttpServletRequest request, int rpeno, int[] ingrno) {

	      String location = "C:\\dev\\se_workspace\\springLesson1\\web\\src\\main\\webapp\\upload\\";
	      FileOutputStream fos = null;
	      String fileName = file.getOriginalFilename();

	      if (fileName.length() > 0) {
	         try {
	            fos = new FileOutputStream(location.concat(fileName)); // 寃쎈줈 뿉  뙆 씪 꽕 엫 遺숈씠湲 
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

	      for (int i = 0; i < ingr.length; i++) {
	         System.out.println(ingr[i]);
	         System.out.println(quan[i]);
	         rivo.setINGR_NAME(ingr[i]);
	         rivo.setINGR_QUAN(quan[i]);
	         rivo.setINGR_NO(ingrno[i]);
	         dao.rpeIngrModify(rivo, ingrno[i]);
	      }

	      fileList = request.getFiles("files");
	      ArrayList<String> list = new ArrayList<String>();
	      for (MultipartFile mf : fileList) {
	         String originFileName = mf.getOriginalFilename(); //  썝蹂   뙆 씪 紐 
	         list.add(originFileName);

	         String safeFile = location + originFileName;
	         try {
	            mf.transferTo(new File(safeFile));
	         } catch (IllegalStateException e) {

	            e.printStackTrace();
	         } catch (IOException e) {

	            e.printStackTrace();
	         }

	      }

	      return "redirect:/yoplle/recipeList.do?page=1&sort=lastest";
	   }
	   
	   @RequestMapping(value="recipeReply.do")
	   @ResponseBody
		public HashMap<String, Object> inserRecipeReply(RecipeComVO vo) {
		   HashMap<String, Object>map=new HashMap<String, Object>();
		   if(vo.getCom_job().equals("new")) {
				vo.setCom_pnum(0);
				vo.setCom_lev(0);
				vo.setCom_step(0);
				vo.setCom_ref(dao.getComRefSeq());
			}
			dao.inserRecipeReply(vo);
			map.put("count", dao.countRecipeReply(vo.getRpe_no()));
			map.put("replyList", dao.selectRecipeReply(vo.getRpe_no()));
			
			return map;
		}
	   
	   @RequestMapping(value="recipeReplyList.do")
	   @ResponseBody
		public  HashMap<String, Object> recipeReplyList(int rpe_no) {
		   HashMap<String, Object>map=new HashMap<String, Object>();
		   	map.put("count", dao.countRecipeReply(rpe_no));
		   	map.put("replyList", dao.selectRecipeReply(rpe_no));
			return map;
		}

	   @RequestMapping(value="deleteRecipeReply.do")
	   @ResponseBody
		public HashMap<String, Object> deleteRecipeReply(int rpe_no,int no) {
		   HashMap<String, Object>map=new HashMap<String, Object>();

		   dao.deleteRecipeReply(no);
		   	map.put("count", dao.countRecipeReply(rpe_no));
		   	map.put("replyList", dao.selectRecipeReply(rpe_no));
			return map;
		}
}

