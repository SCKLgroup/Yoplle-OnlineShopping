package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CheckOrderUserVO {

	private int user_no;
	private String user_name;
	private int item_no;
	private String user_id;
	
}
