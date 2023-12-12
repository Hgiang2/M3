<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
</head>
<body>
<form action="/calculate" method="post">
    <br>
    <label for="description">Product description</label>
    <input type="text" name="description" id="description">
    <br>
    <br>
    <label for="price">Product price</label>
    <input type="text" name="price" id="price">
    <br>
    <br>
    <label for="discount">Discount percent</label>
    <input type="text" name="discount" id="discount">
    <br>
    <br>

    <button type="submit">Calculate</button>
</form>
</body>
</html>