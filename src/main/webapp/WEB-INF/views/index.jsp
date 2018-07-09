<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
<style>
table, th, td {
	border: 2px solid black;
	border-collapse: separate;
}

th, td {
	padding: 5px;
}

th {
	text-align: left;
}
</style>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
         button. Handle errors like empty fields -->
	<div class="form-group form">
		<form action='add' method="post">
			<label>Note Title:</label> <input type="text" id="noteTitle"
				name="noteTitle" placeholder="note title" class="form-control" /> <br />
			<label>Note Content:</label> <input type="text" id="noteContent"
				name="noteContent" placeholder="note content" class="form-control" />
			<br /> <label>Note Status:</label> <select name="noteStatus">
				<option value="activated">activated</option>
				<option value="deactivated">de-activated</option>
			</select> <br />
			<button type="submit" class="form-control">Submit</button>
		</form>
	</div>

	<c:if test="${!errorMessage.isEmpty()}">
		<p style="color: red;">${errorMessage}</p>
	</c:if>


	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->

	<form action="delete" method="get">
		<h2>delete</h2>
		<p>
			NoteID: <input type="text" name="noteId" /> <input type="submit"
				value="delete" />
		</p>
	</form>

	<h2>All Notes</h2>
	<TABLE BORDER=10>

		<TR>

			<TD><h3>Note ID</h3></TD>
			<TD><h3>Note Title</h3></TD>
			<TD><h3>Note content</h3></TD>
			<TD><h3>Note Status</h3></TD>
			<TD><h3>Note created at</h3></TD>

		</TR>

		<c:forEach var="note" items="${noteList}">
			<tr>
				<td>${note.getNoteId()}</td>
				<td>${note.getNoteTitle()}</td>
				<td>${note.getNoteContent()}</td>
				<td>${note.getNoteStatus()}</td>
				<td>${note.getCreatedAt()}</td>
				<td><form action='update' method="post">
						<input type="hidden" id="noteId" name="noteId"
							value="${note.noteId}" class="form-control" /> 
							<label>NoteTitle:</label>
						<input type="text" id="noteTitle" name="noteTitle"
							placeholder="note title" value="${note.noteTitle}"
							class="form-control" /> <br/> 
							
							<label>Note Content:</label> 
							<input	type="text" id="noteContent" name="noteContent"
							placeholder="note content" value="${note.noteContent}"
							class="form-control" /> <br/> 
							
							<label>Note Status:</label> 
							<select name="noteStatus">
							<option value="activated">activated</option>
							<option value="deactivated">de-activated</option>
						</select> <br/>

						<button type="submit" class="class="btnbtn-primary">Update</button>
					</form></td>
			</tr>
		</c:forEach>

	</TABLE>
</body>
</html>

