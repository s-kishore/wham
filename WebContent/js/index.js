google.maps.event.addDomListener(window, 'load', initialize);
var changecount = 0;
var currloc="";
function initialize() {
	var input = document.getElementById('location');
	var options = {
			types: ['(cities)'],
			componentRestrictions: {country: "us"}
	};
	var autocomplete = new google.maps.places.Autocomplete(input,options);
}

function locChange(){
	var x = document.getElementById("id_myloc").checked;
	if(x == true && changecount == 1)
	{
		document.getElementById("id_myloc").checked = false;
		changecount =0;
	}
}

function usecurrloc()
{
	if(currloc=="" && navigator.geolocation)
		navigator.geolocation.getCurrentPosition(onPositionUpdate);
	else
	{
		if(currloc !="")
		{
			document.getElementById("id_myloc").setAttribute("checked", true);
			document.getElementById("location").setAttribute("value",crrloc);
		}
		else
		{
			window.alert("Unable to retreive location");
			document.getElementById("id_myloc").setAttribute("checked", false)
		}
	}
}

function onPositionUpdate(position)
{
	var lat = position.coords.latitude;
	var lng = position.coords.longitude;
	reverseGeoCode(lat,lng);
}

function reverseGeoCode(lati,longi)
{
	var geocoder = new google.maps.Geocoder;
	var latlng = {lat: parseFloat(lati), lng: parseFloat(longi)};
	geocoder.geocode({'location': latlng}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
			if (results[1]) {
				document.getElementById("location").setAttribute("value",results[4].formatted_address);
				currloc =results[4].formatted_address;
				changecount=1;

			} else {
				window.alert('No results found');
			}
		} else {
			window.alert('Geocoder failed due to: ' + status);
		}
	});
}