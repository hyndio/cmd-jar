package me.hynd.cmd;

import com.google.common.io.Files;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Properties;

/**
 * @author hynd
 * @version 1.0
 * @Create 2015/7/27 9:48
 * @History hynd 2015/7/27 创建 <br>
 */
public class Cmd {

    public static void main(String[] args) throws IOException {

        System.out.println("Hello, world..");

        String basePath = "conf";
        if (args.length > 0) {
            basePath = args[0];
        }

        File file = new File(basePath + File.separator + "cmd.conf");
        try {
            List<String> lines = Files.readLines(file, Charset.forName("UTF-8"));

            Properties prop = new Properties();
            prop.list(System.out);

            for (String line : lines) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
