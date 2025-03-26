<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vote for Your Favorite TV Series</title>
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
        button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background: #007bff;
            color: white;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Vote for Your Favorite TV Series.</h1>
        <form action="VoteServlet" method="post">
            <button type="submit" name="series" value="Breaking Bad">Breaking Bad</button>
            <button type="submit" name="series" value="Game of Thrones">Game of Thrones</button>
            <button type="submit" name="series" value="Stranger Things">Stranger Things</button>
            <button type="submit" name="series" value="Friends">Friends</button>
        </form>
    </div>
</body>
</html>
