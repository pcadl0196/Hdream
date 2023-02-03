<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<main class="layoutCenter">
<div align="center"><h1>문의사항</h1></div>
<table>
	<c:forEach var="map" items="${list}">
		<c:if test="${!(map.B_QNA_REPLY_IDX > 0)}">
			<tbody>
				<tr>
					<th>제목</th>
					<td><strong>${map.B_QNA_TITLE }</strong></td>
					<th>회원ID</th>
					<td>${map.B_QNA_M_ID }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${map.B_QNA_REG_DATE }</td>
					<th>조회수</th>
					<td>${map.B_QNA_READ_HIT }</td>
				</tr>
				<tr>
					<td colspan="4" style="white-space:pre; height:300px;">${map.B_QNA_CONTENTS }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<div align="center">	
							<a href="/admin/qnaList" class="btn normal">목록으로</a>
							<a class="use_move btn submit" href="/admin/qnaAnswerForm" onclick="move(this, 'in', 'B_QNA_IDX')">
								답변하기
								<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX}">
							</a>
							<a class="use_move btn warn" href="/admin/qnaDelete" onclick="move(this, 'in', 'B_QNA_IDX')" >
								삭제하기
								<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
							</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</c:if>
		<c:if test="${map.B_QNA_REPLY_IDX > 0}">
			<tfoot>
				<tr>
					<th>답변 작성일</th>
					<td colspan="2">${map.B_QNA_REG_DATE }</td>
					<td rowspan="2">
						<div align="center">
							<a class="use_move btn submit" href="/admin/qnaAnswerUpdateForm" onclick="move(this, 'in', 'B_QNA_IDX')">
								수정하기
								<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
							</a>
							<a class="use_move btn warn" href="/admin/qnaDelete" onclick="move(this, 'in', 'B_QNA_IDX')" >
								삭제하기
								<input type="hidden" name="B_QNA_IDX" value="${map.B_QNA_IDX }">
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<th>답변 내용</th>
					<td colspan="2" style="white-space:pre;">${map.B_QNA_CONTENTS}</td>
				</tr>
			</tfoot>
		</c:if>
	</c:forEach>
</table>
</main>
<%@ include file="/WEB-INF/include/admin-footer.jspf"%>