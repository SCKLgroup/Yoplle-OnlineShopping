package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_pro_img;
	private String user_name;
	private String user_tel;
	private String user_mail;
	private String user_date;
	private String user_birth;
	private String user_gender;
	private String user_address;
	private String user_postcode;
}


	