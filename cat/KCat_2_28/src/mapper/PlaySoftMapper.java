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
}
