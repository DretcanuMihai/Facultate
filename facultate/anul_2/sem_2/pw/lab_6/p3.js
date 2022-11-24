let selected;
initialize();

function initialize() {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("my_select").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "p3_1.php", true);
    xhttp.send();
}

function fill(xml) {
    document.getElementById("denumire").value = xml.getElementsByTagName("denumire")[0].childNodes[0].nodeValue;
    document.getElementById("cantitate").value = xml.getElementsByTagName("cantitate")[0].childNodes[0].nodeValue;
}

function turnOnButton() {
    document.getElementById("my_button").disabled = false;
}

function fillRequest() {
    let selected_text = $('#my_select option:selected').text()
    if (selected_text === selected) {
        return;
    }
    if (!document.getElementById("my_button").disabled) {
        let val = confirm("You have unsaved changes! Do you want to save?");
        if (val === true) {
            modifyRequest();
        }
    }
    selected = selected_text;
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let parser = new DOMParser();
            let xmlDoc = parser.parseFromString(this.responseText, "text/xml");
            fill(xmlDoc);
            document.getElementById("my_button").disabled = true;
        }
    };
    xhttp.open("GET", "p3_2.php?id=" + selected, true);
    xhttp.send();
}

function getForModify() {
    let request = "id=";
    request += selected;
    request += "&denumire=";
    request += document.getElementById("denumire").value;
    request += "&cantitate=";
    request += document.getElementById("cantitate").value;
    return request;
}

function modifyRequest() {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            alert("Update Successful!");
            document.getElementById("my_button").disabled = true;
        }
    };
    xhttp.open("GET", "p3_3.php?" + getForModify(), true);
    xhttp.send();
}