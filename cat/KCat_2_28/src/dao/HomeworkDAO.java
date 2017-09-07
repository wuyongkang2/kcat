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
	
	//��ȡ����ĸ���
	public int getCid(){
		int cid_count = homeworkMapper.getCid();
		return cid_count;
	}
	
	//��ȡ����������Ϣ
	public ArrayList<Homework> getHomework(int cid_count){
		return homeworkMapper.getHomework(cid_count);
	}
	
	//��ȡָ�����������������Ϣ
	public ArrayList<Homework> getHomework_All(int cid){
		ArrayList<Homework> list=homeworkMapper.getHomework_All(cid);
		return list;
	}
	
	public ArrayList<Homework> getAllHomework(){
		return homeworkMapper.getAllHomework();
		
	}
}
