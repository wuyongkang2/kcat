package dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import mapper.TelMapper;
import model.Tel;
import model.Tel;
import model.Tel;

@Component
public class TelDAO {
	TelMapper telMapper;
	
	public TelMapper getTelMapper() {
		return telMapper;
	}

	@Resource
	public void setTelMapper(TelMapper telMapper) {
		this.telMapper = telMapper;
	}

	//获取整个内容信息
	public ArrayList<Tel> getTel(){
		return telMapper.getTel();
	}
	
	public ArrayList<Tel> getAllTel(){
		return telMapper.getAllTel();
		
	}
	
	public void addTel(Tel tel){
		telMapper.addTel(tel);
	}
	
	public void deleteTel(int id){
		telMapper.deleteTel(id);
	}
	
	public void updateTel(Tel tel){
		telMapper.updateTel(tel);
	}
	
	public ArrayList<Tel> getTel_Type(){
		return telMapper.getTel_Type();
	}
	
	public void addTel_Type(String category){
		telMapper.addTel_Type(category);
	}
	
	public void delTel_Type(int id){
		telMapper.delTel_Type(id);
	}
	
	public void updateTel_Type(String category,int id){
		telMapper.updateTel_Type(category, id);
	}
	
	public ArrayList<Tel> getTel_Type_title(int cid){
		return telMapper.getTel_Type_title(cid);
	}
}
