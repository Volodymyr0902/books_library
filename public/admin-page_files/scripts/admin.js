$(document).ready(async function () {
    //-------HANDLE-LOGOUT------//
    $("#logout").on("click", async function () {
        await fetch("/admin/api/v1/logout", {
            headers: {'Authorization': btoa('fake:fake')}
        });
        window.location.href = 'http://localhost:8080/api/v1'
    })

    //------DELETE-BOOK-----//
    $(".del-link").on("click", async function (e) {
        const delResponse = await fetch("/admin/api/v1/" + e.target.dataset.id, {method: "DELETE"})
        const delResult = await delResponse.json();

        if (delResult.ok) {
            $(this).parent().parent().remove();
        } else {
            alert("Failed to delete book")
        }
    })

    //------SHOW-LOADED-IMAGE----//
    $("#new-img-input").on("change", function (e) {
        const file = e.target.files[0];

        if (file) {
            $("#new-img img").attr("src", URL.createObjectURL(file))
            $("#new-img").removeClass("d-none").addClass("d-flex justify-content-center")
        } else {
            $("#new-img img").attr("src", "")
            $("#new-img").removeClass("d-flex").addClass("d-none")
        }
    })

    // -------DEFINE-PAGES-LINKS------//
    const queryParams = new URLSearchParams(window.location.search)
    const currentOffset = +queryParams.get('offset') || 0
    const pages = $("#table-wrapper").data('pages')

    $("#page-curr a").attr("href", window.location.href)

    queryParams.set("offset", String(currentOffset - 1))
    $("#page-prev a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams)

    queryParams.set("offset", String(currentOffset + 1))
    $("#page-next a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams);

    queryParams.set("offset", '0')
    $("#page-first a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams)

    queryParams.set("offset", pages)
    $("#page-last a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams)

    //-----DISPLAY-BODY----//
    $("body").toggleClass("visually-hidden")
})