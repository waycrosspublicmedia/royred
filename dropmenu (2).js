var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");

/* 
todo: close delay
todo: click button to open

http://www.sohtanaka.com/web-design/examples/drop-down-menu/#
http://www.noupe.com/tutorial/drop-down-menu-jquery-css.html
http://css-tricks.com/examples/DiggHeader/#
*/

(function($){
	$.fn.dropmenu = function(custom) {
		var defaults = {
		  	openAnimation: "slide",
			closeAnimation: "slide",
			openClick: false,
			openSpeed: 500,
			closeSpeed: 700,
			closeDelay:500,
			onHide: function(){},
			onHidden: function(){},
			onShow: function(){},
			onShown: function(){}
		  };
		var settings = $.extend({}, defaults, custom);
		
		var menu = this;
		var currentPage = 0;
		var delayTimer = "";
		
		// Trigger init
		init();
		
		/**
		 * Do preparation work
		 */
		function init(){

			// Add open button and class to parent of a submenu
			var items = menu.find(":has(li,div) > a").append('<span class="arrow"></span>');
			$.each(items, function(i, val) {
				if(items.eq(i).parent().is("li")){
					items.eq(i).next().addClass("submenu").parent().addClass("haschildren");
				}else{
					items.eq(i).parent().find("ul").show();
				}
			});
			
			if(settings.openClick){
				menu.find(".submenu").css("display", "none");
				menu.find(":has(li,div) > a").parent().bind("mouseleave",handleHover).bind("mouseenter",function(){ window.clearInterval(delayTimer); });
				menu.find("a span.arrow").bind("click", handleHover);
			}else{
				menu.find(":has(li,div) > a").bind("mouseenter",handleHover).parent().bind("mouseleave",handleHover).bind("mouseenter",function(){ window.clearInterval(delayTimer); });
			}
			
			
		}
		
		/**
		 * Handle mouse hover action
		 */
		function handleHover(e){
			if(e.type == "mouseenter" || e.type == "click"){
				window.clearInterval(delayTimer);
				var current_submenu = $(e.target).parent().find(".submenu:not(:animated):not(.open)");
				if(current_submenu.html() == null){
					current_submenu = $(e.target).parent().next(".submenu:not(:animated):not(.open)");
				}
				if(current_submenu.html() != null){
					settings.onShow.call(current_submenu);
					closeAllMenus();
					current_submenu.prev().addClass("selected");
					current_submenu.css("z-index", "90");
					current_submenu.stop().hide();
					openMenu(current_submenu);
				}
			}
			if(e.type == "mouseleave" || e.type == "mouseout"){
				current_submenu = $(e.target).parents(".submenu");
				if(current_submenu.length != 1){
					var current_submenu = $(e.target).parent().parent().find(".submenu");
					if(current_submenu.html() == null){
						var current_submenu = $(e.target).parent().find(".submenu");
						if(current_submenu.html() == null){
							var current_submenu = $(e.target).parent().parent().parent().find(".submenu");
						}
					}
				}
				if(current_submenu.html() != null){
					if(settings.closeDelay == 0){
						current_submenu.parent().find("a").removeClass("selected");
						closeMenu(current_submenu);
					}else{
						window.clearInterval(delayTimer);
						delayTimer = setInterval(function(){
							window.clearInterval(delayTimer);
							closeMenu(current_submenu);
						}, settings.closeDelay);	
					}
				}
			}
		}
		
		function openMenu(object){
			switch(settings.openAnimation){
				case "slide":
					openSlideAnimation(object);
					break;
				case "fade":
					openFadeAnimation(object);
					break;
				default:
					openSizeAnimation(object);
					break;
			}
		}
		
		function openSlideAnimation(object){
			object.addClass("open").slideDown(settings.openSpeed, function(){ settings.onShown.call(this); });
		}
		
		function openFadeAnimation(object){
			object.addClass("open").fadeIn(settings.openSpeed, function(){ settings.onShown.call(this); });
		}
		
		function openSizeAnimation(object){
			object.addClass("open").show(settings.openSpeed, function(){ settings.onShown.call(this); });
		}
		
		function closeMenu(object){
			settings.onHide.call(object);
			switch(settings.closeAnimation){
				case "slide":
					closeSlideAnimation(object);
					break;
				case "fade":
					closeFadeAnimation(object);
					break;
				default:
					closeSizeAnimation(object);
					break;
			}
		}
		
		function closeSlideAnimation(object){
			object.slideUp(settings.closeSpeed, closeCallback);
		}
		
		function closeFadeAnimation(object){
			object.fadeOut(settings.closeSpeed, function(){ $(this).removeClass("open"); $(this).prev().removeClass("selected"); });
		}
		
		function closeSizeAnimation(object){
			object.hide(settings.closeSpeed, function(){ $(this).removeClass("open"); $(this).prev().removeClass("selected"); });
		}
		
		function closeAllMenus(){
			var submenus = menu.find(".submenu.open");
			$.each(submenus, function(i, val) {
				$(submenus[i]).css("z-index", "1");
				closeMenu($(submenus[i]));
			});
		}
		
		function closeCallback(object){
			$(this).removeClass("open"); 
			if($(this).prev().attr("class") == "selected") settings.onHidden.call(this);
			$(this).prev().removeClass("selected");
		}
			
		// returns the jQuery object to allow for chainability.
		return this;
	}
	
})(jQuery);

}
/*
     FILE ARCHIVED ON 16:18:05 Jan 03, 2016 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 22:53:19 Aug 31, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 1.006
  exclusion.robots: 0.041
  exclusion.robots.policy: 0.024
  esindex: 0.016
  cdx.remote: 36.619
  LoadShardBlock: 229.749 (3)
  PetaboxLoader3.datanode: 111.608 (4)
  PetaboxLoader3.resolve: 220.774 (2)
  load_resource: 129.799
*/