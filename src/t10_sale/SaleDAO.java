package t10_sale;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SaleDAO extends ParentDAO {
	// Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	ProductVO pVO = null;
	SaleVO sVO = null;
	
//	public SaleDAO() {
//		String url = "jdbc:mysql://localhost:3306/javaProject";
//		String user = "atom";
//		String password = "1234";
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			
//			conn = DriverManager.getConnection(url, user, password);
//		} catch (ClassNotFoundException e) {
//			System.out.println("드라이버 검색 실패~~" + e.getMessage());
//		} catch (SQLException e) {
//			System.out.println("데이터베이스 연동 실패~~" + e.getMessage());
//		}
//	}
	
	// conn객체 close
	public void connClose() {
		try {
			conn.close();
		} catch (Exception e) {}
	}

	// pstmt객체 close
	public void pstmtClose() {
		try {
			if(pstmt != null) pstmt.close();
		} catch (Exception e) {}
	}
	
	// rs객체 close
	public void rsClose() {
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {}
		pstmtClose();
	}

	// 판매상품 등록처리
	public int setSaleInput(SaleVO sVo) {
		int res = 0;
		
		try {
			sql = "insert into sale values (default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sVo.getpName());
			pstmt.setInt(2, sVo.getEa());
			pstmt.setString(3, sVo.getpDate());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			//System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ProductVO getNameSearch(String pName) {
		ProductVO vo = new ProductVO();
		
		try {
			sql = "select * from product where pName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setpName(rs.getString("pName"));
				vo.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			//System.out.println("SQL 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			rsClose();
		}
		return vo;
	}
	
}
