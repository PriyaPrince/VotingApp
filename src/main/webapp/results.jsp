<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>Voting Results</title>
</head>
<body>
    <h2>Voting Results</h2>
    <ul>
        <%
            Map<String, Integer> voteCount = (Map<String, Integer>) request.getAttribute("voteCount");
            for (Map.Entry<String, Integer> entry : voteCount.entrySet()) {
        %>
            <li><%= entry.getKey() %>: <%= entry.getValue() %> votes</li>
        <%
            }
        %>
    </ul>
    <br>
    <a href="index.jsp">Back to Vote</a>
</body>
</html>

