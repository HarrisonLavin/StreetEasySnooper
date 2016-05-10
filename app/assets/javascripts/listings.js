$(function(){

    $('input#welcome').on("click", function(event){
      debugger
      $('form').html("<img align='top' width=100 src='http://www.downgraf.com/wp-content/uploads/2014/09/01-progress.gif'>")
      $('form').html("Loading...")
      $.get("/outbound")
      })

    $('input').on("click", function(){
      $('#loading').append("<img align='middle' width=100 src='http://www.downgraf.com/wp-content/uploads/2014/09/01-progress.gif'>")
    })


}) 


