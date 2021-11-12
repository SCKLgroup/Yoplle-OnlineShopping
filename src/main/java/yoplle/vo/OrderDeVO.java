package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDeVO {
	
	private int or_de_no;
	private int order_no;
	private int item_no;
	private int or_de_price;
	private int or_de_quan; // 수량
	private String or_de_back; // 환불 여부
	
}
