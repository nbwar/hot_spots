var guages = [];
var sortedVenues;
setInterval(function() {
  $.ajax({
    url: '/api/venues',
    method: 'get'
  }).done(function(response) {
    $.each(response.venues, function(index, value) {
      if($("#" + value.id).size() === 0){
        $('.guages').append("<div id='" + value.id + "' class='guage'></div>");
        console.log();
        var g = new JustGage({
            id: value.id,
            value: parseInt(value.histogram * 100),
            min: 0,
            max: 100,
            title: value.name,
            label: "Hotness",
            levelColorsGradient: false
        });

        guages.push(g);
      };

      guages[index].refresh(parseInt(value.histogram * 100));
      if(parseInt(value.histogram * 100) === 0) {
        guages[index].refresh(getRandomInt(0,10));

      }

    });

    //leaderboard
    sortedVenues = response.venues.sort(SortByCheckins);
    $("#board").empty();
    $.each(sortedVenues, function(index, value) {
      if (index === 0) {
        $("#board").append("<div class='top'>"+(index+1)+". "+value.name+": "+ "<span class='count'>" +value.checkin_count+" check-ins</span></div>")
      } else if (index === 1) {
        $("#board").append("<div class='second'>"+(index+1)+". "+value.name+": "+ "<span class='count'>" +value.checkin_count+" check-ins</span></div>")
      } else if (index === 2) {
        $("#board").append("<div class='third'>"+(index+1)+". "+value.name+": "+ "<span class='count'>" +value.checkin_count+" check-ins</span></div>")
      } else {
        $("#board").append("<div>"+(index+1)+". "+value.name+": "+ "<span class='count'>" +value.checkin_count+" check-ins</span></div>")
      }
    });
    $('.top').burn();
  });
}, 500 )

function SortByCheckins(a, b){
  var aCheckins = a.checkin_count;
  var bCheckins = b.checkin_count;
  return ((aCheckins < bCheckins) ? 1 : ((aCheckins > bCheckins) ? -1 : 0));
}
