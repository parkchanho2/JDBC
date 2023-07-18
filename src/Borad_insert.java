

import java.sql.Statement;
import java.sql.Connection;

// tbl_board10 테이블에 레코드 저장 소스
public class Borad_insert {
	public static void main(String[] args) {
		
		String drivaer = "oracle.jdbc.OracleDriver"; //oracle.jdbc 는 패키지명, OracleDriver은 jdbc드라이버 클래스명
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; //오라클 접속주소, localhost는 모든 내자신 컴퓨터 호스트이름, 1521은 오라클 연결 포트번호, xe는 데이터베이스 명
		String user = "night"; //오라클 사용자 이름
		String password = "night"; //오라클 사용자 비번
		
		Connection con = null; //데이터 베이스 연결 con
		Statement stmt = null; //쿼리문 수행 stmt
	}
}
