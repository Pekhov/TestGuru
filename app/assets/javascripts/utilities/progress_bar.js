document.addEventListener('turbolinks:load', function() {
    var progress = document.getElementById('progress')
    if (progress) {
        progress.value = progress.dataset.progressPercent
    }
})
