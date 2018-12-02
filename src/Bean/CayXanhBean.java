package Bean;

import java.util.Date;

public class CayXanhBean {
	private String MaCay;
	private String TenCay;
	private String MaLoai;
	private float ChieuCao;
	private Date NgayTrong;
	private String TuyenDuong;
	public CayXanhBean(String maCay, String tenCay, String maLoai, float chieuCao, Date ngayTrong, String tuyenDuong) {
		super();
		MaCay = maCay;
		TenCay = tenCay;
		MaLoai = maLoai;
		ChieuCao = chieuCao;
		NgayTrong = ngayTrong;
		TuyenDuong = tuyenDuong;
	}
	
	public CayXanhBean() {
		super();
	}

	public String getMaCay() {
		return MaCay;
	}
	public void setMaCay(String maCay) {
		MaCay = maCay;
	}
	public String getTenCay() {
		return TenCay;
	}
	public void setTenCay(String tenCay) {
		TenCay = tenCay;
	}
	public String getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(String maLoai) {
		MaLoai = maLoai;
	}
	public float getChieuCao() {
		return ChieuCao;
	}
	public void setChieuCao(float chieuCao) {
		ChieuCao = chieuCao;
	}
	public Date getNgayTrong() {
		return NgayTrong;
	}
	public void setNgayTrong(Date ngayTrong) {
		NgayTrong = ngayTrong;
	}
	public String getTuyenDuong() {
		return TuyenDuong;
	}
	public void setTuyenDuong(String tuyenDuong) {
		TuyenDuong = tuyenDuong;
	}

}
