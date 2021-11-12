package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FaqListVO {
	
	private int faq_no;
	private int item_no;
	private int user_no;
	private String user_id;
	private String faq_title;
	private String faq_content;
	private String faq_img;
	private String faq_pw;
	private String faq_date;
	private int emp_no;
	private String ans_content;
	private String ans_date;

}
