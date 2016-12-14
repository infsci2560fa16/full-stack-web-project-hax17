
		
		
		$(document).ready(function() {
			$(".slideInner").slide({
				slideContainer: $('.slideInner a'),
				effect: 'easeOutCirc',
				autoRunTime: 5000,
				slideSpeed: 1000,
				nav: true,
				autoRun: true,
				prevBtn: $('a.prev'),
				nextBtn: $('a.next')
			})
		})
		
		