(function(){
    var flash = function(i, bpm) {
        // Lights to the beat (1874 rows/beats)
        var j = (i + 1) % 4
        document.body.style['background-color'] = ['#8F8', '#FF8', '#8FF', '#F8F'][j]
        setTimeout(function() {
            flash(j, bpm)
        }, 60000 / bpm)
    }

    var go = function() {
        // Start the flashing
        if (!document.body.style['background-color']) {
            flash(0, 80)
        }
    }

    // Apply the flashing
    document.body.addEventListener('click', go)
    document.body.addEventListener('touchend', go)

    // Add the sticker
    document.body.innerHTML += '<a href="http://csvsoundsystem.com" target="_blank"><img src="http://csvsoundsystem.com/csvsoundsystem.png" alt="CSV Soundsystem" id="csv-sticker" style="position: absolute; right: 50px; top: 10px;" /></a>'
}).call(this)
