<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(function(){
		
		$('.btnCancel').click(function(){
			$('.content').val('');
		});
	});
</script>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	response.sendRedirect("/Jboard/view.jsp?no="+no);
%>