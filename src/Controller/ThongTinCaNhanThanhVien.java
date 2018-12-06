package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bo.NguoiDungBo;

/**
 * Servlet implementation class ThongTinCaNhanThanhVien
 */
@WebServlet("/ThongTinCaNhanThanhVien")
public class ThongTinCaNhanThanhVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongTinCaNhanThanhVien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    NguoiDungBo nd = new  NguoiDungBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		try {
			if(request.getParameter("luu") != null) {
				String hoten = request.getParameter("hoten");
				String ngaysinh = request.getParameter("ngaysinh");
				SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
				Date ns = sim.parse(ngaysinh);
				String gioitinh = request.getParameter("gioitinh");
				boolean gt = gioitinh.equals("1")?true:false;
				String cmt = request.getParameter("cmt");
				String email = request.getParameter("email");
				String diachi = request.getParameter("diachi");
				String taikhoan = request.getParameter("taikhoan");
				String sodienthoai = request.getParameter("sdt");
				
				int i = nd.suaThanhVien(hoten, ns, cmt, sodienthoai, email, diachi, gt, taikhoan);
				
				if(i!=0) {
					request.setAttribute("kiemtra", "1");
					request.getSession().setAttribute("thanhvien", nd.get1ThanhVien(taikhoan));
				}
				else {
					request.setAttribute("kiemtra", "0");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("thongtincanhanthanhvien.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
