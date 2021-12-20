package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLikeVO {
	private int like_no;
	private int user_no;
	private int rpe_no;
}
