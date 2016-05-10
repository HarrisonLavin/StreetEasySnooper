$(function(){

    $('input#welcome').on("click", function(event){
      $.get("/outbound")
    })


}) 


