package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeComVO {
	private int com_no;
	private int rpe_no;
	private int user_no;
	private String com_content;
	private int com_pnum;
	private int com_step;
	private int com_lev;
	private int com_ref;
	private int com_reply;
	private String com_job;
	private String com_date;
	private String user_id;
}

