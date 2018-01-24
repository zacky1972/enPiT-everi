$(function(){
  
  $(".item11").hide();
  $(".billboard .inner").fadeIn(1000,function(){ anim01();});
  
  function anim01(){
    $(".item11").show();
    /*
    $(".item01").animate({top : '-435px'}, 3000);
    */
    setTimeout(function(){ $(".item01").animate({top : '-435px'}, 500);}, 1000);
    setTimeout(function(){ $(".item02").animate({top : '-435px'}, 500);}, 1250);
    setTimeout(function(){ $(".item03").animate({top : '-435px'}, 500);}, 1500);
    setTimeout(function(){ $(".item04").animate({top : '-435px'}, 500);}, 1750);
    setTimeout(function(){ $(".item05").animate({top : '-435px'}, 500);}, 2000);
  }
});