package Bo;

import java.util.ArrayList;
import java.util.Date;

import Bean.CayXanhBean;
import Dao.CayXanhDao;

public class CayXanhBo {
	CayXanhDao cay = new CayXanhDao();
	public ArrayList<CayXanhBean> getTatCa() throws Exception{
		return cay.getTatCa();
	}
	
	public ArrayList<CayXanhBean> getTheoLoai(String maloai) throws Exception{
		return cay.getTheoLoai(maloai);
	}
	
	public ArrayList<CayXanhBean> getTheoTuyenDuong(String tuyenduong) throws Exception{
		return cay.getTheoTuyenDuong(tuyenduong);
	}
	
	public CayXanhBean getTheoMaCay(String macay) throws Exception{
		return cay.getTheoMaCay(macay);
	}
	
	public int xoaCayXanh(String macay) throws Exception{
		return cay.xoaCayXanh(macay);
	}
	
	public int themCayXanh(String macay,String tencay,String loaicay,Date ngaytrong, float chieucao, String tuyenduong) throws Exception{
		return cay.themCayXanh(macay, tencay, loaicay, ngaytrong, chieucao, tuyenduong);
	}
	
	public int suaCayXanh() throws Exception{
		return cay.suaCayXanh();
	}
}
