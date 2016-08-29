<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page session="false" %>
<html>
<head>
    <title>Search users</title>
    <link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">
    <a href="/users">Back to list</a>
    <h3>Search results for ${searchString.searchString}</h3>
    <c:if test="${empty foundUsers}" ><h3>No users with name "${searchString.searchString}" found</h3></c:if>
    <c:if test="${!empty foundUsers}">

        <table class="table">
            <tr>
                <th width="40">id</th>
                <th width="120">name</th>
                <th width="120">age</th>
                <th width="60">isAdmin</th>
                <th width="256">createdDate</th>
                <th width="80">edit</th>
                <th width="80">delete</th>
            </tr>
            <c:forEach items="${foundUsers}" var="user" varStatus="itr">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.userAge}</td>
                    <td>${user.userIsAdmin}</td>
                    <td>${user.userCreatedDate}</td>
                    <td><a href="<c:url value='/edit/${user.userId}' />" >Edit</a></td>
                    <td><a href="<c:url value='/remove/${user.userId}' />" >Remove</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>