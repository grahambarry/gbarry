# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery

$ ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true
$ ->
  $('#pictureframes').imagesLoaded ->
    $('#pictureframes').masonry
      itemSelector: '.box'
      isFitWidth: true

$ ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_pins_url = $('.pagination a[rel=next]').attr('href')
      if more_pins_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          $('.pagination').html("")
          $.ajax
            url: more_pins_url
            success: (data) ->
              $("#pins").append(data)
      if !more_pins_url
        $('.pagination').html("")
     return
$ ->
  $('.tn img').on('click')
  $("#mainpic#frame-flipper img").attr('src', $(this).attr('src'));