package Bean;

import java.util.Date;

public class NguoiDungBean {
	private String UserName;
	private String PassWord;
	private String HoTen;
	private Date NgaySinh;
	private String SDT;
	private String Email;
	private String DiaChi;
	private boolean GioiTinh;
	private int Quyen;
	private String CMT;
	public NguoiDungBean(String userName, String passWord, String hoTen, Date ngaySinh, String sDT, String email,
			String diaChi, boolean gioiTinh, int quyen, String cMT) {
		super();
		UserName = userName;
		PassWord = passWord;
		HoTen = hoTen;
		NgaySinh = ngaySinh;
		SDT = sDT;
		Email = email;
		DiaChi = diaChi;
		GioiTinh = gioiTinh;
		Quyen = quyen;
		CMT = cMT;
	}
	public NguoiDungBean() {
		super();
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public Date getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public boolean isGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public long getQuyen() {
		return Quyen;
	}
	public void setQuyen(int quyen) {
		Quyen = quyen;
	}
	public String getCMT() {
		return CMT;
	}
	public void setCMT(String cMT) {
		CMT = cMT;
	}
	
}
