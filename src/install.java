import java.sql.*;

class install {
    
  public static void main(String[] args) throws Exception {
    String result = "";
    String app = "crm";

    if (!"".equals (app) && app != null)
    {
 	String driver = System.getProperty("SQL_DRIVER", "com.mysql.jdbc.Driver");

	String defaultUrl = "jdbc:mysql://localhost:5000/" + app;
	String createUrl = "jdbc:mysql:mxj://localhost:5000/"+ app + "?server.initialize-user=true&createDatabaseIfNotExist=true";

 	String user = "krawler";
 	String password = "krawler";
	Connection conn = null;

 	Class.forName(driver);

	try {
 		conn =  DriverManager.getConnection(defaultUrl, user, password);
	} catch (SQLException sex) {
		conn =  DriverManager.getConnection(createUrl, user, password);
	}
 	conn.close();
	result = "Database connected";
    } else {
	result = "error";
    }
    System.out.println (result);
  }
}
