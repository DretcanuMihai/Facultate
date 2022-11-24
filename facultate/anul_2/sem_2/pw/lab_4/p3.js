const m = 4;
const n = 4;
let number_matrix = create_matrix(m, n);
let photo_links = create_photos();
create_table(m, n);
let revealed = [];
let wait = false;

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
        bucket.push(Math.floor(i/2));
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
    let table = document.createElement('table');
    for (let i = 0; i < m; i++) {
        let row = table.insertRow();
        for (let j = 0; j < n; j++) {
            let cell = row.insertCell();
            cell.onclick = e => {
                select(e.target);
            }
        }
    }
    document.body.appendChild(table);
}

function select_number(cell) {
    let row = cell.parentNode.rowIndex;
    let column = cell.cellIndex;
    cell.innerHTML = number_matrix[row][column];
    cell.onclick = () => {
        return false;
    };
}

function select_photo(cell) {
    let row = cell.parentNode.rowIndex;
    let column = cell.cellIndex;
    let number = number_matrix[row][column];
    let link = photo_links[number];
    cell.innerHTML = '<img src="' + link + '" alt="' + number + '">';
    cell.onclick = () => {
        return false;
    };
}

function select(cell) {
    if (wait) {
        return;
    }
    select_number(cell);
    //select_photo(cell);
    revealed.push(cell);
    if (revealed.length % 2 === 0) {
        let last1 = revealed[revealed.length - 1];
        let last2 = revealed[revealed.length - 2];
        if (last1.innerHTML !== last2.innerHTML) {
            wait = true;
            revealed.pop();
            revealed.pop();
            last1.onclick = e => {
                select(e.target);
            }
            last2.onclick = e => {
                select(e.target);
            }
            setTimeout(function () {
                wait = false;
                last1.innerHTML = "";
                last2.innerHTML = "";
            }, 1000);
        }
    }
    if(revealed.length===m*n){
        setTimeout(function () {
            alert("Congratulations! You won!");
        }, 0);
    }
}