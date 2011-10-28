$(function(){
  
  $("body#home.index").find("#map").each(function() {
    var container     = $(this),
        center        = new L.LatLng( container.data("lat"), container.data("lon") ),
        map           = new L.Map('map');
    
    map.setView( center, 11).addLayer(
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
  });
});