function attributeSelected() {
    let string = $('#my_select option:selected').text();
    let result = ""
    if (string === "Memorie" || string === "CapacitateHDD") {
        result += "<input id='my_input' type='number'>";
    } else {
        result += "<input id='my_input' type='text'>";
    }
    result += "<button onclick='request()'>Submit</button>"
    document.getElementById("my_div").innerHTML = result;
}

function request() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("my_table").innerHTML=this.responseText;
        }
    };
    let attr = $('#my_select option:selected').text();
    let value = $("#my_input").val();
    xhttp.open("GET", "p6.php?attr=" + attr + "&value=" + value, true);
    xhttp.send();
}