/**
 * @author 愚人码头
 */
(function($){
	$.fn.imgTxtCut=function(options){
		var opts = $.extend({},$.fn.imgTxtCut.deflunt,options);
		var targetObj=$(this).find("li");
		var targetObjH=$(this).find("li img").height()
		return this.each(function() {
			$.fn.imgTxtCut.effect[opts.effects](targetObj,targetObjH,opts);
			
    	});
	};
	$.fn.imgTxtCut.effect = {
		flaser:function(targetObj,targetObjH,opts){
			targetObj.hover(function(){
				$(this).find('img').stop().animate({height:"0"}, opts.speed);
			},function(){
				$(this).find('img').stop().animate({height:targetObjH},opts.speed);
			})
		},
		scroll:function(targetObj,targetObjH,opts){
			targetObj.hover(function(){
				$(this).find('.scrool-box').stop().animate({top:-targetObjH}, opts.speed);
			},function(){
				$(this).find('.scrool-box').stop().animate({top:0},opts.speed);
			})
		},
		fade:function(targetObj,targetObjH,opts){
			targetObj.hover(function(){
				$(this).find('.imgBox').stop().animate({opacity:0.1}, opts.speed);
			},function(){
				$(this).find('.imgBox').stop().animate({opacity:1},opts.speed);
			})
		}
	};
	$.fn.imgTxtCut.deflunt={
		effects : "flaser",
		speed : "normal"
	};
})(jQuery);
