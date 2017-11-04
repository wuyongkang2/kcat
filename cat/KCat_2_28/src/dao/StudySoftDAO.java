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
	public void addSoftName(StudySoft studySoft){
		studySoftMapper.addSoftName(studySoft);
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
/**
 * ����������
 */			
	public ArrayList<StudySoft> checkSoftName(String softName){
		return studySoftMapper.checkSoftName(softName);
	}
	
	public void deleteStudySoftAllot(int id){
		studySoftMapper.deleteStudySoftAllot(id);
	}
	
/**
 * �޸������Ϣ
 */			
	public void updateStudySoft(StudySoft studySoft){
		studySoftMapper.updateStudySoft(studySoft);
	}
	
	public ArrayList<StudySoft_titleB> getCollege(){
		return studySoftMapper.getCollege();
		
	}
	public ArrayList<StudySoft_titleS> getMajor_college(int titleS_to_titleB){
		return studySoftMapper.getMajor_college(titleS_to_titleB);
	}
	public ArrayList<StudySoft_titleS> getMajor(){
		return studySoftMapper.getMajor();
		
	}
	public ArrayList<StudySoft> getAllot_major(int soft_to_titleS){
		return studySoftMapper.getAllot_major(soft_to_titleS);
	}
	public ArrayList<StudySoft> getAllot_name(String softName){
		return studySoftMapper.getAllot_name(softName);
	}
	public ArrayList<StudySoft> getType(){
		return studySoftMapper.getType();
		
	}
	public ArrayList<StudySoft> getSoft_Type(int cid){
		return studySoftMapper.getSoft_Type(cid);
	}
	
	public void addCollege(String titleBName){
		studySoftMapper.addCollege(titleBName);
	}
	public void delCollege(int id){
		studySoftMapper.delCollege(id);
	}
	public void addMajor(String titleSName,int titleS_to_titleB){
		studySoftMapper.addMajor(titleSName, titleS_to_titleB);
	}
	public void delMajor(int id){
		studySoftMapper.delMajor(id);
	}
	public void addType(String softType){
		studySoftMapper.addType(softType);
	}
	public void delType(int id){
		studySoftMapper.delType(id);
	}
	public void updateCollege(String titleBName,int id){
		studySoftMapper.updateCollege(titleBName, id);
	}
	public void updateMajor(String titleSName,int id){
		studySoftMapper.updateMajor(titleSName, id);
	}
	public void updateType(String softType,int id){
		studySoftMapper.updateType(softType, id);
	}
	public ArrayList<StudySoft> getStudySoft_b(){
		return studySoftMapper.getStudySoft_b();
	}
	public void updateStudySoft_b(String ico,String jpg,int id){
		studySoftMapper.updateStudySoft_b(ico, jpg, id);
	}
}
