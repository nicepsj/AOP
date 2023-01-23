package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionBasicTest {
	public static void main(String[] args) {
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String user = "erp";
			String password = "erp";
			String sql ="";
			Connection con =null;
			PreparedStatement ptmt =null;
			//현재 작업의 진행상태를 저장하기 위한 플래그변수 선언 - 정상상태|오류상태
			boolean state = false;
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(url, user, password);
				//1. 자바는 autocommit이 기본 설정 값이므로 해제
				con.setAutoCommit(false);
				//책구매버튼을 누를때 실행되는 작업들
			
				sql = "insert into test values('test21','1234','서울','장동건','배우')";
				ptmt = con.prepareStatement(sql);
				ptmt.executeUpdate();
				
			
				sql =  "insert into test values('test22','1234','인천','이민호','배우')";
				ptmt = con.prepareStatement(sql);
				ptmt.executeUpdate();
				
				sql =  "insert into test values('test23','1234','군산','장기용','배우'";
				ptmt = con.prepareStatement(sql);
				ptmt.executeUpdate();

				//이 line이 실행된다는 것은 정상적으로 작업을 완료했다는 의미
				state = true;				
			}catch(ClassNotFoundException e){
				
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				//state값을 판단해서 오류이거나 정상실행 상태이거나 finally블럭안에서 db에 최종 반영될 수 있도록 처리
				try {
					if(state) { //정상
						con.commit(); //db의 모든 작업을 commit시킨다.
					}else {
						con.rollback();//db의 모든 작업을 rollback시킨다.
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		

	}

}
