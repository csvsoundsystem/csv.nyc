(function(d){
    var flash = function(i, bpm) {
        // Lights to the beat (1874 rows/beats)
        var j = (i + 1) % 4
        d.body.style['background-color'] = ['#8F8', '#FF8', '#8FF', '#F8F'][j]
        setTimeout(function() {
            flash(j, bpm)
        }, 60000 / bpm)
    }

    var go = function() {
        // Start the flashing
        if (!d.body.style['background-color']) {
            flash(0, 80)
        }
    }

    // Apply the flashing
    d.body.addEventListener('click', go)
    d.body.addEventListener('touchend', go)

    // Add the sticker if it's not already there
    if (!d.getElementById('csv-sticker')) {
        d.body.innerHTML += '<img src="csvsoundsystem.png" alt="CSV Soundsystem" id="csv-sticker" style="position: absolute; right: 50; top: 10;" />'
    }
})(document)
