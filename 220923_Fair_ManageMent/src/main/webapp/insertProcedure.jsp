<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<section>
		<h1>작업공정등록</h1>
		<form action="insertProcedurePro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>작업지시번호</th>
					<td><input type="text" name="w_workno" size="20" maxlength="8">예)20190001</td>
				</tr>
				<tr>
					<th>재료준비</th>
					<td>
						<label><input type="radio" name="p_p1" value="Y">완료</label>
						<label><input type="radio" name="p_p1" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>인쇄공정</th>
					<td>
						<label><input type="radio" name="p_p2" value="Y">완료</label>
						<label><input type="radio" name="p_p2" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>코팅공정</th>
					<td>
						<label><input type="radio" name="p_p3" value="Y">완료</label>
						<label><input type="radio" name="p_p3" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>합지공정</th>
					<td>
						<label><input type="radio" name="p_p4" value="Y">완료</label>
						<label><input type="radio" name="p_p4" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>접합공정</th>
					<td>
						<label><input type="radio" name="p_p5" value="Y">완료</label>
						<label><input type="radio" name="p_p5" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>포장적재</th>
					<td>
						<label><input type="radio" name="p_p6" value="Y">완료</label>
						<label><input type="radio" name="p_p6" value="N">작업중</label>
					</td>
				</tr>
				<tr>
					<th>최종작업일자</th>
					<td><input type="text" name="w_lastdate" size="20" maxlength="8">예)20190001</td>
				</tr>
				<tr>
					<th>최종작업시간</th>
					<td><input type="text" name="w_lasttime" size="20" maxlength="4">예)1300</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="insertPCheck();">공정등록</button>
						<button type="button" onclick="updatePCheck();">공정수정</button>
						<button type="reset" onclick="resetAlert();">다시쓰기</button>
					</th>
				</tr>
			</table>
			<h2>[참고]공정정보입력은 작업지시서에 등록된 작업지시번호를 참조하여 저장합니다.</h2>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>