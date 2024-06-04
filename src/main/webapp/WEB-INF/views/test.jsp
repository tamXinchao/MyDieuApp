
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h1>User List</h1>
    <form method="get" action="/users">
        <label for="fullname">Search by Fullname:</label>
        <input type="text" id="fullname" name="fullname">
        <button type="submit">Search</button>
    </form>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Fullname</th>
                <th>Username</th>
                <th>Gender</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.user_Id}</td>
                    <td>${user.fullname}</td>
                    <td>${user.username}</td>
                    <td>${user.gender ? 'Male' : 'Female'}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
