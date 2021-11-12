package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDeCartVO {
	
	private int or_de_no;
	private int order_no;
	private int[] item_noV;
	private int[] or_de_priceV;
	private int[] or_de_quanV; // 수량
	private int item_no;
	private int or_de_price;
	private int or_de_quan;
	private String or_de_back; // 환불 여부
	
}
