# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('#tag_input').inputosaurus
    width : '250px'

  $('.show-comments').on 'click', (e) ->
    comments_container = $(this).siblings('.comments_container')
    spinner = $(this).siblings('.spinner')

    e.preventDefault()
    spinner.show()
    $(this).hide()

    $.get $(this).data('url'), (comments) ->
      comments.forEach (comment) ->
        newComment = Mustache.render $('#comment-template').html(), comment
        $(newComment).appendTo(comments_container)
      comments_container.slideDown()
      spinner.hide()

  # filter by tag
  $('#tagfilter').keyup ->
    $('.post').show()
    tagList = $('#tagfilter').val()
                            .toLowerCase()
                            .split(/[\s,]+/)
    for tag in tagList
      negative = (tag.charAt(0) == '-')
      tag = tag.slice(1) if negative
      $('.post').filter ->
        indexOfTag = $('p.taglist', this).html().indexOf(tag)
        if negative then indexOfTag > 0 else indexOfTag < 0
      .hide()

