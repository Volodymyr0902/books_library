$(document).ready(function () {
    $(".adv-hid").toggle();

    $('#search').click(function () {
        $(".adv-hid").fadeToggle()
    })

    $("body").click(function () {
        $(".adv-hid").fadeOut()
    })

    $("#search-form").click(function (e) {
        e.stopPropagation()
    })

    $(window).scroll(function () {
        $(".adv-hid").fadeOut()
    })

    $("#header").toggleClass("invisible")
})
