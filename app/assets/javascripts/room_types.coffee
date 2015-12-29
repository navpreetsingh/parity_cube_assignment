# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

    $.datepicker.setDefaults
        dateFormat: 'yy-mm-dd'
        changeMonth: true 
        changeYear: true
        yearRange: '1900:2099'        

    $(".date_pick").datepicker()