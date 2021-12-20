package yoplle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RecipeIngrVO {
	private int INGR_NO; 
	private int rpe_no;
	private String INGR_NAME;
	private String INGR_MAIN_CHECK; 
	private String INGR_QUAN;
}
