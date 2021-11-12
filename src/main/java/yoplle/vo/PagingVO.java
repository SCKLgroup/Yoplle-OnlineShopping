package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class PagingVO {
	private int page;
	private int listSize; 
	private int blockSize;
	private int totalList;
	private int totalPage;
	
	private int startList;
	private int endList;
	
	private int currentBlock;
	private int startPage;
	private int endPage;
	
	public PagingVO(int page, int totalList) {
		this.page=page;
		this.listSize = 16;
		this.blockSize = 10;
		this.totalList=totalList;
		this.totalPage=totalList/listSize+(totalList%listSize==0?0:1);
		this.startList=(page-1)*listSize+1;
		this.endList=page*listSize;
		
		this.currentBlock=(page/blockSize)+(page%blockSize==0?0:1);
		this.startPage=(currentBlock-1)*blockSize+1;
		this.endPage=(currentBlock*blockSize)>totalPage?totalPage:currentBlock*blockSize;
	}
	
}
