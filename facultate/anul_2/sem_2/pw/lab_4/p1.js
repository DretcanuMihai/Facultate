function change(source, destination) {
    const src = document.getElementById(source);
    const selectedItem = src.options[src.selectedIndex];
    const dest = document.getElementById(destination);
    dest.add(selectedItem);
}