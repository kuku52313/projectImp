package testjava;

import org.junit.Test;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import javax.sql.DataSource;

public class testDB {
    @Test
    public void testConnection() throws Exception {
        String url = "jdbc:mariadb://localhost:3306/imp?useSSL=false&amp;serverTimezone=Asia/Seoul";
        String id = "imp";
        String pw = "root";
        DataSource dataSource = new SingleConnectionDataSource(url,id,pw,true);
        System.out.println(dataSource.getConnection());

    }
}
