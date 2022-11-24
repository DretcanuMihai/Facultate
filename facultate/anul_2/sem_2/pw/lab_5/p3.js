const m = 4;
const n = 4;
let number_matrix;
let photo_links;
let revealed = [];
let wait = false;
$(document).ready(function () {
    number_matrix = create_matrix(m, n);
    photo_links = create_photos();
    create_table(m, n);
})

function create_photos() {
    return ["https://www.cs.ubbcluj.ro/wp-content/uploads/Czibula-Istvan.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Czibula-Gabriela.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Boian-Rares-133x100.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Suciu-Mihai.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Bufnea-Darius.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Mursa-Bogdan.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Suciu-Dan.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Diana-Miholca.jpg",
        "https://www.cs.ubbcluj.ro/wp-content/uploads/Grigoreta-Cojocar.jpg"];
}

function create_bucket(nr) {
    let bucket = [];
    for (let i = 0; i < nr; i++) {
        bucket.push(Math.floor(i / 2));
    }
    return bucket;
}

function create_matrix(m, n) {
    let bucket = create_bucket(m * n);
    let matrix = [];
    for (let i = 0; i < m; i++) {
        let row = [];
        for (let j = 0; j < n; j++) {
            let randomIndex = Math.floor(Math.random() * bucket.length);
            row.push(bucket.splice(randomIndex, 1)[0]);
        }
        matrix.push(row);
    }
    return matrix;
}

function create_table(m, n) {
    let table = $('<table>');
    for (let i = 0; i < m; i++) {
        let row = $('<tr>');
        for (let j = 0; j < n; j++) {
            let cell = $('<td>');
            cell.click(e => {
                if(cell.html()===""){
                    select(e.target);
                }
            });
            row.append(cell);
        }
        table.append(row);
    }
    $('body').append(table);
}

function select_number(jcell) {
    let row = jcell.parent().index();
    let column = jcell.index();
    jcell.html(number_matrix[row][column]);
    return jcell
}

function select_photo(jcell) {
    let row = jcell.parent().index();
    let column = jcell.index();
    let number = number_matrix[row][column];
    let link = photo_links[number];
    jcell.append($('img').attr('src',link).attr('alt',number.toString()));
    return jcell
}

function select(cell) {
    if (wait) {
        return;
    }
    cell=$(cell);
    select_number(cell);
    //select_photo(cell);
    revealed.push(cell);
    if (revealed.length % 2 === 0) {
        let last1 = revealed[revealed.length - 1];
        let last2 = revealed[revealed.length - 2];
        if (last1.html() !== last2.html()) {
            wait = true;
            revealed.pop();
            revealed.pop();
            setTimeout(function () {
                wait = false;
                last1.html("");
                last2.html("");
            }, 1000);
        }
    }
    if(revealed.length===m*n){
        setTimeout(function () {
            alert("Congratulations! You won!");
        }, 0);
    }
}