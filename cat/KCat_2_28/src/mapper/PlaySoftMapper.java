package mapper;

import java.util.ArrayList;

import model.PlaySoft;
import model.PlaySoft_title;

public interface PlaySoftMapper {
	public ArrayList<PlaySoft_title> getPlaySoft_title();    //��ȡ���еı�����Ϣ
	public ArrayList<PlaySoft> getPlaySoft(int tid);   //ͨ��tidѰ�Ҹð����������
	public ArrayList<PlaySoft> getPlaySoft_All(int id);   //ͨ��idѰ�Ҹ������������Ϣ
	public void uploadPlay(PlaySoft playSoft);    //ͨ��������Ϣ��ӵ����ݿ�
	public ArrayList<PlaySoft> getAllPlaySoft();
	public ArrayList<PlaySoft> checkPlaySoftName(String softName);
	public void addPlaySoft(PlaySoft playSoft);
	public void updatePlaySoft(PlaySoft playSoft);
	public void deletePlaySoft(int id);
	public void addPlaysoft_Type(String titleName);
	public void delPlaysoft_Type(int id);
	public void updatePlaysoft_Type(String titleName,int id);
	public ArrayList<PlaySoft_title> getPlaysoft_Type();
	public ArrayList<PlaySoft> getPlaysoft_Type_soft(int soft_to_title);
	
	
	
}
