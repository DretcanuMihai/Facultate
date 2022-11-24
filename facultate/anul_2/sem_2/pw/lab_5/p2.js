function validate() {
    let error = "";

    const nume_camp = $("#nume").first();
    const nume = applyBlackBorder(nume_camp).val();
    if (!nume.match(/[a-z]/gi) || !nume.match(/^[ a-z]+$/gi)) {
        applyRedBorder(nume_camp);
        error += "Eroare:Numele ar trebui sa fie format din cel putin o litera si doar din litere si spatii;\n";
    }

    const data_nasterii_camp = $("#data_nasterii").first();
    const data_nasterii = applyBlackBorder(data_nasterii_camp).val();
    if (data_nasterii > new Date(1900, 1, 1)) {
        applyRedBorder(data_nasterii_camp);
        error += "Eroare:Data nasterii trebuie sa fie dupa 1900.1.1;\n";
    }

    const varsta_camp = $("#varsta").first();
    const varsta = applyBlackBorder(varsta_camp).val();

    const date_aux = new Date(data_nasterii);
    date_aux.setFullYear(date_aux.getFullYear() + parseInt(varsta))
    const ot_date_aux = new Date(Date.now());
    ot_date_aux.setFullYear(ot_date_aux.getFullYear() - 1);

    if (date_aux > Date.now() || date_aux < ot_date_aux || varsta > 100 || varsta < 1) {
        applyRedBorder(varsta_camp);
        error += "Eroare:Varsta nu corespunde datei nasterii sau nu este intre 1 si 99;\n";
    }

    const email_camp = $("#mail").first();
    const email = applyBlackBorder(email_camp).val();
    if (!email.match(/^.*[a-z]+.*[@]([a-z]+[.])+([a-z]+)$/gi) || !email.match(/^[a-z_]+[@]([a-z]+[.])+([a-z]+)$/gi)) {
        applyRedBorder(email_camp);
        error += "Eroare:Mail-ul nu este valid;\n";
    }

    if (error === "") {
        alert("Datele sunt completate corect");
    } else {
        alert(error);
    }
}

function applyBlackBorder(object) {
    object.css('borderColor', 'black');
    return object;
}

function applyRedBorder(object) {
    object.css('borderColor', 'red');
    return object;
}