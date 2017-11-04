package mapper;

import java.util.ArrayList;

import model.Tel;
import model.Tel;

public interface TelMapper {
	public ArrayList<Tel> getTel();
	public ArrayList<Tel> getAllTel();
	public void addTel(Tel tel);
	public void deleteTel(int id);
	public void updateTel(Tel tel);
	public ArrayList<Tel> getTel_Type();
	public void addTel_Type(String category);
	public void delTel_Type(int id);
	public void updateTel_Type(String category,int id);
	public ArrayList<Tel> getTel_Type_title(int cid);
}
