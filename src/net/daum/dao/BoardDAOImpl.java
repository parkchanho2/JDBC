package net.daum.dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.daum.vo.BoardVO;


public class BoardDAOImpl {
	String drivaer = "oracle.jdbc.OracleDriver"; //oracle.jdbc 는 패키지명, OracleDriver은 jdbc드라이버 클래스명
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; //오라클 접속주소, localhost는 모든 내자신 컴퓨터 호스트이름, 1521은 오라클 연결 포트번호, xe는 데이터베이스 명
	String user = "night"; //오라클 사용자 이름
	String password = "123456"; //오라클 사용자 비번
	
	Connection con = null; //데이터 베이스 연결 con
	PreparedStatement pt = null; // 쿼리문 수행 pt
	ResultSet rs = null; // 검색 결과 레코드를 저장할 rs
	String sql = null; // 쿼리문 저장변수
	
	public List getBoardList(){
		java.util.List<BoardVO> blist = new ArrayList<>();
		
		try {
			Class.forName(drivaer);
			con = DriverManager.getConnection(url, user, password);
			sql = "select * from tbl_board10 order by bno desc"; // 번호를 기준으로 내림차순 정렬
			pt = con.prepareStatement(sql); // 쿼리문을 미리 컴파일 하여 수행
			rs = pt.executeQuery(); // select 문 수행후 검색 결과 레코드 rs에 저장
			while(rs.next()) { // 복수개의 레코드 행을 검색할 대는 while반복문으로 처리 next() 메소드는 다음레코드 행이 존재하면 참
				BoardVO b = new BoardVO();
				b.setBno(rs.getInt("bno")); // bno컬럼 레코드가 정수숫자이면 getInt() 메소드로 가져온다.
				b.setBname(rs.getString("bname"));
				b.setBtitle(rs.getString("btitle"));
				b.setBcon(rs.getString("bcont"));
				b.setBdate(rs.getString("bdate"));
				
				blist.add(b);
				
			}
		}catch(Exception e) { e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) { e.printStackTrace();}
		}
		return (List) blist;
	}
}
