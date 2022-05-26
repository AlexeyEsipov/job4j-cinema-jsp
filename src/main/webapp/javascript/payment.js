"use strict";

function validate() {
    const username = $('#username').val();
    const phone = $('#phone').val();
    const email = $('#email').val();
    let alertMessage = "";
    if (username === "") {
        alertMessage = "Нужно заполнить имя\n";
    }
    if (phone === "") {
        alertMessage += "Нужно указать телефон\n";
    }
    if (email === "") {
        alertMessage += "Нужно указать электронную почту";
    }
    if (alertMessage !== "") {
        alert(alertMessage);
        return false;
    }
    return true;
}

function preparePage() {
    window.onload = function () {
        let params = new URLSearchParams(location.search);
        let row = params.get("row");
        let column = params.get("column");
        let p = document.createElement("p");
        p.innerText = "Вы выбрали ряд " + row + " место " + column + ", Сумма : 500 рублей.";
        document.getElementById("mainHeader").append(p);
        let mainForm = document.getElementById("mainForm");
        mainForm.action = context + "/pay";
        let hiddenInputRow = document.getElementById("row");
        hiddenInputRow.value = row;
        let hiddenInputCol = document.getElementById("column");
        hiddenInputCol.value = column;
    }
}
preparePage();