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
			// localhost:3306 : ���� ��ǻ�Ϳ� ��ġ�� MySQL ����. TEST��� DB�� ����
			String dbID = "root";
			String dbPassword = "1234";
			// Class.forName("com.mysql.jdbc.Driver"); // MySQL 8 ���� ����
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Driver : MySQL�� ������ �� �ֵ��� �Ű�ü ������ �ϴ� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			// conn ��ü�� ���ӵ� ������ ����.
			
		} catch (Exception e) {
			e.printStackTrace();
			// ����ó��
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			// PreparedStatement�� ������ SQL������ �����ͺ��̽��� ����
			pstmt.setString(1, userID);
			// SQL Injection ��ŷ��� ������
			// �߰��� ����ǥ�� �ִ� �ϳ��� ������ �̸� �غ��� ���Ҵٰ� ����ǥ�� �ش��ϴ� �������� userID�� �־��ش�.
			rs = pstmt.executeQuery();
			// ����� ���� �� �ִ� �ϳ��� ��ü�� ���� ����� �־��ش�.
			if (rs.next()) {
				if(rs.getString(1).contentEquals(userPassword)) {
					return 1;
					// �α��� ����
				}
				else
					return 0;
					// ��й�ȣ ����ġ
			}
			return -1;
			// ID�� ����.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		// �����ͺ��̽� ����
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
		// �����ͺ��̽� ����
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
