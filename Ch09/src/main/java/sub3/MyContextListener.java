package sub3;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// WAS 실행과 종료를 모니터링하는 옵저버
public class MyContextListener implements ServletContextListener {

	public MyContextListener() { // 생성자
		System.out.println("MyContextListener()..");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized()..");
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed()..");
	}
}