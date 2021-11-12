(function(){
  // setup your carousels as you normally would using JS
  // or via data attributes according to the documentation
  // https://getbootstrap.com/javascript/#carousel
  if($('.carousel-showmanymoveone .item').length>4){
	  $('#carousel123').carousel({ interval: 1000 });
	  $('#carouselABC').carousel({ interval: 3600 });
	}
}());

(function(){

 var itemToClone = $('.carousel-showmanymoveone .item');
if(itemToClone.length<4){
  $('.carousel-showmanymoveone .item').each(function(){

	if(itemToClone.length<4){
		for (var i=1;i<itemToClone.length;i++) {
			itemToClone = itemToClone.next();
			
			itemToClone.children(':first-child').clone()
	        .addClass("cloneditem-"+(i))
	        .appendTo($(this));
	        
		}
	        document.getElementById("slide-left-btn").style.visibility='hidden';
	        document.getElementById("slide-right-btn").style.visibility='hidden';
	}
	    
	});
  }else{
	  $('.carousel-showmanymoveone .item').each(function(){
	    var itemToClone = $(this);
	
	
		    for (var i=1;i<4;i++) {
		      itemToClone = itemToClone.next();
		
		      // wrap around if at end of item collection
		      if (!itemToClone.length) {
		        itemToClone = $(this).siblings(':first');
		      }
		
		      // grab item, clone, add marker class, add to collection
		      itemToClone.children(':first-child').clone()
		        .addClass("cloneditem-"+(i))
		        .appendTo($(this));
			}
  		});
  }
}());