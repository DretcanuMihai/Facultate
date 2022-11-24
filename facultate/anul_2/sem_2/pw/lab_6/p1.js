function changeRoutesBase() {
    var string = $('#start option:selected').text();
    changeRoutes(string);
}

function changeRoutes(string) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("finish").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "p1.php?string=" + string, true);
    xhttp.send();
}