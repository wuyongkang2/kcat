package model;

public class Homework {
	private int id;
	private int cid;
	private String category;
	private String title;
	private String images;
	private String link;
	private String pw;
	private String jpg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getJpg() {
		return jpg;
	}
	public void setJpg(String jpg) {
		this.jpg = jpg;
	}
	@Override
	public String toString() {
		return "Homework [id=" + id + ", cid=" + cid + ", category=" + category + ", title=" + title + ", images="
				+ images + ", link=" + link + ", pw=" + pw + ", jpg=" + jpg + "]";
	}
	
	
	

}
