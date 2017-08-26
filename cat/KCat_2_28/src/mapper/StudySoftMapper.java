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
	public void deleteStudySoftAllot(int id);
	
}
