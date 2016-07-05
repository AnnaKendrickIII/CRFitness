package com.init;

import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.*;
//本類別會依據傳入的書籍編號(BookID)讀取eBook表格內CoverImage欄位內的圖片，
//然後傳回給提出請求的瀏覽器
@WebServlet("/getImage")
public class GetImageFromDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		OutputStream os = null;
		InputStream is = null;
		try {
			
			String id = request.getParameter("id");
			
			String type = request.getParameter("type"); 
			// 取得能夠執行JNDI的Context物件
			Context context = new InitialContext();
			// 透過JNDI取得DataSource物件
			DataSource ds = (DataSource) context
					.lookup("java:comp/env/jdbc/JavaDataBase");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			if (type.equalsIgnoreCase("BOOK")) {  
				pstmt = conn.prepareStatement(
						"SELECT fileName, CoverImage from eBook where bookID = ?");
			} else if (type.equalsIgnoreCase("MEMBER")) {  
				pstmt = conn.prepareStatement(
						"SELECT Photo from Members where Member_ID = ?");
			}
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// Image欄位可以取出InputStream物件
				is = rs.getBinaryStream(1);				
				String mimeType = getServletContext().getMimeType("xxx.jpg");
				// 設定輸出資料的型態
				response.setContentType(mimeType);
				// 取得能寫出非文字資料的OutputStream物件
				os = response.getOutputStream();				
				
				if (is == null) {
					is = getServletContext().getResourceAsStream(
							"/images/NoImage.jpg");
				}
				int count = 0;
				byte[] bytes = new byte[8192];
				while ((count = is.read(bytes)) != -1) {
					os.write(bytes, 0, count);
				}
			}
		} catch (NamingException e) {
			throw new ServletException(e);
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close(); 
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				os.close();
			}
		}
	}
}