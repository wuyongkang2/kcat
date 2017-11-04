package mapper;

import java.util.ArrayList;

import model.PlaySoft;
import model.PlaySoft_title;

public interface PlaySoftMapper {
	public ArrayList<PlaySoft_title> getPlaySoft_title();    //获取所有的标题信息
	public ArrayList<PlaySoft> getPlaySoft(int tid);   //通过tid寻找该板块所有内容
	public ArrayList<PlaySoft> getPlaySoft_All(int id);   //通过id寻找该软件的所有信息
	public void uploadPlay(PlaySoft playSoft);    //通过对象将信息添加到数据库
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
