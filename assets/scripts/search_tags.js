search_box = document.getElementById('search');
search_box.onkeyup = function() {
    results = 0;
    tags = document.getElementsByTagName('li');
    for (tag of tags) {
        if (tag.getElementsByTagName('a')[0].innerHTML.toLowerCase().includes(
                search_box.value.toLowerCase().replace(/\s{2,}/g, ' ').trim()
            )) {
                tag.style.display = 'inline-block';
                results++;
        } else {
            tag.style.display = 'none';
        }
    }
    if (results == 0) {
        document.getElementById('no-results').style.display = 'block';
    } else {
        document.getElementById('no-results').style.display = 'none';
    }
}