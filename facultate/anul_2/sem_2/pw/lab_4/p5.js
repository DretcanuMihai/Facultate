let myList = document.getElementById("carousel");
let items = myList.getElementsByTagName("li")
let currentIndex = null;
let myListSize = items.length;
let buttonPressed = false;
display(0);
displayNextAux();

function displayPrevious() {
    buttonPressed=true;
    let aux = currentIndex - 1;
    if (aux === -1) {
        aux = myListSize - 1;
    }
    display(aux);
}

function displayNext() {
    buttonPressed=true;
    let aux = (currentIndex + 1) % myListSize;
    display(aux);
}
function displayNextNoReset() {
    displayNext();
    buttonPressed=false;
}

function display(index) {
    if (currentIndex != null) {
        items[currentIndex].style.display = "none";
    }
    currentIndex = index
    items[currentIndex].style.display = "block";
}

function displayNextAux() {
    if (buttonPressed === false) {
        displayNextNoReset();
    }
    buttonPressed=false;
    setTimeout(function () {
        displayNextAux();
    }, 3000);
}