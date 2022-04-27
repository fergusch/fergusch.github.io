var search_box = document.getElementById('search');
search_box.focus();
search_box.onkeyup = function() {
    var search_terms = search_box.value.toLowerCase().replace(/\s{2,}/g, ' ').trim().split(' ');
    var results_len = 0;
    var tags = document.getElementsByTagName('li');
    for (var tag of tags) {
        tag_name = tag.getElementsByTagName('a')[0].innerHTML.toLowerCase();
        if (search_terms.every((word) => tag_name.includes(word))) {
            tag.style.display = 'inline-block';
            results_len++;
        } else {
            tag.style.display = 'none';
        }
    }
    if (results_len == 0) {
        document.getElementById('no-results').style.display = 'block';
    } else {
        document.getElementById('no-results').style.display = 'none';
    }
}