let currentIndex = null;
let myListSize = $('#carousel').first().find('li').length;
let buttonPressed = false;

$(document).ready(function () {
    display(0);
    displayNextAux();
})

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
        $('#carousel').first().find('li').eq(currentIndex).css('display','none');
    }
    currentIndex = index
    $('#carousel').first().find('li').eq(currentIndex).css('display','block');
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