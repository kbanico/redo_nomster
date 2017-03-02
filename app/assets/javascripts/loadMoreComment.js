$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status,
xhr) {
      var photoId = $(this).data("photo-id");
      $("#comments_" + photoId).html(data);
      $("#comments-paginator-" + photoId).html("<a id='more-comments' data-post-id=" + photoId + "data-type='html' data-remote='true' href='/photo/" +photoId + "/comments>show more comments</a>");
}); });
});
