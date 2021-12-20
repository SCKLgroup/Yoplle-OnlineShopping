package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ItemVO {
	private int item_no; //��ǰ��ȣ
	private int emp_no; //������ ��ȣ (�ַ�1)
	private String item_name; //��ǰ����
	private String item_category; //��ǰī�װ�
	private String item_de_content;
	private String item_img;
	private int item_price;
	private String item_origin;
	private String item_ea;
	private int item_stock;
	private String item_date;
	private int rank;
	private String item_ca_de;
}
