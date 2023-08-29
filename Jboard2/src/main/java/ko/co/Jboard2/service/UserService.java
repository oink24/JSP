package ko.co.Jboard2.service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ko.co.Jboard2.dao.UserDAO;
import ko.co.Jboard2.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	UserDAO dao = UserDAO.getInstance();
	private static String generatedCode;
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	public int selectCountNickname(String nick) {
		return dao.selectCountNickname(nick);
	}
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	public List<UserDTO> selectUsers(String uid) {
		return dao.selectUsers(uid);
	}
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	
	public int sendCodeByEmail(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000); // 10만 ~ 100만 사이의 랜덤값
		generatedCode = String.valueOf(code);
		
		// 기본정보
		String sender = "oooq3o@gmail.com";
		String password = "nogwfaudlkjxyheh";
		String title    = "Jboard2 인증코드입니다.";
		String content  = "<br><h1>인증코드는 "+code+" 입니다.</h1>";
		
		// Gmail SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // 이메일 발송을 처리해줄 SMTP 서버
		props.put("mail.smtp.port", 465); // TLS의 포트번호:587(naver경우), SSL의 포트번호:465(gmail경우)
		props.put("mail.smtp.auth", "true"); // SMTP서버의 인증을 사용한다는 의미
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		// Gmail SMTP 세션 생성
		Session gmailSession = Session.getInstance(props, new Authenticator(){
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		// 메일 발송
		int status = 0;
		Message message = new MimeMessage(gmailSession);
		
		try {
			logger.info("here1...");
			message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); // 수신자메일주소
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(message); // 전송
			
			status = 1;
			
		}catch(Exception e){
			status = 0;
			logger.error("sendCodeByEmail() error : " + e.getMessage());
		}
		
		return status;
	} // sendCodeByEmail end
	
	public int confirmCodeByEmail(String code) {
		
		if (code.equals(generatedCode))
		{
			logger.info("return 1...");
			return 1;
		}
		else
		{
			logger.info("return 0...");
			return 0;
		}
	}
}
