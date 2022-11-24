let userIsX = true;
let finished = false;
startGame();

function startGame() {
    waiting=true;
    create_table();
    if (Math.floor(2 * Math.random()) === 0) {
        //computer starts
        userIsX = false;
        sendToServer();
    } else {
        userIsX = true;
    }
}

function create_table() {
    let table = document.createElement('table');
    table.id = "my_table";
    for (let i = 0; i < 3; i++) {
        let row = table.insertRow();
        for (let j = 0; j < 3; j++) {
            let cell = row.insertCell();
            cell.onclick = e => {
                select(e.target);
            }
        }
    }
    document.body.appendChild(table);
}

function getTableEncoding() {
    let table = document.getElementById("my_table");
    let coding = "";
    for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
            let c = table.rows[i].cells[j].innerHTML;
            if (c === "")
                c = "-";
            coding += c;
        }
    }
    return coding;
}

function computerMoveAux(serverAnswer) {
    let row = Math.floor(serverAnswer / 3);
    let column = serverAnswer % 3;
    document.getElementById("my_table").rows[row].cells[column].innerHTML = getComputerSymbol();
    sendToServer2();
}

function sendToServer() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            if (this.responseText === "X") {
                finished = true;
                alert("X won!");
            } else if (this.responseText === "O") {
                finished = true;
                alert("O won!");
            } else if (this.responseText === "-") {
                finished = true;
                alert("Draw!");
            } else {
                computerMoveAux(this.responseText);
            }
            waiting = false;
        }
    };
    xhttp.open("GET", "p4.php?table=" + getTableEncoding(), true);
    xhttp.send();
}

function sendToServer2() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            if (this.responseText === "X") {
                finished = true;
                alert("X won!");
            } else if (this.responseText === "O") {
                finished = true;
                alert("O won!");
            } else if (this.responseText === "-") {
                finished = true;
                alert("Draw!");
            }
        }
    };
    xhttp.open("GET", "p4.php?table=" + getTableEncoding(), true);
    xhttp.send();
}

function getUserSymbol() {
    if (userIsX)
        return "X";
    else
        return "O";
}

function getComputerSymbol() {
    if (userIsX)
        return "O";
    else
        return "X";
}

function select(cell) {
    if (finished)
        return;
    if (cell.innerHTML !== "")
        return;
    cell.innerHTML = getUserSymbol();
    waiting = true;
    sendToServer();
}
