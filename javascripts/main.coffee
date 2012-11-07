$(->
  main()
)

main = ->
  load_image('images/example.jpg')

  poll()

poll = ->
  setTimeout(->
    console.log 'do an ajax call'
    load_image('images/example.jpg')
    poll()
  , 30000)

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
  ).attr('src', url)
