package t8_sungjuk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungjukDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sungjukVO vo = null;
	String sql = "";
	
	public SungjukDAO() {
		String url = "jdbc:mysql://localhost:3306/javaProject";
		String user = "atom";
		String password = "1234";
		
		try {
			// 1.드라이버 검색
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2.데이터베이스 검색(연결/연동)
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 오류~~" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동실패~~" + e.getMessage());
		}
	}
	
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
			pstmtClose();
		} catch (Exception e) {}
	}
	
	// 성적 자료 등록 처리
	public int setInput(sungjukVO vo) {
		int res = 0;
		
		try {
			sql	=	"insert into sungjuk valuse(deafault, ?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMat());
			pstmt.executeUpdate();
			res	=	pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
			e.printStackTrace();
		}	finally {
				pstmtClose();
			}
		return res;
		}
	
	public ArrayList<SungjukVO> getList() {
		ArrayList<sungjukVO> vos = new ArrayList<SungjukVO>();
		try {
			sql= "select * from sungjuk order by idx desc";
			pstmt	=	conn.prepareStatement(sql);
			rs	=	pstmt.executeQuery();
			
			while(rs.next()) {
				vo	=	new SungjukVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("Kor"));
				vo.setEng(rs.getInt("Eng"));
				vo.setMat(rs.getInt("Mat"));
				vos.add(vo);
			}
		}  catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
			e.printStackTrace();
		}	finally {
			rsClose();
		}
	}
	// 개별 조회 처리
	public sungjukVO getSearch(String name) {
		sungjukVO vo =	new sungjukVO();
	
		return vo;
		try {
			sql = "select * from sungjuk where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt	=	setString(1,name);
			rs	=	pstmt.executeQuery();
		
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMat(rs.getInt("mat"));
				
			}
			else	vo	=	null;
		}  catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
		}	finally {
			rsClose();

	
	}
	}
}
	

