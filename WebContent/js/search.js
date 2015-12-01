var map;
var geocoder = new google.maps.Geocoder;
var latlong,eveRendered=false;
google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
	var input = document.getElementById('location');
	var options = {
			types: ['(cities)'],
			componentRestrictions: {country: "us"}
	};
	var autocomplete = new google.maps.places.Autocomplete(input,options);
	GeoCode();
}

function GeoCode()
{
	var req = {
			address: document.getElementById("location").value
	};
	geocoder.geocode(req,function(results, status)
			{
		if(status == google.maps.GeocoderStatus.OK)
		{
			initMap({lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()});
			latlong = results[0].geometry.location.lat()+","+results[0].geometry.location.lng();
			var cmarker = new google.maps.Marker({
				map: map,
				position: results[0].geometry.location
			});
			if(!eveRendered)
				getEvents();
		}
		else
			window.alert("Geocoding Failed, Status :" + status);
			});

}
function rerender()
{
	eveRendered =false;
	GeoCode();
}
function initMap(latlagMap) {
	map = new google.maps.Map(document.getElementById('map'), 
			{
		center: latlagMap,
		zoom: 12
			});
}

function getEvents()
{
	var efurl1="http://api.eventful.com/json/events/search?";
	var efurl2 = "&image_sizes=block150,large&app_key=6LJMtqQNXMcq6Qdf";
	if(document.getElementById("query").value != "")
		var eventype = "q="+document.getElementById("query").value;
	else
		var eventype="";
	var loc= "&date=Future&page_size=50&where="+latlong;
	var distlim = "&within="+document.getElementById("dist").value;
	var compurl = efurl1+eventype+loc+distlim+efurl2;
	httpGetAsync(compurl,renderResults);
}

function httpGetAsync(theUrl, callback)
{
	eveRendered =true;
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
			callback(JSON.parse(xmlHttp.responseText));
	}
	xmlHttp.open("GET", theUrl, true);
	xmlHttp.send(null);
}
function renderResults(data)
{
	eveRendered =true;
	for (var i =0; i<data.events.event.length; i++)
	{
        var evedet = {
                lat: Number(data.events.event[i].latitude),
                lng: Number(data.events.event[i].longitude),
                title: data.events.event[i].title,
                address: data.events.event[i].venue_address
        }
       createMarker(evedet);
	}
}

function createMarker(evedet){
	var pmarker = new google.maps.Marker({
		map: map,
		label: evedet.title,
		title: evedet.title,
		position: {lat: evedet.lat, lng: evedet.lng}
	});	
}