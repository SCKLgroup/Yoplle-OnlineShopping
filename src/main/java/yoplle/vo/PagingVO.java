package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingVO {
	private int page; //현재 페이지
	private int listSize; //한 페이지에 출력되는 글의 수
	private int blockSize; //한 페이지에 보이는 페이지 번호(블럭) 크기
	private int totalList; //총 게시글 수
	private int totalPage; //총 페이지 수 
	
	private int startList; //해당 페이지에 출력될 첫번째 게시글
	private int endList;   //해당 페이지에 출력될 마지막 게시글
	
	private int currentBlock; //현재 페이지 블럭
	private int startPage; //블럭에서 시작 페이지
	private int endPage;   //블럭에서 마지막 페이지
	
	public PagingVO(int page, int totalList) {
		this.page=page;
		this.listSize = 16; //한 페이지에 출력되는 게시글이 총 16개
		this.blockSize = 10; //페이지 블럭 크기가 10 (ex 1 2 3 4 5 6 7 8 9 10) 
		this.totalList=totalList;
		this.totalPage=totalList/listSize+(totalList%listSize==0?0:1);
		
		this.startList=(page-1)*listSize+1;
		this.endList=page*listSize;
		
		this.currentBlock=(page/blockSize)+(page%blockSize==0?0:1);
		this.startPage=(currentBlock-1)*blockSize+1;
		this.endPage=(currentBlock*blockSize)>totalPage?totalPage:currentBlock*blockSize;
	}
}
