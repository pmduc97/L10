package Bo;

import java.util.ArrayList;
import java.util.Date;

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
	
	public int themThanhVien(String hoten,Date ngaysinh, String cmt,String sodienthoai,String email,String diachi,boolean gioitinh,String user,String pass) throws Exception{
		return nd.themThanhVien(hoten, ngaysinh, cmt, sodienthoai, email, diachi, gioitinh, user, pass);
	}
	
	public int xoaThanhVien(String user) throws Exception{
		return nd.xoaThanhVien(user);
	}
	
	public int suaThanhVien(String hoten,Date ngaysinh, String cmt,String sodienthoai,String email,String diachi,boolean gioitinh,String user) throws Exception{
		return nd.suaThanhVien(hoten, ngaysinh, cmt, sodienthoai, email, diachi, gioitinh, user);
	}
	
	public int doiMatKhau(String taikhoan,String matkhaumoi) throws Exception{
		return nd.doiMatKhau(taikhoan, matkhaumoi);
	}
}
