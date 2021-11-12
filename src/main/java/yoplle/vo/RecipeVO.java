package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RecipeVO {
	private int rpe_no;
	private int user_no;
	private String user_id;
	private String rpe_title; 
	private String rpe_content; 
	private String rpe_img;
	private String rpe_category; 
	private String rpe_time;
	private String rpe_quan;
	private String rpe_diff;
	private int rpe_like;
	private String rpe_date;
	private int rpe_hit;
	private String regdate;
}
