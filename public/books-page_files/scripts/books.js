const queryParams = new URLSearchParams(window.location.search)

queryParams.set("offset", String(+queryParams.get("offset") + 1))
$(".page-next a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams);

queryParams.set("offset", String(+queryParams.get("offset") - 2))
$(".page-prev a").attr("href", window.location.origin + window.location.pathname + "?" + queryParams);