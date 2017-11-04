package dao;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;

import mapper.BangMapper;
import model.Bang;
import model.BangTitle;
import model.Bang;
import model.Bang;


@Component
public class BangDAO {
	BangMapper bangMapper;

	public BangMapper getBangMapper() {
		return bangMapper;
	}
	@Resource
	public void setBangMapper(BangMapper bangMapper) {
		this.bangMapper = bangMapper;
	}
	//根据id获取该模块内容
	public ArrayList<Bang> getBang(int tid) throws IOException{
		return bangMapper.getBang(tid);
	}
	//获取标题内容
	public ArrayList<BangTitle> getTitle(){
		return bangMapper.getTitle();
	}
	
	public ArrayList<Bang> getAllBang(){
		return bangMapper.getAllBang();
		
	}
	
	public void addBang(Bang bang){
		bangMapper.addBang(bang);
	}
	
	public void deleteBang(int id){
		bangMapper.deleteBang(id);
	}
	
	public void updateBang(Bang bang){
		bangMapper.updateBang(bang);
	}
	
	public ArrayList<Bang> getBang_Type(){
		return bangMapper.getBang_Type();
	}
	
	public void addBang_Type(String titleName){
		bangMapper.addBang_Type(titleName);
	}
	
	public void delBang_Type(int id){
		bangMapper.delBang_Type(id);
	}
	
	public void updateBang_Type(String titleName,int id){
		bangMapper.updateBang_Type(titleName, id);
	}
	
	public ArrayList<Bang> getBang_Type_title(int videoType){
		return bangMapper.getBang_Type_title(videoType);
	}
	
	public ArrayList<Bang> getBang_b(){
		return bangMapper.getBang_b();
	}
	public void updateBang_b(String jpg,int id){
		bangMapper.updateBang_b(jpg, id);
	}
}
