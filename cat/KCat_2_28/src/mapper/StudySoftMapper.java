package mapper;

import java.util.ArrayList;
import model.StudySoft;
import model.StudySoft_titleB;
import model.StudySoft_titleS;

public interface StudySoftMapper {
	public ArrayList<StudySoft_titleB> getStudySoftB();
	public ArrayList<StudySoft_titleS> getStudySoftS(int tidB);
	public ArrayList<StudySoft> getStudySoft(int tidS);
	public ArrayList<StudySoft> getStudySoft_All(int id);   //通过id寻找该软件的所有信息
	public ArrayList<StudySoft> getStudySoft_id(String name);   //通过软件名字查找该软件的信息
	public ArrayList<StudySoft> getAllSoftName(); //获得所有软件的名字
	public void addSoftName(StudySoft studySoft); //添加软件的名字
	public void addStudySoft(StudySoft studySoft); //添加专业软件
	public ArrayList<StudySoft> getSoftName_id(String softName); //获得软件名字对应的序号
	public ArrayList<StudySoft> getAllSoft(); //获取所有的软件信息
	public void deleteStudySoft(int id); //删除软件
	public ArrayList<StudySoft> checkSoftName(String softName); //检查软件名字
	public void deleteStudySoftAllot(int id); //删除软件分配
	public void updateStudySoft(StudySoft studySoft); //修改软件信息
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
