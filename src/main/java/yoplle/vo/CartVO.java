package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartVO {

	private int cart_no;
	private int user_no;
	private int item_no;
	private int cart_quan;
	private int item_price;
	private String item_name;
	private String item_img;
	
}
