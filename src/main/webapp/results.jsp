<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Voting Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Voting Results</h1>
        <table>
            <tr>
                <th>TV Series</th>
                <th>Votes</th>
            </tr>
            <tr>
                <td>Breaking Bad</td>
                <td><%= request.getAttribute("breakingBadVotes") %></td>
            </tr>
            <tr>
                <td>Game of Thrones</td>
                <td><%= request.getAttribute("gameOfThronesVotes") %></td>
            </tr>
            <tr>
                <td>Stranger Things</td>
                <td><%= request.getAttribute("strangerThingsVotes") %></td>
            </tr>
            <tr>
                <td>Friends</td>
                <td><%= request.getAttribute("friendsVotes") %></td>
            </tr>
        </table>
    </div>
</body>
</html>
