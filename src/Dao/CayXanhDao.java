package Dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import Bean.CayXanhBean;

public class CayXanhDao {
	public ArrayList<CayXanhBean> getTatCa() throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<CayXanhBean> lst = new ArrayList<CayXanhBean>();
		String sql = "select * from CAYXANH";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			// r la ResultSet : r.next()
			String MaCay = r.getString("MaCay");
			String TenCay = r.getString("TenCay");
			String MaLoai = r.getString("MaLoai");
			float ChieuCao = r.getFloat("ChieuCao");
			Date NgayTrong = r.getDate("NgayTrong");
			String TuyenDuong = r.getString("TuyenDuong");
			lst.add(new CayXanhBean(MaCay, TenCay, MaLoai, ChieuCao, NgayTrong, TuyenDuong));
		}
		r.close();
		dc.cn.close();
		return lst;
	}
	
	public ArrayList<CayXanhBean> getTheoLoai(String maloai) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<CayXanhBean> lst = new ArrayList<CayXanhBean>();
		String sql = "select * from CAYXANH WHERE MaLoai = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, maloai);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			// r la ResultSet : r.next()
			String MaCay = r.getString("MaCay");
			String TenCay = r.getString("TenCay");
			String MaLoai = r.getString("MaLoai");
			float ChieuCao = r.getFloat("ChieuCao");
			Date NgayTrong = r.getDate("NgayTrong");
			String TuyenDuong = r.getString("TuyenDuong");
			lst.add(new CayXanhBean(MaCay, TenCay, MaLoai, ChieuCao, NgayTrong, TuyenDuong));
		}
		r.close();
		dc.cn.close();
		return lst;
	}
	
	public ArrayList<CayXanhBean> getTheoTuyenDuong(String tuyenduong) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<CayXanhBean> lst = new ArrayList<CayXanhBean>();
		String sql = "select * from CAYXANH WHERE TuyenDuong = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, tuyenduong);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			// r la ResultSet : r.next()
			String MaCay = r.getString("MaCay");
			String TenCay = r.getString("TenCay");
			String MaLoai = r.getString("MaLoai");
			float ChieuCao = r.getFloat("ChieuCao");
			Date NgayTrong = r.getDate("NgayTrong");
			String TuyenDuong = r.getString("TuyenDuong");
			lst.add(new CayXanhBean(MaCay, TenCay, MaLoai, ChieuCao, NgayTrong, TuyenDuong));
		}
		r.close();
		dc.cn.close();
		return lst;
	}
	
	public CayXanhBean getTheoMaCay(String macay) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		CayXanhBean cayxanh = null;
		String sql = "select * from CAYXANH WHERE MaCay = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, macay);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			// r la ResultSet : r.next()
			String MaCay = r.getString("MaCay");
			String TenCay = r.getString("TenCay");
			String MaLoai = r.getString("MaLoai");
			float ChieuCao = r.getFloat("ChieuCao");
			Date NgayTrong = r.getDate("NgayTrong");
			String TuyenDuong = r.getString("TuyenDuong");
			cayxanh = new CayXanhBean(MaCay, TenCay, MaLoai, ChieuCao, NgayTrong, TuyenDuong);
		}
		r.close();
		dc.cn.close();
		return cayxanh;
	}
	
	
	
	public int xoaCayXanh(String macay) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE FROM CAYXANH WHERE MaCay = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, macay);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
	
	public int themCayXanh(String macay,String tencay,String loaicay,Date ngaytrong, float chieucao, String tuyenduong) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT INTO CAYXANH(MaCay,TenCay,MaLoai,ChieuCao,NgayTrong,TuyenDuong) VALUES (?,?,?,?,?,?)";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, macay);
		stm.setString(2,tencay );
		stm.setString(3,loaicay );
		stm.setDate(5, new java.sql.Date(ngaytrong.getTime()));
		stm.setFloat(4, chieucao);
		stm.setString(6, tuyenduong);
		
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
	
	public int suaCayXanh() throws Exception{
		return 0;
	}
	
	
	
}
