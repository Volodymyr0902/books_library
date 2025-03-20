$(document).ready(async function () {
        const options = {
            method: 'POST',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({action: "view"})
        }

        await fetch(window.location.href, options)
    }
)

$('.btnBookID').click(async function () {
        const options = {
            method: 'POST',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({action: "click"})
        }

        const res = await fetch(window.location.href, options)
        const data = await res.json();

        $(".modal-stat p:last-of-type").text(data.clicks + " people also want to read this book...")
        $(".modal-container").css("display", "block");
    }
);

$(".modal-container").click(function () {
    $(".modal-container").css("display", "none");
})

$(".modal-stat").click(function (e) {
    e.stopPropagation()
})
