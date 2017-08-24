package dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import mapper.StudySoftMapper;
import model.PlaySoft;
import model.StudySoft;
import model.StudySoft_titleB;
import model.StudySoft_titleS;

@Component
public class StudySoftDAO {
	StudySoftMapper studySoftMapper;

	public StudySoftMapper getStudySoftMapper() {
		return studySoftMapper;
	}
	@Resource
	public void setStudySoftMapper(StudySoftMapper studySoftMapper) {
		this.studySoftMapper = studySoftMapper;
	}
/**
 * ��ȡ���еĴ����(ѧԺ)
 */
	public ArrayList<StudySoft_titleB> getStudySoftB(){
		return studySoftMapper.getStudySoftB();
	}
/**
 * ͨ�������id��ȡС����(רҵ)
 */
	public ArrayList<StudySoft_titleS> getStudySoftS(int tidB){
		return studySoftMapper.getStudySoftS(tidB);
	}
/**
 * ͨ��С����id��ȡרҵ�����Ϣ	
 */
	public ArrayList<StudySoft> getStudySoft(int tidS){
		return studySoftMapper.getStudySoft(tidS);
	}

/**
 * ����id��ȡ�����ȫ����Ϣ
 */
	public ArrayList<StudySoft> getStudySoft_All(int id){
		return studySoftMapper.getStudySoft_All(id);
	}
/**
 * ͨ��������ֲ��Ҹ��������Ϣ
 */
	public ArrayList<StudySoft> getStudySoft_id(String name){
		return studySoftMapper.getStudySoft_id(name);
	}

/**
 * ��ȡ���е��������
 */
	public  ArrayList<StudySoft> getAllSoftName(){
		return studySoftMapper.getAllSoftName();
	}
/**
 * ����������
 */	
	public void addSoftName(String softName){
		studySoftMapper.addSoftName(softName);
	}
	
/**
 * ���������ֵ����
 */		
	public ArrayList<StudySoft> getSoftName_id(String softName){
		System.out.println(softName);
		return studySoftMapper.getSoftName_id(softName);
	}
	
/**
 * ���רҵ���
 */
	public void addStudySoft(StudySoft studySoft){
		studySoftMapper.addStudySoft(studySoft);
	}
/**
 * ��ȡ���е������Ϣ
 */	
	public ArrayList<StudySoft> getAllSoft(){
		return studySoftMapper.getAllSoft();
	}
/**
 * ɾ�����
 */		
	public void deleteStudySoft(int id){
		studySoftMapper.deleteStudySoft(id);
	}
	
}
