import com.xh.alin.redis.RedisUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


/**
 * Created by 123 on 2017/3/13.
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:test-application.xml","classpath:spring-redis.xml"})
public class RedisTest {
    @Autowired
    private RedisUtils redisUtils;
    @Test
    public void setValue(){
        redisUtils.set("许欢是谁","帅哥");
        String ri = redisUtils.get("许欢是谁");
        System.out.println(ri);
    }
    @Test
    public void getValue(){
        String ri = redisUtils.get("许欢是谁");
        System.out.println(ri);
    }

}

