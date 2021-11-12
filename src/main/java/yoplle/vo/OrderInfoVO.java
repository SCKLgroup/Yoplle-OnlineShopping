package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfoVO {
	private int order_no;
	private int user_no;
	private String order_rec_name;
	private String order_rec_tel;
	private String order_date;
	private String order_dv_sts;
	private String order_dv_addr;
	private String order_dv_zipcode;

}
