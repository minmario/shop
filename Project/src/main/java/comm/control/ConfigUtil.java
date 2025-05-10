package comm.control;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {
    private static final Properties properties = new Properties();

    static {
        try (InputStream input = ConfigUtil.class.getClassLoader()
            .getResourceAsStream("config/config.properties")) {
            if (input != null) {
                properties.load(input);
            } else {
                throw new RuntimeException("config.properties 파일을 찾을 수 없습니다.");
            }
        } catch (IOException e) {
            throw new RuntimeException("config.properties 로딩 실패", e);
        }
    }

    public static String get(String key) {
        return properties.getProperty(key);
    }
}
