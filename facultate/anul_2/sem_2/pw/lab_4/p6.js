const m = 5;
const n = 5;
let number_matrix = create_matrix(m, n);
let active_cell = 0;
let number_of_generated_moves = 1000;
let table = create_table(m, n);
do {
    randomize(number_of_generated_moves);
} while (isSolved());
document.addEventListener('keydown', onButtonPress);

function onButtonPress(e) {
    switch (e.key) {
        case "ArrowUp":
            move_square(0);
            break;
        case "ArrowRight":
            move_square(1);
            break;
        case "ArrowDown":
            move_square(2);
            break;
        case "ArrowLeft":
            move_square(3);
            break;
    }
    if(isSolved()){
        setTimeout(function () {
            alert("Congratulations! You won!");
            document.removeEventListener('keydown',onButtonPress);
        }, 0);
    }
}

function isSolved() {
    let index = 1;
    for (let i = 0; i < m; i++) {
        for (let j = 0; j < n; j++) {
            if (index !== number_matrix[i][j]) {
                if(i === m - 1 && j === n - 1){

                }
                else{
                    return false;
                }
            }
            index+=1;
        }
    }
    return true;
}

function randomize(number) {
    /*
    let move = Math.floor(Math.random() * 4);
    move_square(move);
    alert(move);
    setTimeout(function () {
        randomize(number - 1)
    }, 1000);*/
    for (let i = 0; i < number; i++) {
        let move = Math.floor(Math.random() * 4);
        move_square(move);
    }
}

function get_row(type) {
    switch (type) {
        case 0:
            return -1;
        case 2:
            return 1;
        default:
            return 0;
    }
}

function get_column(type) {
    switch (type) {
        case 1:
            return 1;
        case 3:
            return -1;
        default:
            return 0;
    }
}

function move_square(type) {
    let row = active_cell.parentNode.rowIndex;
    let column = active_cell.cellIndex;
    let new_row = row + get_row(type);
    let new_column = column + get_column(type);
    if (new_row < 0 || new_row >= m || new_column < 0 || new_column >= n) {

    } else {
        let aux = number_matrix[row][column];
        number_matrix[row][column] = number_matrix[new_row][new_column];
        number_matrix[new_row][new_column] = aux;
        aux = table.rows[row].cells[column].innerHTML;
        table.rows[row].cells[column].innerHTML = table.rows[new_row].cells[new_column].innerHTML;
        table.rows[new_row].cells[new_column].innerHTML = aux;
        active_cell = table.rows[new_row].cells[new_column];
    }
}

function create_matrix(m, n) {
    let matrix = [];
    for (let i = 0; i < m; i++) {
        let row = [];
        for (let j = 0; j < n; j++) {
            row.push(i * m + j + 1);
        }
        matrix.push(row);
    }
    matrix[m - 1].pop();
    matrix[m - 1].push(0);
    return matrix;
}

function create_table(m, n) {
    let table = document.createElement('table');
    for (let i = 0; i < m; i++) {
        let row = table.insertRow();
        for (let j = 0; j < n; j++) {
            let cell = row.insertCell();
            cell.innerHTML = number_matrix[i][j];
            if (i === m - 1 && j === n - 1) {
                cell.innerHTML = "";
                active_cell = cell;
            }
        }
    }
    document.body.appendChild(table);
    return table;
}