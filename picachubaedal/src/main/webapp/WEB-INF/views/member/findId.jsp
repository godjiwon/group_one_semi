<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
    <!-- 여기에 CSS 링크 및 필요한 스타일 시트 등을 추가할 수 있습니다. -->
</head>
<body>
    <div class="cell">
        <form action="findId" method="post" autocomplete="off">
            <div class="container w-400">
                <div class="cell center">
                    <h1>아이디 찾기</h1>
                </div>
                <div class="cell mt-0 flex-cell">
                    <input type="text" name="memberNick" required class="tool w-100" placeholder="닉네임을 입력하세요">
                    <button type="submit" class="btn positive"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                <div class="cell">
                </div>
            </div>
        </form>
    </div>

    <div class="cell">
        <div class="container w-400">
            <div class="cell center">
                <h2>아이디 찾기 결과</h2>
            </div>
            <div class="cell">
                <% 
                    // 사용자가 입력한 닉네임을 가져옵니다.
                    String memberNick = request.getParameter("memberNick");
                    
                    // 데이터베이스 연결 정보
                    String url = "jdbc:mysql://localhost:3306/your_database";
                    String username = "your_username";
                    String password = "your_password";
                    
                    // 데이터베이스 연결
                    try (Connection conn = DriverManager.getConnection(url, username, password)) {
                        // SQL 쿼리 실행
                        String sql = "SELECT memberId FROM members WHERE memberNick=?";
                        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                            pstmt.setString(1, memberNick);
                            try (ResultSet rs = pstmt.executeQuery()) {
                                // 결과 처리
                                if (rs.next()) {
                                    String memberId = rs.getString("memberId");
                %>
                                    <p>입력하신 닉네임에 해당하는 아이디는 <%= memberId %>입니다.</p>
                <% 
                                } else {
                %>
                                    <p>입력하신 닉네임으로 가입된 아이디를 찾을 수 없습니다.</p>
                <% 
                                }
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>