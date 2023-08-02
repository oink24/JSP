<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jboard::view</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                OOO님 반갑습니다.
                <a href="#" class="logout">[로그아웃]</a>
            </p>
        </header>
        <main>
            <section id="board" class="view">
                <form action="#">
                    <h3>글 보기</h3>
                    <table border="0">
                        <tr>
                            <td>제목</td>
                            <td>
                                <input type="text" readonly name="title" value="제목입니다.">
                            </td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td>
                                <a href="#">2020년 상반기 매출자료.xls</a>
                                <span>7회 다운로드</span>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content" readonly>내용 샘플입니다.</textarea>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <a href="#" class="btnDelete">삭제</a>
                        <a href="#" class="btnModify">수정</a>
                        <a href="#" class="btnList">목록</a>
                    </div>

                    <!-- 댓글 리스트 -->
                    <section class="commentList">
                        <h3>댓글 목록</h3>
                        <article class="comment">
                            <span>
                                <span>길동이</span>
                                <span>23-08-01</span>
                            </span>
                            <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                            <div>
                                <a href="#">삭제</a>
                                <a href="#">수정</a>
                            </div>
                        </article>
                        <p class="empty">등록된 댓글이 없습니다.</p>
                    </section>

                    <!-- 댓글 입력폼 -->
                    <section class="commentForm">
                        <h3>댓글 쓰기</h3>
                        <form action="#">
                            <textarea name="comment"></textarea>
                            <div>
                                <a href="#" class="btnCancel">취소</a>
                                <input type="submit" class="btnWrite" value="작성완료">
                            </div>
                        </form>
                    </section>
                </form>
            </section>
        </main>
        <footer>
            <p>ⓒCopyright github.com/oink24</p>
        </footer>
    </div>
</body>
</html>