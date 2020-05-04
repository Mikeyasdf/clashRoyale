var settings = {
	"async": true,
	"crossDomain": true,
	"url": "https://qrcode-monkey.p.rapidapi.com/qr/custom?size=600&file=png&config=%257B%2522bodyColor%2522%253A%20%2522%25230277BD%2522%252C%20%2522body%2522%253A%2522mosaic%2522%257D&data=https%253A%252F%252Fwww.reddit.com%252Fr%252FClashRoyale%252F",
	"method": "GET",
	"headers": {
		"x-rapidapi-host": "qrcode-monkey.p.rapidapi.com",
		"x-rapidapi-key": "0f724aed42msh18925d7ebba9e0dp1b23dcjsn385477356fbe"
	}
}
$.ajax(settings).done(function (response) {
	console.log(response);
});