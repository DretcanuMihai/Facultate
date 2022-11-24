function getPath(item) {
    let result = ""
    let currentItem = item;
    let currentText = currentItem.innerHTML;
    while (currentText !== ".") {
        result = "/" + currentText + result;
        currentItem = currentItem.parentNode.parentNode.parentNode.firstElementChild;
        currentText = currentItem.innerHTML;
    }
    result = "." + result;
    return result;
}

function request(listItem) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let parent = listItem.parentNode;
            parent.innerHTML += this.responseText;
            parent.firstElementChild.onclick = function () {
                parent.innerHTML = parent.firstElementChild.outerHTML;
            };
        }
    };
    xhttp.open("GET", "p5.php?url=" + getPath(listItem), true);
    xhttp.send();
}