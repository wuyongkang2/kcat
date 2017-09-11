package mapper;

import java.util.ArrayList;

import model.Homework;

public interface HomeworkMapper {
	public int getCid();
	public ArrayList<Homework> getHomework(int cid);
	public ArrayList<Homework> getHomework_All(int cid);
	public ArrayList<Homework> getAllHomework();
	public void addHomework(Homework homework);
	public void deleteHomework(int id);
	public void updateHomework(Homework homework);
}
