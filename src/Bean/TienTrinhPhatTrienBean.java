package Bean;

import java.util.Date;

public class TienTrinhPhatTrienBean {
	private String MaTienTrinh;
	private String MaCay;
	private Date ThoiGian;
	private float ChieuCao;
	private String TrangThai;
	private String GhiChu;
	public TienTrinhPhatTrienBean(String maTienTrinh, String maCay, Date thoiGian, float chieuCao, String trangThai,
			String ghiChu) {
		super();
		MaTienTrinh = maTienTrinh;
		MaCay = maCay;
		ThoiGian = thoiGian;
		ChieuCao = chieuCao;
		TrangThai = trangThai;
		GhiChu = ghiChu;
	}
	public String getMaTienTrinh() {
		return MaTienTrinh;
	}
	public void setMaTienTrinh(String maTienTrinh) {
		MaTienTrinh = maTienTrinh;
	}
	public String getMaCay() {
		return MaCay;
	}
	public void setMaCay(String maCay) {
		MaCay = maCay;
	}
	public Date getThoiGian() {
		return ThoiGian;
	}
	public void setThoiGian(Date thoiGian) {
		ThoiGian = thoiGian;
	}
	public float getChieuCao() {
		return ChieuCao;
	}
	public void setChieuCao(float chieuCao) {
		ChieuCao = chieuCao;
	}
	public String getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(String trangThai) {
		TrangThai = trangThai;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}

}
