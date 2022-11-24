initialize();

function initialize() {
    let tables = document.getElementsByClassName("sortable");
    for (let i = 0; i < tables.length; i++) {
        let headers = tables[i].getElementsByTagName('th');
        for (let j = 0; j < headers.length; j++) {
            let header = headers[j];
            let asc = false;
            header.onclick = () => {
                asc = !asc;
                sortTable(tables[i], header, asc);
            }
        }
    }
}

function sortTable(table, header, asc) {
    if (table.rows[0].getElementsByTagName('td').length === 0) {
        sortTableHorizontal(table, header, asc);
    } else {
        sortTableVertical(table, header, asc);
    }
}

function sortTableVertical(table, header, asc) {
    let row = header.parentNode.rowIndex;
    let noColumns = table.rows[0].cells.length;
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 1; i < noColumns - 1; i++) {
            if (shouldSwap(table.rows[row].cells[i].innerHTML, table.rows[row].cells[i + 1].innerHTML) === asc) {
                sorted = false;
                swapColumns(table, i, i + 1);
            }
        }
    }
}

function swapColumns(table, i, j) {
    for (let k = 0; k < table.rows.length; k++) {
        let aux = table.rows[k].cells[i].innerHTML;
        table.rows[k].cells[i].innerHTML = table.rows[k].cells[j].innerHTML;
        table.rows[k].cells[j].innerHTML = aux;
    }
}

function sortTableHorizontal(table, header, asc) {
    let column = header.cellIndex;
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 1; i < table.rows.length - 1; i++) {
            let row1 = table.rows[i];
            let row2 = table.rows[i + 1];
            if (shouldSwap(row1.cells[column].innerHTML, row2.cells[column].innerHTML) === asc) {
                sorted = false;
                let aux = table.rows[i].innerHTML;
                table.rows[i].innerHTML = table.rows[i + 1].innerHTML;
                table.rows[i + 1].innerHTML = aux;
            }
        }
    }
}

function shouldSwap(s1, s2) {
    if (!isNaN(s1)) {
        return (Number(s1) > Number(s2));
    } else {
        return s1 > s2;
    }
}