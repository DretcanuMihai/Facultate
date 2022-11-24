let current_page = 0;
changePage(0);

function previous() {
    current_page--;
    changePage(current_page);
}

function next() {
    current_page++;
    changePage(current_page);
}

function changePage(index) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("my_table").innerHTML = this.responseText;
            document.getElementById("prev_bt").disabled = current_page === 0;
            setNext();
        }
    };
    xhttp.open("GET", "p2.php?page_index=" + index, true);
    xhttp.send();
}

function setNext() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("next_bt").disabled = this.responseText === "";
        }
    };
    let aux = current_page + 1;
    xhttp.open("GET", "p2.php?page_index=" + aux, true);
    xhttp.send();
}