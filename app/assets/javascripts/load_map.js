function load_map(){
     addr=$("#user_address").val()+','+$("#user_city").val()+','+
          $("#user_state").val()+','+$("#user_country").val()+','+
          $("#user_zip").val();
     $.ajax({
       data: {"address":addr},
       url: "/users/coords",
       type: "get",
       dataType: "json",
       success: function(data, textStatus, xhr) {
           if (!($('#map-content').is(':empty'))){
               $("#map").remove()
           }
           if(data.coords) {
             var coords=data.coords
             $("#map-content").append("<div id='map'></div>")
             gmap_show(coords);
           } 
       }
     })
}
