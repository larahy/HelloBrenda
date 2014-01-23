# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('#tag_input').inputosaurus
    width : '250px'

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