/*
enPiT-Pro
*/


var gFBroot = document.createElement("div");
gFBroot.setAttribute("id", "fb-root");
document.getElementsByTagName("body")[0].appendChild(gFBroot); 


$(function(){



/* header fixed */
/*
var gm_nav = $('.gm'), gm_offset = gm_nav.offset();
	$(window).scroll(function () {
	if($(window).scrollTop() > gm_offset.top) { gm_nav.addClass('gm_fixed'); } else { gm_nav.removeClass('gm_fixed'); }
});
*/ 

/* smart gm */
var smflag = false;
var $sm_navi = $('#sm-menu');
$sm_navi.on('click',function(){
		console.log("click");
  smflag = true;
  $('.gm').slideToggle(100);
});
$('.gm').on('click',function(){
  if (smflag){ $('.gm').slideToggle(100);}
});

/* anchor jump */
$('a[href*="#"]').on('click',function() {
	if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
		var $target = jQuery(this.hash);
		$target = $target.length && $target || jQuery('[name=' + this.hash.slice(1) +']');
		if ($target.length) {
			var targetOffset = $target.offset().top - 50;
			jQuery('html,body').animate({ scrollTop: targetOffset }, 1200, 'easeOutQuint'); /*quate */
			return false;
		}
	}
});

/* image rollover */
$('a img').on({
'mouseenter' : function(){ $(this).stop().animate({'opacity' : '0.6'}, 300); },
'mouseleave' : function(){ $(this).stop().animate({'opacity' : '1'}, 600); }
});

//外部リンク
	$('a[href^="http"]').not('[href*="enpit"]').each(function(){
		$(this).attr("target","_blank");
	});

/* document link */
$('a[href$=".pdf"],a[href$=".docx"]').each(function(){
		$(this).attr("target","_blank");
	});



$('.disabled').on('click',function(){
return false;
});

// active menu check
var location = "html"+window.location.pathname;
if (location.slice(-1) === "/"){ location += "index";}
$('a[data-active]').each(function(){
	var val = ($(this).data('active') == undefined)?$(this).data('active'):$(this).attr('href');
	if (location.indexOf(val)!=-1){ $(this).addClass('active'); }
});

        
});// end jQuery

jQuery.easing.quart = function (x, t, b, c, d) {
    return -c * ((t=t/d-1)*t*t*t - 1) + b;
};