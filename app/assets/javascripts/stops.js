$(function(){
  
  $("body#stops.show").find("#map").each(function() {
    var container     = $(this),
        stationLatLng = new L.LatLng( container.data("lat"), container.data("lon") ),
        map           = new L.Map('map');
    
    map.setView( stationLatLng, 13).addLayer(
      new L.TileLayer("http://otile1.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png", {
        maxZoom: 18, 
        attribution: 'Tiles Courtesy of <a href="http://www.mapquest.com/" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png">'
      })
    ).addLayer( new L.Marker(stationLatLng));
  });

});