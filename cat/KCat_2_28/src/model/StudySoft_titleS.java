package model;

public class StudySoft_titleS {
	private int id;
	private String titleSName;
	private String titleBName;
	private int titleS_to_titleB;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitleSName() {
		return titleSName;
	}
	public void setTitleSName(String titleSName) {
		this.titleSName = titleSName;
	}
	public String getTitleBName() {
		return titleBName;
	}
	public void setTitleBName(String titleBName) {
		this.titleBName = titleBName;
	}
	public int getTitleS_to_titleB() {
		return titleS_to_titleB;
	}
	public void setTitleS_to_titleB(int titleS_to_titleB) {
		this.titleS_to_titleB = titleS_to_titleB;
	}
	@Override
	public String toString() {
		return "StudySoft_titleS [id=" + id + ", titleSName=" + titleSName + ", titleBName=" + titleBName
				+ ", titleS_to_titleB=" + titleS_to_titleB + "]";
	}
	  
	  
}
