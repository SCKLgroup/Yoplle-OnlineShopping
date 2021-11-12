package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	private int review_no;
	private int or_de_no;
	private String review_title;
	private String review_content;
	private int review_hit;
	private String review_date;
	private int item_no;
	private String user_id;
	
}