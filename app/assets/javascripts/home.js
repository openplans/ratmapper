$(function(){
  
  $("body#home.index").find("#map").each(function() {
    
    var positionSuccess = function (position) {
      var here = new L.LatLng(position.coords.latitude, position.coords.longitude);
      initMap(here);
    };

    var positionError = function (message) {
      var center        = new L.LatLng( "40.717304", "-73.956872" )
      initMap(center);
    };
    
    var initMap = function( center ) {
      var container = $(this),
          map       = new L.Map('map');

      map.setView( center, 17).addLayer(
        new L.TileLayer("http://otile1.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png", {
          maxZoom: 18, 
          attribution: 'Tiles Courtesy of <a href="http://www.mapquest.com/" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png">'
        })
      );

      $.getJSON( location.href, function(data){
        var geojson = new L.GeoJSON();

        geojson.on('featureparse', function(e) {
          if (e.properties && e.properties.popupContent){
            e.layer.bindPopup(e.properties.popupContent);
          }
        });

        geojson.addGeoJSON(data);
        map.addLayer(geojson);

      });
    };
    
    navigator.geolocation ? 
      navigator.geolocation.getCurrentPosition(positionSuccess, positionError) : 
      positionError('not supported');
    
    
  });
});