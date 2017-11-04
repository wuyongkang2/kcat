package dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import mapper.HomeworkMapper;
import model.Homework;

@Component
public class HomeworkDAO {
	HomeworkMapper homeworkMapper;

	public HomeworkMapper getHomeworkMapper() {
		return homeworkMapper;
	}
	
	@Resource
	public void setHomeworkMapper(HomeworkMapper homeworkMapper) {
		this.homeworkMapper = homeworkMapper;
	}
	
	//获取分类的个数
	public int getCid(){
		int cid_count = homeworkMapper.getCid();
		return cid_count;
	}
	
	//获取整个内容信息
	public ArrayList<Homework> getHomework(int cid){
		return homeworkMapper.getHomework(cid);
	}
	
	//获取指定分类的所有内容信息
	public ArrayList<Homework> getHomework_All(int cid){
		ArrayList<Homework> list=homeworkMapper.getHomework_All(cid);
		return list;
	}
	
	public ArrayList<Homework> getAllHomework(){
		return homeworkMapper.getAllHomework();
		
	}
	
	public void addHomework(Homework homework){
		homeworkMapper.addHomework(homework);
	}
	
	public void deleteHomework(int id){
		homeworkMapper.deleteHomework(id);
	}
	
	public void updateHomework(Homework homework){
		homeworkMapper.updateHomework(homework);
	}
	
	public ArrayList<Homework> getHomework_Type(){
		return homeworkMapper.getHomework_Type();
	}
	
	public void addHomework_Type(String category){
		homeworkMapper.addHomework_Type(category);
	}
	
	public void delHomework_Type(int id){
		homeworkMapper.delHomework_Type(id);
	}
	
	public void updateHomework_Type(String category,int id){
		homeworkMapper.updateHomework_Type(category, id);
	}
	
	public ArrayList<Homework> getHomework_Type_title(int cid){
		return homeworkMapper.getHomework_Type_title(cid);
	}
	
	public ArrayList<Homework> getHomework_b(){
		return homeworkMapper.getHomework_b();
	}
	public void updateHomework_b(String jpg,int id){
		homeworkMapper.updateHomework_b(jpg, id);
	}
}
