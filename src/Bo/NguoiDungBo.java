package Bo;

import java.util.ArrayList;

import Bean.NguoiDungBean;
import Dao.NguoiDungDao;

public class NguoiDungBo {
	NguoiDungDao nd = new NguoiDungDao();
	public ArrayList<NguoiDungBean> getAllThanhVien() throws Exception{
		return nd.getAllThanhVien();
	}
	
	public NguoiDungBean get1ThanhVien(String UserName1) throws Exception{
		return nd.get1ThanhVien(UserName1);
	}
	
	public NguoiDungBean checkLogin(String user,String pass, int quyen) throws Exception{
		return nd.checkLogin(user, pass, quyen);
	}
}
