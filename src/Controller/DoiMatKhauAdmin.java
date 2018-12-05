package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.NguoiDungBean;
import Bo.NguoiDungBo;

/**
 * Servlet implementation class DoiMatKhauAdmin
 */
@WebServlet("/DoiMatKhauAdmin")
public class DoiMatKhauAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoiMatKhauAdmin() {
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
			if(request.getParameter("doimatkhau") != null) {
				if(request.getParameter("matkhaucu") != null) {
					String taikhoan = request.getParameter("taikhoan");
					String matkhaucu = request.getParameter("matkhaucu");
					String matkhaumoi1 = request.getParameter("matkhaumoi1");
					NguoiDungBean t = nd.checkLogin(taikhoan, matkhaucu, 0);
					if(t == null) {
						request.setAttribute("kiemtra", "-1");
					}
					else {
						int i = nd.doiMatKhau(taikhoan, matkhaumoi1);
						if(i != 0) {
							request.setAttribute("kiemtra", "1");
						}
						else {
							request.setAttribute("kiemtra", "0");
						}
					}
				}
					
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("doimatkhau-admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
