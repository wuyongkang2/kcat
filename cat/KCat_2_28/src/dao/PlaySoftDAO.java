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
 * ��ȡ���б�����Ϣ	
 */
	public ArrayList<PlaySoft_title> getPlaySoft_title(){
		return playSoftMapper.getPlaySoft_title();
	}
/**
 * ����tid����id��ȡ�ð����Ϣ
 */
	public ArrayList<PlaySoft> getPlaySoft(int tid){
		System.out.println("������PlaySoft��DAO����");
		return playSoftMapper.getPlaySoft(tid);
	}
/**
 * ����id��ȡ�����ȫ����Ϣ
 */
	public ArrayList<PlaySoft> getPlaySoft_All(int id){
		System.out.println("������PlaySoft_All��DAO����");
		return playSoftMapper.getPlaySoft_All(id);
	}	
	
/**
 * ��Ӷ�����Ϣ�����ݿ�	
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
}
