package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopBestVO {
	private int item_no;
	private String item_name;
	private String item_category;
	private String item_img;
	private int item_price;
	private int item_ea;
	private String item_date;
}
