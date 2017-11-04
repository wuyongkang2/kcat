package mapper;

import java.util.ArrayList;

import model.Homework;
import model.StudySoft;

public interface HomeworkMapper {
	public int getCid();
	public ArrayList<Homework> getHomework(int cid);
	public ArrayList<Homework> getHomework_All(int cid);
	public ArrayList<Homework> getAllHomework();
	public void addHomework(Homework homework);
	public void deleteHomework(int id);
	public void updateHomework(Homework homework);
	public ArrayList<Homework> getHomework_Type();
	public void addHomework_Type(String category);
	public void delHomework_Type(int id);
	public void updateHomework_Type(String category,int id);
	public ArrayList<Homework> getHomework_Type_title(int cid);
	public ArrayList<Homework> getHomework_b();
	public void updateHomework_b(String jpg,int id);
	
	
}
