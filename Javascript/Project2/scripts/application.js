$(document).ready(function(){
	$('#content').find('#logo').append('<img src="images/pizzaLogo.jpg" />');
	$('#content').find('#navbar').append('\
		<ul>\
			<li id="home">Home</li>\
			<li id="about">About</li>\
			<li id="menu">Menu</li>\
		</ul>\
		');



	$('#navbar').find('li').on('click', function(){
		$('#navbar li').removeClass('highlighted');
		$(this).addClass('highlighted');
	});

	//home page
	$('#navbar').find('#home').on('click', function(){
		$('#body').text('');
		$('#body').append('\
			<h2>Welcome to Tom\'s Pizza Parlor!</h2>\
			<p>This is a sample (and very basic) web application built almost entirely in JavaScript and jQuery.\
			It was completed as part of The Odin Project\'s JavaScript curriculum.  If you view the page source\
			code, you will see there is very little HTML coded in at all.  Everything is dynamically generated using\
			JS and jQuery.  The page does not refresh or send new requests, despite serving up new content whenever a user\
			clicks the navigation bar.</p>\
			<p>Of course it could be much prettier, but this is more an app to utilize JavaScript than it is a test of design.</p>');
		$('#body').css({'visibility': 'visible'});
	});


	//about page
	$('#navbar').find('#about').on('click', function(){
		$('#body').text('');
		$('#body').append('\
			<h2>About</h2>\
			<p>Project motivation: <a target="_blank" href="http://www.theodinproject.com/javascript-and-jquery/manipulating-the-dom-with-jquery?ref=lnav">The Odin Project</a>.</p>\
			<p>View source: <a target="_blank" href="http://www.github.com/tim5046">Github Profile</a></p>');
		$('#body').css({'visibility': 'visible'});
	});

	//menu page
	$('#navbar').find('#menu').on('click', function(){
		$('#body').text('');
		$('#body').append('\
			<h2>Menu</h2>\
			<div width="80%"></div><div width="20%" id="price"></div>\
			<ul class="pmenu">\
			<li data-price="9.99">Pepperoni Pizza</li>\
			<li data-price="10.99">Mushroom Pizza</li>\
			<li data-price="8.99">Sausage Pizza</li>\
			<li data-price="9.95">Deluxe Pizza</li>\
			<li data-price="11.99">Vegetable Pizza</li>\
			<li data-price="12.99">Chicken Pizza</li>\
			<li data-price="13.99">Meatball Pizza</li>\
			<li data-price="14.99">Vegan Pizza</li>\
			</ul>');
		$('#body').css({'visibility': 'visible'});
	
		$('.pmenu').find('li').on('mouseover',function(){
			var price = $(this).data('price')
			$('#body').find('#price').text(price);
			$(this).addClass('marginIn');
		});

		$('.pmenu').find('li').on('mouseout',function(){
			$(this).removeClass('marginIn');
		});

	});

	//show prices on 'li' mouseovers


});