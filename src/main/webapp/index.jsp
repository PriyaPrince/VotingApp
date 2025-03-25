<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vote Your Favorite TV Series</title>
</head>
<body>
    <h2>Vote for Your Favorite TV Series</h2>
    <form action="vote" method="post">
        <label><input type="radio" name="series" value="Breaking Bad"> Breaking Bad</label><br>
        <label><input type="radio" name="series" value="Game of Thrones"> Game of Thrones</label><br>
        <label><input type="radio" name="series" value="Stranger Things"> Stranger Things</label><br>
        <label><input type="radio" name="series" value="Friends"> Friends</label><br>
        <br>
        <input type="submit" value="Vote">
    </form>
</body>
</html>

