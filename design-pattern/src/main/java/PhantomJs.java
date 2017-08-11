import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Created by 123 on 2017/7/17.
 */
public class PhantomJs {
    public static String getAjaxCotnent(String url) throws IOException {
        Runtime rt = Runtime.getRuntime();
        Process p = rt.exec("F:\\phantomjs-2.1.1-windows\\bin\\phantomjs.exe  F:\\phantomjs-2.1.1-windows\\bin\\hello.js ");
//        Process p = rt.exec("ping "+url);//这里我的codes.js是保存在c盘下面的phantomjs目录
        InputStream is = p.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        StringBuffer sbf = new StringBuffer();
        String tmp = "";
        while((tmp = br.readLine())!=null){
            sbf.append(tmp);
        }
        System.out.println(sbf.toString());
        return sbf.toString();
    }

    public static void main(String[] args) {
        try {
            getAjaxCotnent("www.baidu.com");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
