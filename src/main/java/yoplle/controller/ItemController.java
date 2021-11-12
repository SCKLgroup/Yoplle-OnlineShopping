package yoplle.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import yoplle.dao.ItemDAO;
import yoplle.dao.ReviewDAO;
import yoplle.vo.FaqAnswerVO;
import yoplle.vo.FaqListVO;
import yoplle.vo.ItemVO;
import yoplle.vo.PagingVO;
import yoplle.vo.ReviewVO;
import yoplle.vo.ShopDeRecipeVO;


@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemdao;
	@Autowired
	private ReviewDAO reviewdao;

	//상품--------------------------------
		@RequestMapping(value="/yoplle/itemList.do") //상품 리스트
		public String itemList(Model model, String sort, int page,String category) {
			switch (category) {
			case "meat":
				category="육류계란"; break;
			case "vegetable":
				category="채소"; break;
			case "fruit":
				category="과일"; break;
			case "frozen":
				category="냉동식품"; break;
			case "sauce":
				category="소스"; break;
			}
			PagingVO vo = new PagingVO(page,itemdao.itemCount(category));
			
			HashMap<String, Object> map =new HashMap<String, Object>();
			
			map.put("page", page);
			map.put("totalPage", vo.getTotalPage());
			map.put("start", vo.getStartList());
			map.put("end", vo.getEndList());
			map.put("startPage", vo.getStartPage());
			map.put("endPage", vo.getEndPage());
			map.put("sort",	sort);
			map.put("category",	category);
			
			if(sort.equals("orderVolume")) {
				model.addAttribute("itemList", itemdao.selectItemVolume(map));
				model.addAttribute("pageList", map);
			}else {
				model.addAttribute("itemList", itemdao.selectItemList(map));
				model.addAttribute("pageList", map);
			}
			
			return "yoplle/shop-grid";
		}
	@RequestMapping(value = "/yoplle/shopInfo.do")
	public String shopInfoAction(int no, String job, Model model, FaqListVO vo, ReviewVO rvo, String id, ShopDeRecipeVO sdr) {
		model.addAttribute("faqList", reviewdao.selectFaqList(no));
		model.addAttribute("iteminfo", itemdao.selectInfoItem(no));
		model.addAttribute("reviewList", reviewdao.selectReviewList(no));
		model.addAttribute("recipeMatch", itemdao.selectShopDeRecipe(no));
		
		
		if (job.equals("iteminfo")) {
			return "yoplle/shop-details";
		} else if(job.equals("newFaq")) {
			vo.setFaq_no(reviewdao.getFaqSequence());
			reviewdao.insertFaq(vo);
			return "redirect:/yoplle/shopInfo.do?no="+no+"&job=iteminfo";
		} else if(job.equals("newreview")) {
			rvo.setReview_no(reviewdao.getReviewSequence());
			Map<String, Object>map=new HashMap();
			map.put("id", id);
			map.put("no", no);
			int checkV = reviewdao.checkOrderUser(map);
			if(checkV>0) {
				System.out.println(checkV);
				
				reviewdao.insertReview(rvo);
			}
			
			return "redirect:/yoplle/shopInfo.do?no="+no+"&job=iteminfo";
		}
		else {
			return "yoplle/mainPage";
		}
	}
	
	@RequestMapping(value="/yoplle/searchProduct.do") //상품 검색
	public String searchProductAction(@RequestParam String search, Model model) {
		model.addAttribute("searchItemList", itemdao.searchItemList(search));
		return "yoplle/search-grid";
	}
	

	@RequestMapping(value = "/yoplle/insertItem.do")
	public String insertItemAction(ItemVO vo, @RequestParam(value = "files", required = false) MultipartFile file,
			@RequestParam(value = "file", required = false) MultipartFile file2) {

		String location = "C:\\dev\\se_workspace\\springLesson1\\web\\src\\main\\webapp\\yoplle\\img\\item\\";
		FileOutputStream fos = null;
		String item_img = file.getOriginalFilename();
		String item_de_content = file2.getOriginalFilename();
		if (item_img.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(item_img)); // 경로에 파일네임 붙이기
				fos.write(file.getBytes());
				vo.setItem_img(item_img);

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

		if (item_de_content.length() > 0) {
			try {
				fos = new FileOutputStream(location.concat(item_de_content)); // 경로에 파일네임 붙이기
				fos.write(file.getBytes());
				vo.setItem_de_content(item_de_content);

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
		
		vo.setItem_no(itemdao.getItemSequence());// 시퀀스 지정
		itemdao.insertItem(vo);

		return "yoplle/mainPage";
	}

	@RequestMapping(value="deleteItem.do")
	@ResponseBody
	public Map<String, Object> deleteItemAction(String job, int no[]){
		HashMap<String, Object> jobs=new HashMap<String, Object>();
		jobs.put("job", job);
		HashMap<String, Object> nos=new HashMap<String, Object>();
		nos.put("no", no);
		itemdao.deleteItemAction(nos);
		
		Map<String, Object> map=new HashMap<String, Object>();
		if(!job.equals("default")) {
			map.put("item", itemdao.selectItemAdminCate(jobs));
			map.put("count", itemdao.countItemAction(jobs));
			return map;
		} else {
			map.put("item", itemdao.allSelectItem());
			map.put("count", itemdao.countItemAction(jobs));
			return map;
		}
		
	}
	
	@RequestMapping(value="adminList.do") // 관리자 페이지에서 상품 뿌리기
	@ResponseBody
	public Map<String, Object> itemListAction(String job) {
		System.out.println(job);
		HashMap<String, Object> jobs=new HashMap<String, Object>();
		jobs.put("job", job);
		Map<String, Object> map=new HashMap<String, Object>();
		if(!job.equals("default")) {
			map.put("item", itemdao.selectItemAdminCate(jobs));
			map.put("count", itemdao.countItemAction(jobs));
			return map;
		} else {
			map.put("item", itemdao.allSelectItem());
			map.put("count", itemdao.countItemAction(jobs));
			return map;
		}
	}



}

