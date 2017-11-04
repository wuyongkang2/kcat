package mapper;

import java.util.ArrayList;

import model.Bang;
import model.BangTitle;
import model.Bang;
import model.Bang;

public interface BangMapper {
	public ArrayList<BangTitle> getTitle();
	public ArrayList<Bang> getBang(int tid);
	public ArrayList<Bang> getAllBang();
	public void addBang(Bang bang);
	public void deleteBang(int id);
	public void updateBang(Bang bang);
	public ArrayList<Bang> getBang_Type();
	public void addBang_Type(String titleName);
	public void delBang_Type(int id);
	public void updateBang_Type(String titleName,int id);
	public ArrayList<Bang> getBang_Type_title(int videoType);
	public ArrayList<Bang> getBang_b();
	public void updateBang_b(String jpg,int id);
}
