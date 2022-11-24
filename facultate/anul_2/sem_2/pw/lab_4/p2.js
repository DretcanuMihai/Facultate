function validate() {
    let error = "";

    const nume_camp = document.getElementById("nume");
    const nume = applyBlackBorder(nume_camp).value;
    if (!nume.match(/[a-z]/gi) || !nume.match(/^[ a-z]+$/gi)) {
        applyRedBorder(nume_camp);
        error += "Eroare:Numele ar trebui sa fie format din cel putin o litera si doar din litere si spatii;\n";
    }

    const data_nasterii_camp = document.getElementById("data_nasterii");
    data_nasterii_camp.style.borderColor = 'black';
    const data_nasterii = data_nasterii_camp.value;
    if (data_nasterii > new Date(1900, 1, 1)) {
        applyRedBorder(data_nasterii_camp);
        error += "Eroare:Data nasterii trebuie sa fie dupa 1900.1.1;\n";
    }

    const varsta_camp = document.getElementById("varsta");
    const varsta = applyBlackBorder(varsta_camp).value;

    const date_aux = new Date(data_nasterii);
    date_aux.setFullYear(date_aux.getFullYear()+parseInt(varsta))
    const ot_date_aux=new Date(Date.now());
    ot_date_aux.setFullYear(ot_date_aux.getFullYear()-1);

    if (date_aux>Date.now() || date_aux<ot_date_aux || varsta>100 || varsta<1) {
        applyRedBorder(varsta_camp);
        error += "Eroare:Varsta nu corespunde datei nasterii sau nu este intre 1 si 99;\n";
    }

    const email_camp = document.getElementById("mail");
    const email = applyBlackBorder(email_camp).value;
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
    object.style.borderColor = 'black';
    return object;
}

function applyRedBorder(object) {
    object.style.borderColor = 'red';
    return object;
}