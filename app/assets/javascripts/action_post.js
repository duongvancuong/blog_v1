function action_post(a) {
  var post_id = $(a).attr('id')
  var action_id = post_id.split("_")
  $.ajax({
    url: '/posts/' + action_id[1],
    type:'PUT',
    dataType:'json',
    data: {
      post_data: {
        action: action_id[0]
      }
    }
  })
}

$(document).ready(function() {});
