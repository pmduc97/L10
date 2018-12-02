package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import Bean.NguoiDungBean;

public class NguoiDungDao {
	public ArrayList<NguoiDungBean> getAllThanhVien() throws Exception{
		ArrayList<NguoiDungBean> ds = new ArrayList<NguoiDungBean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "select * from NGUOIDUNG where Quyen = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setInt(1, 1);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			String UserName = r.getString("UserName");
			String PassWord = r.getString("PassWord");
			String HoTen = r.getString("HoTen");
			Date NgaySinh = r.getDate("NgaySinh");
			String SDT = r.getString("SDT");
			String Email = r.getString("Email");
			String DiaChi = r.getString("DiaChi");
			boolean GioiTinh = r.getBoolean("GioiTinh");
			int Quyen = r.getInt("Quyen");
			String CMT = r.getString("CMT");
			ds.add(new NguoiDungBean(UserName, PassWord, HoTen, NgaySinh, SDT, Email, DiaChi, GioiTinh, Quyen, CMT));
		}
		r.close();
		dc.cn.close();
		return ds;
	}
	
	public NguoiDungBean get1ThanhVien(String UserName1) throws Exception{
		NguoiDungBean nguoidung;
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "select * from NGUOIDUNG where UserName = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, UserName1);
		ResultSet r = stm.executeQuery();
		if(r.next()) {
			String UserName = r.getString("UserName");
			String PassWord = r.getString("PassWord");
			String HoTen = r.getString("HoTen");
			Date NgaySinh = r.getDate("NgaySinh");
			String SDT = r.getString("SDT");
			String Email = r.getString("Email");
			String DiaChi = r.getString("DiaChi");
			boolean GioiTinh = r.getBoolean("GioiTinh");
			int Quyen = r.getInt("Quyen");
			String CMT = r.getString("CMT");
			nguoidung = new NguoiDungBean(UserName, PassWord, HoTen, NgaySinh, SDT, Email, DiaChi, GioiTinh, Quyen, CMT);
		}
		else {
			nguoidung = null;
		}
		r.close();
		dc.cn.close();
		return nguoidung;
	}
	
	public NguoiDungBean checkLogin(String user,String pass, int quyen) throws Exception{
		NguoiDungBean nguoidung;
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "select * from NGUOIDUNG where UserName = ?, PassWord = ?, Quyen = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, user);
		stm.setString(2, pass);
		stm.setInt(3, quyen);
		ResultSet r = stm.executeQuery();
		if(r.next()) {
			String UserName = r.getString("UserName");
			String PassWord = r.getString("PassWord");
			String HoTen = r.getString("HoTen");
			Date NgaySinh = r.getDate("NgaySinh");
			String SDT = r.getString("SDT");
			String Email = r.getString("Email");
			String DiaChi = r.getString("DiaChi");
			boolean GioiTinh = r.getBoolean("GioiTinh");
			int Quyen = r.getInt("Quyen");
			String CMT = r.getString("CMT");
			nguoidung = new NguoiDungBean(UserName, PassWord, HoTen, NgaySinh, SDT, Email, DiaChi, GioiTinh, Quyen, CMT);
		}
		else {
			nguoidung = null;
		}
		r.close();
		dc.cn.close();
		return nguoidung;
	}
}
