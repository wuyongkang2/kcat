package dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import mapper.PlaySoftMapper;
import model.PlaySoft;
import model.PlaySoft_title;

@Component
public class PlaySoftDAO {
	PlaySoftMapper playSoftMapper;

	public PlaySoftMapper getPlaySoftMapper() {
		return playSoftMapper;
	}
	@Resource
	public void setPlaySoftMapper(PlaySoftMapper playSoftMapper) {
		this.playSoftMapper = playSoftMapper;
	}
/**
 * 获取所有标题信息	
 */
	public ArrayList<PlaySoft_title> getPlaySoft_title(){
		return playSoftMapper.getPlaySoft_title();
	}
/**
 * 根据tid标题id获取该板块信息
 */
	public ArrayList<PlaySoft> getPlaySoft(int tid){
		System.out.println("进入了PlaySoft的DAO方法");
		return playSoftMapper.getPlaySoft(tid);
	}
/**
 * 根据id获取该软件全部信息
 */
	public ArrayList<PlaySoft> getPlaySoft_All(int id){
		System.out.println("进入了PlaySoft_All的DAO方法");
		return playSoftMapper.getPlaySoft_All(id);
	}	
	
/**
 * 添加对象信息到数据库	
 */
	public void uploadPlay(PlaySoft playSoft){
		playSoftMapper.uploadPlay(playSoft);
	}
	
	public ArrayList<PlaySoft> getAllPlaySoft(){
		return playSoftMapper.getAllPlaySoft();
	}
	
	public ArrayList<PlaySoft> checkPlaySoftName(String softName){
		return playSoftMapper.checkPlaySoftName(softName);
	}
	
	public void addPlaySoft(PlaySoft playSoft){
		playSoftMapper.addPlaySoft(playSoft);
	}
	
	public void updatePlaySoft(PlaySoft playSoft){
		playSoftMapper.updatePlaySoft(playSoft);
	}
	public void deletePlaySoft(int id){
		playSoftMapper.deletePlaySoft(id);
	}
	
	public void addPlaysoft_Type(String titleName){
		playSoftMapper.addPlaysoft_Type(titleName);
	}
	public void delPlaysoft_Type(int id){
		playSoftMapper.delPlaysoft_Type(id);
	}
	public void updatePlaysoft_Type(String titleName,int id){
		playSoftMapper.updatePlaysoft_Type(titleName, id);
	}
	public ArrayList<PlaySoft_title> getPlaysoft_Type(){
		return playSoftMapper.getPlaysoft_Type();
	}
	public ArrayList<PlaySoft> getPlaysoft_Type_soft(int soft_to_title){
		return playSoftMapper.getPlaysoft_Type_soft(soft_to_title);
	}
}
