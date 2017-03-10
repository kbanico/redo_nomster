App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #alert(data.username)
    unless data.content.blank?

      $("#message-content").append '<div class="panel-body body-panel">' +
                  '<ul class="chat">' +
                      '<li class="left clearfix"><span class="chat-img pull-left">' +
                          '<img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="rounded-circle" />' +
                      '</span>' +
                          '<div class="chat-body clearfix">' +
                              '<div class="header">' +
                                  '<strong class="primary-font">' + data.username + '</strong> <small class="pull-right text-muted">' +
                                      '<i class="fa fa-clock-o" aria-hidden="true"></i>' +  data.time + ' ago' + '</small>' +
                              '</div>' +
                              '<p class="wrap">' +
                                  data.content +
                              '</p>' +
                          '</div>' +
                      '</li>' +

                  '</ul>' +
              '</div>'

 $(document).on 'turbolinks:load', ->
  submit_message()




submit_message = () ->
  $("#message_content").on "keydown", (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $("input").click()
      event.target.value = ""
      event.preventDefault()

