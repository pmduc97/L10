package Bo;

import java.util.ArrayList;

import Bean.LoaiCayBean;
import Dao.LoaiCayDao;

public class LoaiCayBo {
	LoaiCayDao loai = new LoaiCayDao();
	
	public ArrayList<LoaiCayBean> getAll() throws Exception{
		return loai.getAll();
	}
	
	public int XoaLoai(String maloai) throws Exception{
		
		return loai.XoaLoai(maloai);
	}
	
	public int SuaLoai(String maloai,String tenloai) throws Exception{
		return loai.SuaLoai(maloai, tenloai);
	}
	
	public int themLoai(String maloai,String tenloai) throws Exception{
		return loai.themLoai(maloai, tenloai);
	}
}
