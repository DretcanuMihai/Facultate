function change(source, destination) {
    $(source+' option:selected').first().remove().appendTo(destination);
}