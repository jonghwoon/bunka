<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>

<form action="fieldPro">
	<table>
		<tr>
			<td>장소</td><td><input type="text" name="place"></td>
		</tr>
		<tr>
			<td>가격</td><td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>잔디 상태</td><td><input type="text" name="field"></td>
		</tr>
		<tr>
			<td>구장 크기</td><td><input type="text" name="fsize"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>