document.addEventListener('turbolinks:load', function() {
    var testTimer = document.querySelector(".test-timer");

    if (testTimer) { countDown(testTimer) }
})

function countDown(timer) {
    var limitInSeconds = timer.dataset.timeLimit
    showRemainigTime(limitInSeconds, timer)

    var timerId = setInterval(function() {
        limitInSeconds--
        showRemainigTime(limitInSeconds, timer)

        if (limitInSeconds == 0) {
            clearInterval(timerId)
            alert("Time is over")
            window.location.replace(window.location + '/result')
        }
    }, 1000)
}

function showRemainigTime(seconds, timer) {
    timer.textContent = parseInt(seconds / 60) + ":" + (seconds % 60) + " until the end of the test"
}
