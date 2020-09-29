package commons;

import java.sql.*;


public class DBUtil {
   public Connection getConnection() throws Exception {
      String dbaddr = "jdbc:mariadb://localhost:3306/mall";
      String dbid = "root";
      String dbpw = "java1004";
      
      
      Class.forName("org.mariadb.jdbc.Driver");
      Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
      return conn;        
   }
}