"use strict";

function validate() {
    let radioId = "";
    let radioButton;
    for (let row = 1; row <= rowNum; row++) {
        for (let column = 1; column <= colNum; column++) {
            radioId = "radior" + row + "c" + column;
            radioButton = document.getElementById(radioId);
            if (radioButton !== null && radioButton.checked === true) {
                let place = {};
                place.row = row;
                place.column = column;
                return place;
            }
        }
    }
    return null;
}

function goToPayment() {
    let place = validate();
    if (place !== null) {
        let row = place.row;
        let column = place.column;
        window.location.assign("payment.jsp" + "?row=" + row + "&column=" + column);
    } else {
        alert("Выберите место");
    }
}

function getTickets() {
    return $.ajax({
        type: 'GET',
        url: context + '/hall',
        dataType: 'json'
    })
}

function reDrawHall() {
    window.onload = getTickets().done(function (data) {
        let places = [];
        let usedPLaces = [];
        let usedCount = 0;
        let tdId;
        for (let row = 1; row <= rowNum; row++) {
            for (let column = 1; column <= colNum; column++) {
                tdId = "r" + row + "c" + column;
                places.push(tdId);
            }
        }
        for (let ticket of data) {
            let row = ticket.row.toString();
            let col = ticket.col.toString();
            let tdId = "r" + row + "c" + col;
            usedPLaces.push(tdId);
        }
        for (let i = 0; i < places.length; i++) {
            let td = document.getElementById(places[i]);
            while (td.firstChild) {
                td.removeChild(td.firstChild);
            }
            if (usedPLaces.includes(places[i])) {
                let span = document.createElement("span");
                span.innerText = "Продано";
                span.className = "badge badge-warning m-2";
                td.appendChild(span);
                usedCount++;
            } else {
                let span = document.createElement("span");
                span.innerText = "Купить";
                span.className = "badge badge-success m-2";
                let input = document.createElement("input");
                input.type = "radio";
                input.id = "radio" + places[i];
                input.name = "place";
                td.append(span);
                td.append(input);
            }
        }
        let payButton = document.getElementById("payButton");
        payButton.disabled = usedCount === places.length;
    })
}
reDrawHall();
setInterval(reDrawHall, 15000);