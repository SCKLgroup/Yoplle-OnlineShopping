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

public class FaqAnswerVO {
	private int faq_no;
	private int emp_no;
	private String ans_content;
	private String ans_date;

}
