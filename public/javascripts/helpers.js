function formatDate(timestamp) {
    return timestamp.match("(.+)T")[1];
}

function blankIfNull(data) {
    if(data == null) {
        return '';
    } else {
        return data;
    }
}