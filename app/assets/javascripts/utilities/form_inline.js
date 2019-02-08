document.addEventListener('turbolinks:load', function() {
    // var controls = document.querySelectorAll('.form-inline-link')
    // if (controls.length) {
    //     for (var i = 0; i < controls.length; i++) {
    //         controls[i].addEventListener('click', formInLineLinkHandler)
    //     }
    // }
    $('.form-inline-link').on('click', formInLineLinkHandler)

    var errors = document.querySelector('.resource-errors')
    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInLineHandler(resourceId)
    }
})

function formInLineLinkHandler(event) {
    event.preventDefault()
    var testId = this.dataset.testId
    formInLineHandler(testId)
}

function formInLineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId +'"]')
    // var testTitle = document.querySelector('.test-title[data-test-id="' + testId +'"]')
    // var formInLine = document.querySelector('.form-inline[data-test-id="' + testId +'"]')

    var $testTitle = $('.test-title[data-test-id="' + testId +'"]')
    var $formInLine = $('.form-inline[data-test-id="' + testId +'"]')

    // if (formInLine.classList.contains('hide')) {
    //     testTitle.classList.add('hide')
    //     formInLine.classList.remove('hide')
    //     link.textContent = 'Cancel'
    // } else {
    //     testTitle.classList.remove('hide')
    //     formInLine.classList.add('hide')
    //     link.textContent = 'Edit'
    // }
    $formInLine.toggle()
    $testTitle.toggle()
    console.log($formInLine)
    if (!$formInLine.length) {
        if ($formInLine.is(':visible')) {
            link.textContent = 'Cancel'
        } else {
            link.textContent = 'Edit'
        }
    }
}
