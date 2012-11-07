$(->
  main()
)

main = ->
  load_image('images/example.jpg')
  ajaxer() # do the first request
  poll() # start polling

poll = ->
  setTimeout(->
    ajaxer() # do a request
    poll() # call itself
  , 30000)

ajaxer = ->
  #url: '/images'
  $.ajax
    method: 'get'
    url: '/random_images'
    success: (data)->
      load_image JSON.parse(data).images[0]

load_image = (url)->
  if $('#pictures img').length > 0
    $('#pictures img').fadeOut 2000, ->
      $(this).remove()
      loader(url)
  else
    loader(url)

loader = (url)->
  img = new Image()
  $(img).hide()
  $(img).load(->
    $('#pictures').append $(img)
    $(img).fadeIn(2000)
  ).attr('src', "booth/#{url}")
