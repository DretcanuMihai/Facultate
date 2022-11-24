$(document).ready(function () {
    initialize();
})


function initialize() {
    $('.sortable').each(function () {
        let table=$(this);
        $(this).find('th').each(function () {
            let asc = false;
            let header=$(this);
            $(this).click(() => {
                asc = !asc;
                sortTable(table, header, asc);
            })
        });
    });
}

function sortTable(table, header, asc) {
    if (table.find('tr').first().find('td').length === 0) {
        sortTableHorizontal(table, header, asc);
    } else {
        sortTableVertical(table, header, asc);
    }
}

function sortTableVertical(table, header, asc) {
    let row = header.parent();
    let noColumns = table.find('tr').first().children().length;
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 1; i < noColumns - 1; i++) {
            if (shouldSwap(row.children().eq(i).html(), row.children().eq(i+1).html()) === asc) {
                sorted = false;
                swapColumns(table, i, i + 1);
            }
        }
    }
}

function swapColumns(table, i, j) {
    table.find('tr').each(function(){
        let aux= $(this).children().eq(i).html();
        $(this).children().eq(i).html($(this).children().eq(j).html());
        $(this).children().eq(j).html(aux);
    });
}

function sortTableHorizontal(table, header, asc) {
    let column = header.index();
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 1; i < table.find('tr').length - 1; i++) {
            let row1 = table.find('tr').eq(i);
            let row2 = table.find('tr').eq(i+1);
            if (shouldSwap(row1.find('td').eq(column).html(), row2.find('td').eq(column).html()) === asc) {
                sorted = false;
                let aux = row1.html();
                row1.html(row2.html());
                row2.html(aux);
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