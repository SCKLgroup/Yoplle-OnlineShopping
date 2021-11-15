package yoplle.vo;

import java.util.Date;

public class NoticeVO {
	public int NOTI_NO;				//게시글 번호
	public int EMP_NO;				//관리자 번호
	public String NOTI_TITLE;		//게시글 제목
	public String NOTI_CONTENT;		//게시글 내용
	public String NOTI_IMG;			//게시글 이미지
	public int NOTI_HIT;			//게시글 조회수
	public Date  NOTI_DATE;			//게시글 작성일자 util.Date

	public NoticeVO() {
		super();
	}
	public NoticeVO(int NOTI_NO, int EMP_NO, String NOTI_TITLE, String NOTI_CONTENT, String NOTI_IMG, int NOTI_HIT,
			Date NOTI_DATE) {
		super();
		this.NOTI_NO = NOTI_NO;
		this.EMP_NO = EMP_NO;
		this.NOTI_TITLE = NOTI_TITLE;
		this.NOTI_CONTENT = NOTI_CONTENT;
		this.NOTI_IMG = NOTI_IMG;
		this.NOTI_HIT = NOTI_HIT;
		this.NOTI_DATE = NOTI_DATE;
	}
	public int getNOTI_NO() {
		return NOTI_NO;
	}
	public void setNOTI_NO(int NOTI_NO) {
		this.NOTI_NO = NOTI_NO;
	}
	public int getEMP_NO() {
		return EMP_NO;
	}
	public void setEMP_NO(int EMP_NO) {
		this.EMP_NO = EMP_NO;
	}
	public String getNOTI_TITLE() {
		return NOTI_TITLE;
	}
	public void setNOTI_TITLE(String NOTI_TITLE) {
		this.NOTI_TITLE = NOTI_TITLE;
	}
	public String getNOTI_CONTENT() {
		return NOTI_CONTENT;
	}
	public void setNOTI_CONTENT(String NOTI_CONTENT) {
		this.NOTI_CONTENT = NOTI_CONTENT;
	}
	public String getNOTI_IMG() {
		return NOTI_IMG;
	}
	public void setNOTI_IMG(String NOTI_IMG) {
		this.NOTI_IMG = NOTI_IMG;
	}
	public int getNOTI_HIT() {
		return NOTI_HIT;
	}
	public void setNOTI_HIT(int NOTI_HIT) {
		this.NOTI_HIT = NOTI_HIT;
	}
	public Date getNOTI_DATE() {
		return NOTI_DATE;
	}
	public void setNOTI_DATE(Date NOTI_DATE) {
		this.NOTI_DATE = NOTI_DATE;
	}
	@Override
	public String toString() {
		return "NoticeVO [NOTI_NO=" + NOTI_NO + ", EMP_NO=" + EMP_NO + ", NOTI_TITLE=" + NOTI_TITLE + ", NOTI_CONTENT="
				+ NOTI_CONTENT + ", NOTI_IMG=" + NOTI_IMG + ", NOTI_HIT=" + NOTI_HIT + ", NOTI_DATE=" + NOTI_DATE + "]";
	}
	
	
	
	
}
