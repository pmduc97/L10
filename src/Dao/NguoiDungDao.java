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
		String sql = "select * from NGUOIDUNG where UserName = ? and PassWord = ? and Quyen = ?";
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

	public int themThanhVien(String hoten,Date ngaysinh, String cmt,String sodienthoai,String email,String diachi,boolean gioitinh,String user,String pass) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT INTO NGUOIDUNG(UserName,PassWord,HoTen,NgaySinh,SDT,Email,DiaChi,GioiTinh,Quyen,CMT) VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, user);
		stm.setString(2,pass );
		stm.setString(3,hoten );
		stm.setDate(4, new java.sql.Date(ngaysinh.getTime()));
		stm.setString(5, sodienthoai);
		stm.setString(6, email);
		stm.setString(7, diachi);
		stm.setBoolean(8, gioitinh);
		stm.setInt(9, 1);
		stm.setString(10, cmt);
		
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;

	}
	
	public int xoaThanhVien(String user) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE FROM NGUOIDUNG WHERE UserName = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, user);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
	
	public int suaThanhVien(String hoten,Date ngaysinh, String cmt,String sodienthoai,String email,String diachi,boolean gioitinh,String user) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE NGUOIDUNG SET HoTen = ?,NgaySinh = ?,SDT = ?,Email = ?,DiaChi = ?,GioiTinh = ?,CMT = ? WHERE UserName = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, hoten);
		stm.setDate(2, new java.sql.Date(ngaysinh.getTime()));
		stm.setString(3, sodienthoai);
		stm.setString(4, email);
		stm.setString(5, diachi);
		stm.setBoolean(6, gioitinh);
		stm.setString(7, cmt);
		stm.setString(8, user);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
}

