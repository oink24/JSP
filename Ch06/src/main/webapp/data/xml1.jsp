<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// XML 생성
	String xmlData  = "<user>";
		   xmlData += "<uid>a101</uid>";
		   xmlData += "<name>홍길동</name>";
		   xmlData += "<hp>010-1234-1111</hp>";
		   xmlData += "<age>23</age>";
		   xmlData += "</user>";
		   
	// XML 출력
	out.print(xmlData);
%>