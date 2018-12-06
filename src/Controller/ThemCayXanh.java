package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CayXanhBean;
import Bo.CayXanhBo;
import Bo.LoaiCayBo;

/**
 * Servlet implementation class ThemCayXanh
 */
@WebServlet("/ThemCayXanh")
public class ThemCayXanh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemCayXanh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    LoaiCayBo loai = new LoaiCayBo();
    CayXanhBo cay = new CayXanhBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		try {
			if(request.getParameter("them") != null) {
				String macay = request.getParameter("macay");
				String tencay = request.getParameter("tencay");
				String loaicay = request.getParameter("loaicay");
				String ngaytrong = request.getParameter("thoigian");
				String chieucao = request.getParameter("chieucao");
				String tuyenduong = request.getParameter("tuyenduong");
				float cc = Float.parseFloat(chieucao);
				SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
				Date nt = sim.parse(ngaytrong);
				CayXanhBean c = cay.getTheoMaCay(macay);
				if(c != null) {
					request.setAttribute("kiemtra", "-1");
				}
				else {
					int i = cay.themCayXanh(macay, tencay, loaicay, nt,cc , tuyenduong);
					if(i!=0) {
						request.setAttribute("kiemtra", "1");
					}
					else {
						request.setAttribute("kiemtra", "0");
					}
				}
			}
			request.setAttribute("lstLoai", loai.getAll());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("add-tree.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
