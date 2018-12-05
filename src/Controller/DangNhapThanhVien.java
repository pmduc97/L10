package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.NguoiDungBean;
import Bo.NguoiDungBo;

/**
 * Servlet implementation class DangNhapThanhVien
 */
@WebServlet("/DangNhapThanhVien")
public class DangNhapThanhVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapThanhVien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    NguoiDungBo nd = new NguoiDungBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		try {
			if(request.getParameter("dangnhap") != null) {
				String taikhoan = request.getParameter("taikhoan");
				String matkhau = request.getParameter("matkhau");
				NguoiDungBean nguoidung = nd.checkLogin(taikhoan, matkhau, 1);
				
				if(nguoidung != null) {
					request.setAttribute("kiemtra", "1");
					HttpSession session = request.getSession();
					
					session.setAttribute("thanhvien", nguoidung);
				}
				else {
					request.setAttribute("kiemtra", "0");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("login-thanhvien.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
