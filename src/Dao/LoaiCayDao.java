package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.LoaiCayBean;

public class LoaiCayDao {
	public ArrayList<LoaiCayBean> getAll() throws Exception{
		ArrayList<LoaiCayBean> ds = new ArrayList<LoaiCayBean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "select * from LOAICAY";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		ResultSet r = stm.executeQuery();
		while(r.next()) {
			ds.add(new LoaiCayBean(r.getString("MaLoai"), r.getString("TenLoai")));
		}
		r.close();
		dc.cn.close();
		return ds;
	}
	
	public int XoaLoai(String maloai) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE FROM LOAICAY WHERE MaLoai = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, maloai);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
	
	public int SuaLoai(String maloai,String tenloai) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE LOAICAY SET TenLoai = ? WHERE MaLoai = ?";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, tenloai);
		stm.setString(2, maloai);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
	
	public int themLoai(String maloai,String tenloai) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT INTO LOAICAY(MaLoai,TenLoai) VALUES (?,?)";
		PreparedStatement stm = dc.cn.prepareStatement(sql);
		stm.setString(1, maloai);
		stm.setString(2, tenloai);
		int i = stm.executeUpdate();
		stm.close();
		dc.cn.close();
		return i;
	}
}
