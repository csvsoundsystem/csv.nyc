var flash = function(i, bpm) {
    // Lights to the beat (1874 rows/beats)
    var j = (i + 1) % 4
    document.body.style['background-color'] = ['#8F8', '#FF8', '#8FF', '#F8F'][j]
    setTimeout(function() {
        flash(j, bpm)
    }, 60000 / bpm)
}

document.body.addEventListener('click', function() {
    flash(0, 80)
})
