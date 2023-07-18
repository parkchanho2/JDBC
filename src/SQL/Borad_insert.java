package SQL;

import java.sql.Statement;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;

// tbl_board10 테이블에 레코드 저장 소스
public class Borad_insert {
	public static void main(String[] args) {
		
		String drivaer = "oracle.jdbc.OracleDriver"; //oracle.jdbc 는 패키지명, OracleDriver은 jdbc드라이버 클래스명
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; //오라클 접속주소, localhost는 모든 내자신 컴퓨터 호스트이름, 1521은 오라클 연결 포트번호, xe는 데이터베이스 명
		String user = "night"; //오라클 사용자 이름
		String password = "123456"; //오라클 사용자 비번
		
		Connection con = null; //데이터 베이스 연결 con
		Statement stmt = null; //쿼리문 수행 stmt
		String sql = null;
		try {
			Class.forName(drivaer); // 오라클 jdbc 드라이브 클래스 로드
			con = DriverManager.getConnection(url, user, password); //오라클 연결주소, 사용자, 비번을 메소드 인자값으로 전달해서 데이터 베이스 연결 con 생성
			
			Scanner sc = new Scanner(System.in);
			
			System.out.println("tbl_board10 테이블에 레코드 저장하기: ");
			System.out.print("글쓴이 입력: ");
			String bname = sc.nextLine();
			System.out.print("글제목 입력: ");
			String btitle = sc.nextLine();
			System.out.print("글내용 입력: ");
			String bcont = sc.nextLine();
			
			stmt = con.createStatement(); //쿼리문 수행할 stmt 생성
			
			sql="insert into tbl_board10 (bno, bname, btitle, bcont, bdate) values"
		            + "(bno_seq10.nextval, '" + bname + "', '" + btitle + "', '" + bcont + "', sysdate)";
			
			int re = stmt.executeUpdate(sql);
			
			if(re == 1) {
				System.out.println("계시판 저장 성공");
			}else {
				System.out.println("계시판 저장 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e) { e.printStackTrace();}
		}// finally
	}
}
