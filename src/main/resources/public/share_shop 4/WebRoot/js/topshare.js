
		  $(function(){
			  
			  var offsetTop = $(window).scrollTop(); 
			  
			  if(offsetTop>105){
				$(".top_logo").animate({ top:10 + "px" },500); 
			  }
				 
			 
			 $(window).scroll(function() { 
				 
				 var offsetTop1 = $(window).scrollTop(); 
				 if(offsetTop1>105){
					   
				 	   $(".top_logo").animate({ top:10 + "px" },20); 
			     }else{
					  $(".top_logo").animate({ top:-40 + "px" },20); 
			     }
				 
				
			 });   
		  })
	