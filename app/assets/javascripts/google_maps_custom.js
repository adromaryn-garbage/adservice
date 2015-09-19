function gmap_show(coords) {
  if ((coords[0] == null) || (coords[1] == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "lat": coords[0], 
        "lng": coords[1],
        "picture": {
          "url": 'http://www.google.com/mapfiles/marker.png',
          "width":  32,
          "height": 32
        }
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}
                                                
