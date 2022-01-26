
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

	// 상품 리스트 출력
		@RequestMapping(value="/yoplle/itemList.do") 
		public String itemList(Model model, String sort, int page,String category) {
			
			switch (category) { //카테고리별로 출력하기 위해 저장
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
			
			HashMap<String, Object> map =new HashMap<String, Object>();
			
			// 페이징
			PagingVO vo = new PagingVO(page,itemdao.itemCount(category));
			map.put("page", page);
			map.put("totalPage", vo.getTotalPage());
			map.put("start", vo.getStartList());
			map.put("end", vo.getEndList());
			map.put("startPage", vo.getStartPage());
			map.put("endPage", vo.getEndPage());
			
			map.put("sort",	sort); //정렬 기준
			map.put("category",	category); //상품 카테고리
			
			if(sort.equals("orderVolume")) { //판매량순
				model.addAttribute("itemList", itemdao.selectItemVolume(map));
				model.addAttribute("pageList", map);
			}else { //그외 정렬 기준
				model.addAttribute("itemList", itemdao.selectItemList(map));
				model.addAttribute("pageList", map);
			}
			
			return "yoplle/shop-grid";
		}
		
	@RequestMapping(value = "/yoplle/shopInfo.do") // 상품 페이지 출력
	public String shopInfoAction(int no, String job, Model model, FaqListVO vo, ReviewVO rvo, String id, ShopDeRecipeVO sdr) {
		model.addAttribute("faqList", reviewdao.selectFaqList(no)); // 아이템 넘버에 따라 해당 문의 출력
		model.addAttribute("iteminfo", itemdao.selectInfoItem(no)); // 아이템 넘버에 따라 해당 아이템 정보 출력
		model.addAttribute("reviewList", reviewdao.selectReviewList(no)); // 아이템 넘버에 따라 해당 리뷰 출력
		model.addAttribute("recipeMatch", itemdao.selectShopDeRecipe(no)); // 해당 아이템의 넘버로 레시피 테이블과 연계해 레시피 추천
		
		
		if (job.equals("iteminfo")) { // job에 따라 if문으로 기능을 나누어 줌
			return "yoplle/shop-details"; 
		} else if(job.equals("newFaq")) { // 문의 작성 버튼을 클릭하였을 때
			vo.setFaq_no(reviewdao.getFaqSequence()); // 새로 생성할 데이터의 번호를 중복되지 않게 하기 위하여 시퀀스 넘버를 받아 삽입
			reviewdao.insertFaq(vo); // JSP에서 받아 온 값을 테이블에 삽입
			return "redirect:/yoplle/shopInfo.do?no="+no+"&job=iteminfo";
		}
		else {
			return "yoplle/mainPage";
		}
	}
	
	// 상품 검색
	@RequestMapping(value="/yoplle/searchProduct.do") 
	public String searchProductAction(@RequestParam String search, Model model) {
		model.addAttribute("searchItemList", itemdao.searchItemList(search));
		return "yoplle/search-grid";
	}
	

	@RequestMapping(value = "/yoplle/insertItem.do") //상품 등록
	public String insertItemAction(ItemVO vo, @RequestParam(value = "thumbnail", required = false) MultipartFile file,
			@RequestParam(value = "detail", required = false) MultipartFile file2) {

		String location = "C:\\Users\\wjchu\\git\\yoplleProject\\src\\main\\webapp\\yoplle\\img\\item\\";
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

	// 관리자 페이지에서 상품을 삭제할 경우 삭제 후 ResponseBody로 값을 반환해 줌
	@RequestMapping(value="deleteItem.do")
	@ResponseBody
	public Map<String, Object> deleteItemAction(String job, @RequestParam(value="no[]")List<Integer> no){ // 아이템 넘버를 배열로 받아 연쇄 삭제함
		System.out.println(no);
		HashMap<String, Object> jobs=new HashMap<String, Object>();
		jobs.put("job", job);
		HashMap<String, Object> nos=new HashMap<String, Object>();
		nos.put("no", no);
		
		itemdao.deleteItemAction(nos); // 삭제할 아이템 넘버를 map으로 넘겨 in 구문으로 동시 삭제함
		
		Map<String, Object> map=new HashMap<String, Object>();
		if(!job.equals("default")) { // 디폴트가 아닐 경우에는 jobs으로 넘겨받은 카테고리 값으로 출력
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

