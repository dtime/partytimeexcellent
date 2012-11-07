$(->
  main()
)

main = ->
  load_image('images/example.jpg')

load_image = (url)->
  $('#pictures img').fadeOut 2000, ->
    $(this).remove()

    img = new Image()
    $(img).hide()
    $(img).load(->
      $('#pictures').append $(img)
      $(img).fadeIn(2000)
    ).attr('src', url)
