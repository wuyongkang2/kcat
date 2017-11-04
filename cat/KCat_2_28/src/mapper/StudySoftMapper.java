package mapper;

import java.util.ArrayList;
import model.StudySoft;
import model.StudySoft_titleB;
import model.StudySoft_titleS;

public interface StudySoftMapper {
	public ArrayList<StudySoft_titleB> getStudySoftB();
	public ArrayList<StudySoft_titleS> getStudySoftS(int tidB);
	public ArrayList<StudySoft> getStudySoft(int tidS);
	public ArrayList<StudySoft> getStudySoft_All(int id);   //ͨ��idѰ�Ҹ������������Ϣ
	public ArrayList<StudySoft> getStudySoft_id(String name);   //ͨ��������ֲ��Ҹ��������Ϣ
	public ArrayList<StudySoft> getAllSoftName(); //����������������
	public void addSoftName(StudySoft studySoft); //������������
	public void addStudySoft(StudySoft studySoft); //���רҵ���
	public ArrayList<StudySoft> getSoftName_id(String softName); //���������ֶ�Ӧ�����
	public ArrayList<StudySoft> getAllSoft(); //��ȡ���е������Ϣ
	public void deleteStudySoft(int id); //ɾ�����
	public ArrayList<StudySoft> checkSoftName(String softName); //����������
	public void deleteStudySoftAllot(int id); //ɾ���������
	public void updateStudySoft(StudySoft studySoft); //�޸������Ϣ
	public ArrayList<StudySoft_titleB> getCollege();
	public ArrayList<StudySoft_titleS> getMajor_college(int titleS_to_titleB);
	public ArrayList<StudySoft_titleS> getMajor();
	public ArrayList<StudySoft> getAllot_major(int soft_to_titleS);
	public ArrayList<StudySoft> getAllot_name(String softName);
	public ArrayList<StudySoft> getType();
	public ArrayList<StudySoft> getSoft_Type(int cid);
	public void addCollege(String titleBName);
	public void delCollege(int id);
	public void addMajor(String titleSName,int titleS_to_titleB);
	public void delMajor(int id);
	public void addType(String softType);
	public void delType(int id);
	public void updateCollege(String titleBName,int id);
	public void updateMajor(String titleSName,int id);
	public void updateType(String softType,int id);
	public ArrayList<StudySoft> getStudySoft_b();
	public void updateStudySoft_b(String ico,String jpg,int id);
	
	
	
}
