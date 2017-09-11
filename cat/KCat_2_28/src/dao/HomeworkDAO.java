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
	public ArrayList<Homework> getHomework(int cid_count){
		return homeworkMapper.getHomework(cid_count);
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
}
