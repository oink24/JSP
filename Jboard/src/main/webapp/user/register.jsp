<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/Jboard/js/zipcode.js"></script>
	<script src="/Jboard/js/validation.js"></script>
	<script src="/Jboard/js/checkUser.js"></script>
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section class="register">
                <form id="formUser" action="/Jboard/user/registerProc.jsp" method="post">
                    <table border="1">
                        <caption>사이트 이용정보 입력</caption>
                        <tbody>
                            <tr>
                                <td>아이디</td>
                                <td>
                                    <input type="text" name="uid" placeholder="아이디 입력">
                                    <button type="button" id="btnCheckUid"><img src="../images/chk_id.gif" alt="중복확인"></button>
                                	<span class="resultId"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td>
                                    <input type="password" name="pass1" placeholder="비밀번호 입력">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호 확인</td>
                                <td>
                                    <input type="password" name="pass2" placeholder="비밀번호 확인 입력">
                                    <span class="resultPass"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tbody>
                            <tr>
                                <td>이름</td>
                                <td>
                                    <input type="text" name="name" placeholder="이름 입력">
                                    <span class="resultName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>별명</td>
                                <td>
                                    <p>공백 없이 한글, 영문, 숫자만 입력가능</p>
                                    <input type="text" name="nickname" placeholder="별명 입력">
                                    <span class="resultNickname"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>E-Mail</td>
                                <td>
                                    <input type="text" name="email" placeholder="이메일 입력">
                                    <span class="resultEmail"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>휴대폰</td>
                                <td>
                                    <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13">
                                	<span class="resultHp"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td>
                                    <div>
                                        <input type="text" name="zip" placeholder="우편번호">
                                        <button type="button" class="btnZip" onclick="zipcode()"><img src="../images/chk_post.gif"></button>
                                    </div>
                                    <div>
                                        <input type="text" readonly name="addr1" placeholder="주소를 검색하세요.">
                                    </div>
                                    <div>
                                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요.">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <a href="/Jboard/user/login.jsp" class="btnCancel">취소</a>
                        <input type="submit" class="btnJoin" value="회원가입">
                    </div>
                </form>
            </section>
        </main>
        <footer>
            <p>ⓒCopyright github.com/oink24</p>
        </footer>
    </div>
</body>
</html>