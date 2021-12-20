package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartTakeVO {
	private int user_no;
	private String user_name;
	private String user_tel;
	private String user_mail;
	private int item_no;
	private int cart_quan;
	private String item_name;
	private String item_category;
	private int item_price;
}
