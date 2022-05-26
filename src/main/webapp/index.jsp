<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Бронирование мест</title>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>

    <%
        int rowNum = Integer.parseInt(request.getServletContext().getInitParameter("rowNum"));
        int colNum = Integer.parseInt(request.getServletContext().getInitParameter("colNum"));
    %>

    <script>
        let rowNum = <%=rowNum%>;
        let colNum = <%=colNum%>;
        let context = "http://" + "<%=request.getServerName()%>"
            + ":" + "<%=request.getServerPort()%>"
            + "/" + "<%=request.getServletContext().getContextPath()%>";
    </script>
    <script src="javascript/index.js"></script>
</head>
<body>
<div class="container">
    <div class="row pt-3">
        <h4 id="mainHeader">
            Бронирование мест на сеанс
        </h4>
        <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
                <th style="width: 120px;">Ряд / Место</th>
                <c:forEach var = "column" begin = "1" end = "<%=colNum%>">
                    <th><c:out value = "${column}"/></th>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <c:forEach var = "row" begin = "1" end = "<%=rowNum%>">
                <tr>
                    <th class="table-active"><c:out value = "${row}"/></th>
                    <c:forEach var = "column" begin = "1" end = "<%=colNum%>">
                        <td id='r<c:out value = "${row}"/>c<c:out value = "${column}"/>'>
                            <span class="badge badge-success">Купить</span>
                            <input type="radio" name="place" id='radior<c:out value = "${row}"/>c<c:out value = "${column}"/>'>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row float-right">
        <button type="button" class="btn btn-success" id="payButton" onclick="goToPayment()">Оплатить</button>
    </div>
</div>
</body>
</html>
