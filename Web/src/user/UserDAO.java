package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// ctrl + shift + O -> java.sql.Connection
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/TEST";
			// localhost:3306 : 본인 컴퓨터에 설치된 MySQL 서버. TEST라는 DB에 접속
			String dbID = "root";
			String dbPassword = "1234";
			// Class.forName("com.mysql.jdbc.Driver"); // MySQL 8 이전 버전
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Driver : MySQL에 접속할 수 있도록 매개체 역할을 하는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			// conn 객체에 접속된 정보가 담긴다.
			
		} catch (Exception e) {
			e.printStackTrace();
			// 예외처리
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			// PreparedStatement에 정해진 SQL문장을 데이터베이스에 삽입
			pstmt.setString(1, userID);
			// SQL Injection 해킹기법 방어수단
			// 중간에 물음표가 있는 하나의 문장을 미리 준비해 놓았다가 물음표에 해당하는 내용으로 userID를 넣어준다.
			rs = pstmt.executeQuery();
			// 결과를 담을 수 있는 하나의 객체에 실행 결과를 넣어준다.
			if (rs.next()) {
				if(rs.getString(1).contentEquals(userPassword)) {
					return 1;
					// 로그인 성공
				}
				else
					return 0;
					// 비밀번호 불일치
			}
			return -1;
			// ID가 없다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		// 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		// 데이터베이스 오류
	}
	
	public User getUser(String userID) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
