package testjava;

import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:/WEB-INF/spring/root-context.xml")
public class testcp {


        @Autowired
        HikariDataSource dataSource;

        @Test
        public void connectionTest() throws Exception{
            log.info("================================ 여기서부터 로그 ================================ ");
            System.out.println("dataSource = " + dataSource);
            System.out.println("dataSource.getHikariPoolMXBean().getTotalConnections() = " + dataSource.getHikariPoolMXBean().getTotalConnections());
        }

}