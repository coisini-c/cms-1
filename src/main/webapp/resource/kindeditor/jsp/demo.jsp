<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="resource/kindeditor/plugins/code/prettify.js"></script>
	<script charset="utf-8" src="resource/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="resource/kindeditor/lang/zh-CN.js"></script>
	<script src="resource/js/jquery-3.2.1.js"></script>
	<script>
		KindEditor.ready(function(K) {
			window.editor1 = K.create('textarea[name="content1"]', {
				cssPath : 'resource/kindeditor/plugins/code/prettify.css',
				uploadJson : 'resource/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : 'resource/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		function query(){
		alert(editor1.html())
			//alert( $("[name='content1']").attr("src"))
		} 
	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="demo.jsp">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br />
		<input type="button" name="button" value="提交内容" onclick="query()"/> (提交快捷键: Ctrl + Enter)
	</form>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>