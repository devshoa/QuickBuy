// viewport size
function viewport() {
	var a = window,
		b = "inner";
	return (
		"innerWidth" in window ||
			((b = "client"), (a = document.documentElement || document.body)),
		{ width: a[b + "Width"], height: a[b + "Height"] }
	);
}
// viewport size end

// clear timeout
function timerOut(clearTimer) {
	clearTimeout(clearTimer);
}
// clear timeout end

// map
function initializeMap() {
	var map = new google.maps.Map(document.getElementById("map"), {
		zoom: 16,
		center: new google.maps.LatLng(10.8529391,106.6295448),
		panControl: false,
		mapTypeControl: false,
		streetViewControl: false,
		styles: [{"featureType":"administrative","elementType":"all","stylers":[{"saturation":"-100"}]},{"featureType":"administrative.province","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"landscape","elementType":"all","stylers":[{"saturation":-100},{"lightness":0},{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"saturation":-100},{"lightness":"50"},{"visibility":"simplified"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":"-100"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"all","stylers":[{"lightness":"30"}]},{"featureType":"road.local","elementType":"all","stylers":[{"lightness":"40"}]},{"featureType":"transit","elementType":"all","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":0},{"saturation":-97}]},{"featureType":"water","elementType":"labels","stylers":[{"lightness":0},{"saturation":-100}]}]
	});

	var image = "assets/img/marker.png";
	var markers = [];
	var marker, i;
	marker = new google.maps.Marker({
		position: new google.maps.LatLng(
			10.8529391,106.6295448
		),
		map: map,
		icon: image,
	});

	markers.push(marker);

}

function loadScript() {
	var script = document.createElement("script");
	script.type = "text/javascript";
	script.src =
		"https://maps.googleapis.com/maps/api/js?key=AIzaSyAnKLwP33l9NYKvibgdPwBLl5zlVqYTr1M&" +
		"map_ids=d8b96138e75850a&" +
		"callback=initializeMap";
	setTimeout(function () {
		document.body.appendChild(script);
	}, 3000);
}
// map end

// load document
window.onload = function () {

	// map init
	if($("#map").length){
		loadScript();
	}
	// map init end

	// ie fix
	if (/MSIE 10/i.test(navigator.userAgent)) {
		$("html").addClass("ie");
	}
	if (
		/MSIE 9/i.test(navigator.userAgent) ||
		/rv:11.0/i.test(navigator.userAgent)
	) {
		$("html").addClass("ie");
	}
	// ie fix

	// remove loaded class
	document.body.classList.remove("loaded");
	// remove loaded class end

	// check device type
	if (
		/Android|Windows Phone|webOS|iPhone|iPad|iPod|BlackBerry/i.test(
			navigator.userAgent
		)
	) {
		document.documentElement.classList.add("mob");
	} else {
		document.documentElement.classList.add("desktop");
	}

	if (navigator.platform.toUpperCase().indexOf("MAC") >= 0) {
		document.documentElement.classList.add("mac");
	}
	// check device type end

	// placeholder
	$(function () {
		$("input, textarea").each(function () {
			var a = $(this).attr("placeholder");
			$(this).focus(function () {
				$(this).attr("placeholder", "");
			});
			$(this).focusout(function () {
				$(this).attr("placeholder", a);
			});
		});
	});
	// placeholder end

	// lazy load
	(function () {
		var srcArr = document.querySelectorAll("[data-lazy]");
		if($(".mob").length){
			setTimeout(function () {
				for (var i = 0; i < srcArr.length; i++) {
					var newSrc = srcArr[i].dataset.lazy;
					srcArr[i].src = newSrc;
				}
			}, 1500);
		} else{
			for (var i = 0; i < srcArr.length; i++) {
				var newSrc = srcArr[i].dataset.lazy;
				srcArr[i].src = newSrc;
			}
		}		
	})();

	(function () {
		var srcArr = document.querySelectorAll("[data-bg]");
		if($(".mob").length){
			setTimeout(function () {
				for (var i = 0; i < srcArr.length; i++) {
					var newSrc = srcArr[i].dataset.bg;
					srcArr[i].style.backgroundImage = "url(" + newSrc + ")";
				}
			}, 1500);
		} else{
			for (var i = 0; i < srcArr.length; i++) {
				var newSrc = srcArr[i].dataset.bg;
				srcArr[i].style.backgroundImage = "url(" + newSrc + ")";
			}
		}
	})();
	// lazy load end

	// sliders
	(function () {
		if($(".js-main-slider").length){
			$(".js-slide").each(function() {
				$(this).attr("data-item", $(this).index());
			});

			$(".js-main-slider").on(
				"init",
				function () {
					$(".js-main-slider").removeClass("loaded");
				}
			);
		
			$(".js-main-slider").slick({
				dots: true,
				arrows: true,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 7000,
				slidesToShow: 1,
				slidesToScroll: 1,
				touchThreshold: 200,
				speed: 1000,
				waitForAnimate: false,
				fade: true,
				appendArrows: $(".js-main-arrows"),
				appendDots: $(".js-main-dots")
			});
		
			$(".js-main-slider").on(
				"beforeChange",
				function (event, slick, currentSlide, nextSlide) {
					var newCount = "<span>" + (nextSlide + 1) + "</span>/" + slick.slideCount;
					$(".js-main-count")
						.html(newCount);
					$(this).find(".js-slide").removeClass("active");
					$(this).find(".js-slide[data-item=" + nextSlide + "]").addClass("active");						
				}
			);

		}

		if ($(".js-catalog-carousel").length) {
			$(function () {
				$(".js-catalog-carousel").on("init", function () {
					$(".js-catalog").removeClass("loaded");
				});
	
				function catalogInit(slider, dots, arrowPrev, arrowNext) {
					slider.slick({
						dots: true,
						appendDots: dots,
						arrows: true,
						prevArrow: arrowPrev,
						nextArrow: arrowNext,
						infinite: true,
						autoplay: false,
						slidesToShow: 4,
						slidesToScroll: 4,
						touchThreshold: 200,
						speed: 500,
						waitForAnimate: false,
						adaptiveHeight: true,
						responsive: [
							{ breakpoint: 992, settings: { slidesToShow: 3, slidesToScroll: 3} },
							{ breakpoint: 701, settings: { slidesToShow: 2, slidesToScroll: 2} },
							{ breakpoint: 480, settings: { slidesToShow: 1, slidesToScroll: 1} }
						],
					});
				}

				$(".js-catalog-carousel").each(function () {
					var $this = $(this),
						$dots = $this
							.closest(".js-catalog")
							.find(".js-catalog-dots"),
						$arrowPrev = $this
							.closest(".js-catalog")
							.find(".js-catalog-prev"),
						$arrowNext = $this
							.closest(".js-catalog")
							.find(".js-catalog-next");							
					setTimeout(function () {
						catalogInit($this, $dots, $arrowPrev, $arrowNext);
					}, 3000);
				});
			});
		}	
		
		if($(".js-product-slider").length){

			$(".js-product-slider").on(
				"init",
				function () {
					$(".js-product-slider").removeClass("loaded");
				}
			);
		
			$(".js-product-slider").slick({
				dots: true,
				arrows: false,
				infinite: true,
				autoplay: false,
				slidesToShow: 1,
				slidesToScroll: 1,
				touchThreshold: 200,
				speed: 500,
				waitForAnimate: false
			});
	
		}		
	})();
	// sliders end
	
	/* tabs */
	$(function () {
		$(".js-tabs-link").live("click", function (e) {
			if ($(this).closest(".js-tabs-item.active").length < 1) {
				if ($(this).is("a")) {
					e.preventDefault();
				}
				$(this)
					.closest(".js-tabs-item")
					.addClass("active")
					.siblings(".js-tabs-item")
					.removeClass("active");
				var curHref = $(this).attr("href") || $(this).attr("data-href");
				$(curHref)
					.addClass("active")
					.siblings(".js-tabs-content")
					.removeClass("active");
			} else {
				if ($(this).is("a")) {
					e.preventDefault();
				}
			}
		});
	});
	// tabs end

	// tabs line
	$(".js-line-link").live("click", function () {
		$(this)
			.closest(".js-line")
			.find(".js-line-element")
			.css("top", $(this).position().top + "px")
			.css("left", $(this).position().left + "px")
			.css("width", $(this).width() + "px");
	});
	// tabs line end	

	// timer
	if($(".js-timer").length){
		$('.js-timer').syotimer({
			year: 2021,
			month: 3,
			day: 10
		});		
	}
	// timer end

	// toggle active
	$(".js-toggle-active").live("click", function (e) {
		$(this).toggleClass("active");
	});
	// toggle active end	

	// popups
	(function () {
		var timer;

		// open popup
		jQuery(".js-popup-open").on("click", function (e) {

			e.preventDefault();
			var currentId =
				jQuery(this).attr("href") || jQuery(this).attr("data-href");
			timerOut(timer);

			// append responsive video in popup
			if (jQuery(this).hasClass("js-popup-video")) {
				var videoSrc = jQuery(this).attr("data-frame");
				var videoWidth = jQuery(this).attr("data-width");
				var videoHeight = jQuery(this).attr("data-height");
				jQuery(".js-video-frame").append(
					'<iframe frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
				);
				jQuery(".js-video-frame")
					.find("iframe")
					.attr("src", videoSrc)
					.attr("width", videoWidth)
					.attr("height", videoHeight);
				jQuery(".js-video-frame").fitVids().addClass("active");
			}			

			if (document.body.scrollHeight > document.body.clientHeight) {
				jQuery("html").addClass("remove-scroll");
			}
			jQuery(currentId).stop().fadeIn(0).addClass("active");
			jQuery("html").addClass("hidden");
			if (jQuery(currentId).scrollTop() > 0) {
				jQuery(currentId).scrollTop(0);
			}
			return false;

		});

		// close popup
		jQuery(".js-popup-close").on("click", function (e) {

			if (jQuery(this).is("a")) {
				e.preventDefault();
			}
			timerOut(timer);
			jQuery(".js-popup.active").removeClass("active").fadeOut(300);
			timer = setTimeout(function () {
				if (!$(".js-mob-hide.active").length) {
					jQuery("html").removeClass("hidden remove-scroll");
				}

				// clear responsive video in popup
				if (jQuery(".js-video-frame.active").length) {
					jQuery(".js-video-frame").empty().removeClass("active");
				}	

			}, 300);

		});
	})();
	// popups

	// closest descendent
	$.fn.closestDescendent = function (filter) {
		var $found = $(),
			$currentSet = this;
		while ($currentSet.length) {
			$found = $currentSet.filter(filter);
			if ($found.length) break;
			$currentSet = $currentSet.children();
		}
		return $found.first();
	};
	// closest descendent end

	// navigation
	$(function () {
		var navTimer;

		// main nav
		function mouseOverNav($this, $navButton, $navItem, $navHide, $speed) {
			timerOut(navTimer);
			navTimer = setTimeout(function () {
				$this
					.addClass("active")
					.closest($navItem)
					.addClass("active")
					.closestDescendent($navHide)
					.stop()
					.fadeIn($speed, function () {
						$navItem.removeClass("to-right");
						if (
							$this
								.closest($navItem)
								.closestDescendent($navHide)
								.width() >
							$(window).width() -
								$this
									.closest($navItem)
									.closestDescendent($navHide)
									.offset().left
						) {
							$this.closest($navItem).addClass("to-right");
						}
					});

				$this
					.closest($navItem)
					.siblings($navItem)
					.removeClass("active")
					.closestDescendent($navHide)
					.stop()
					.fadeOut($speed)
					.closest($navItem)
					.find($navButton)
					.removeClass("active");
			}, 20);
		}

		function mouseOutNav($this, $navButton, $navItem, $navHide, $speed) {
			timerOut(navTimer);
			$($this)
				.removeClass("active")
				.find($navButton)
				.removeClass("active");
			$($this).find($navHide).fadeOut($speed);
		}

		function clickNav($this, $navButton, $navItem, $navHide, $speed) {
			if ($this.hasClass("active")) {
				$($navItem).removeClass("active");
				$($navButton).removeClass("active");
				$($navHide).fadeOut($speed);
				$("html").removeClass("scroll-hidden");
			} else {
				$($navItem).removeClass("active");
				$($navButton).removeClass("active");
				$($navHide).fadeOut($speed);
				$this
					.addClass("active")
					.closest($navItem)
					.addClass("active")
					.closestDescendent($navHide)
					.stop()
					.fadeIn($speed, function () {
						$navItem.removeClass("to-right");
						if (
							$this
								.closest($navItem)
								.closestDescendent($navHide)
								.width() >
							$(window).width() -
								$this
									.closest($navItem)
									.closestDescendent($navHide)
									.offset().left
						) {
							$this.closest($navItem).addClass("to-right");
						}
					});
			}
		}

		$(".desktop .js-nav-button").live(
			"mouseenter",
			function () {
				mouseOverNav(
					$(this),
					$(".js-nav-button"),
					$(".js-nav-item"),
					$(".js-nav-hide"),
					300
				);
			}
		);

		$(".desktop .js-nav-item").live("mouseleave", function () {
			mouseOutNav(
				$(this),
				$(".js-nav-button"),
				$(".js-nav-item"),
				$(".js-nav-hide"),
				0
			);
		});

		$(".mob .js-nav-button").live("click", function () {
			clickNav(
				$(this),
				$(".js-nav-button"),
				$(".js-nav-item"),
				$(".js-nav-hide"),
				300
			);
		});

		$(document).on("click touchstart", function (e) {
			if ($(e.target).closest(".js-nav-item").length) return;
			$(
				".desktop .js-nav-item, .desktop .js-nav-button"
			).removeClass("active");
			$(".desktop .js-nav-hide").stop().fadeOut(0);
		});		

		// mobile nav
		$(".js-mob-open").live("click", function () {
			timerOut(navTimer);
			$(".js-mob-hide")
				.stop()
				.fadeIn(100, function () {
					$(this).addClass("active");
				});
			if (document.body.scrollHeight > document.body.clientHeight) {
				$("html").addClass("remove-scroll");
			}
			$("html").addClass("hidden");
		});

		$(".js-mob-close").live("click", function () {
			timerOut(navTimer);
			$(this).removeClass("active");
			$(".js-mob-hide")
				.removeClass("active")
				.stop()
				.fadeOut(300);
			navTimer = setTimeout(function () {
				$("html").removeClass("hidden remove-scroll");
			}, 301);
		});

		// slidedown
		$(".js-slidedown-button").live("click", function (e) {
			e.preventDefault();
			$(this)
				.toggleClass("active")
				.closest(".js-slidedown")
				.toggleClass("active")
				.closestDescendent(".js-slidedown-hide")
				.stop()
				.slideToggle(300);
		});

		$(".js-slidedown.active").each(function () {
			$(this).closestDescendent(".js-slidedown-hide").stop().slideDown(0);
			$(this).closestDescendent(".js-slidedown-button").addClass("active");
		});		

	});
	// navigation end

	// accordion
	$(function () {
		$(".js-faq-item.active").find(".js-faq-hide").slideDown(0);

		$(".js-faq-button").on("click", function () {
			if ($(this).closest(".js-faq-item").hasClass("active")) {
				$(this)
					.closest(".js-faq-item")
					.find(".js-faq-hide")
					.slideUp(300);
				$(this)
					.closest(".js-faq")
					.find(".js-faq-item")
					.removeClass("active");
			} else {
				$(this)
					.closest(".js-faq")
					.find(".js-faq-item.active .js-faq-hide")
					.slideUp(300);
				$(this)
					.closest(".js-faq")
					.find(".js-faq-item.active")
					.removeClass("active");
				$(this).closest(".js-faq-item").addClass("active");
				$(this)
					.closest(".js-faq-item")
					.closestDescendent(".js-faq-hide")
					.slideDown(300, function () {
						if($(".mob").length){
							var url = $(this).closest(".js-faq-item");
							$("html, body").animate(
								{
									scrollTop: parseInt($(url).offset().top - $(".header").height()),
								},
								300
							);
						}
					});
			}
		});
	});
	// accordion

	// formstyler
	if ($(".js-formstyler").length) {
		$("select.js-formstyler").styler({
			onSelectClosed: function () {
				if ($(this).find("option[data-hidden]:selected").length == 0) {
					$(this).addClass("hide-selected");
				}
			},			
		});
	}
	// formstyler end	

	// selectize
	$(function () {
		if ($(".js-selectize-country").length) {
			var $select1 = $(".js-selectize-country").selectize({
				placeholder: "Choose your country",
				allowEmptyOption: true,
				onDropdownClose: function ($dropdown) {
					$($dropdown)
						.find(".selected")
						.not(".active")
						.removeClass("selected");
				},
			});
			$select1.each(function () {
				$(this)[0].selectize.clear(true);
			});
		}	
		if ($(".js-selectize-city").length) {
			var $select2 = $(".js-selectize-city").selectize({
				placeholder: "Choose your city",
				allowEmptyOption: true,
				onDropdownClose: function ($dropdown) {
					$($dropdown)
						.find(".selected")
						.not(".active")
						.removeClass("selected");
				},
			});
			$select2.each(function () {
				$(this)[0].selectize.clear(true);
			});
		}		
		if($(".js-selectize-value-1").length){
			$select1[0].selectize.setValue("Имя API-ключа");			
		}				
		if($(".js-selectize-value-2").length){
			$select2[0].selectize.setValue("1");			
		}			
	});
	// selectize end	

	// ui range
	$(function () {
		if ($("#range-slider").length) {
			var rangeSlider = document.getElementById("range-slider");
			setTimeout(function () {
				noUiSlider.create(rangeSlider, {				
					range: {
						min: 1,
						max: 300,
					},
					step: 1,
					start: [21, 187],
					format: wNumb({
						decimals: 0,
						prefix: "$",
					}),
					tooltips: true,
					connect: true
				});
			}, 1000);
		}
	});
	// ui range end	

	// show more
	$(".js-more-button").on("click", function(e){
		e.preventDefault(0);
		$(this).toggleClass("active").closest(".js-more").toggleClass("opened");
		if($(".mob").length){
			var url = $(this).closest(".js-more");
			$("html, body").animate(
				{
					scrollTop: parseInt($(url).offset().top - $(".header").height()),
				},
				300
			);
		}		
	});
	// show more end

	// plus minus
	$(function () {
		$(".js-count-plus").live("click", function () {
			var currentValue = $(this).prev().val();
			$(this)
				.prev()
				.val(+currentValue + 1);
			if ($(this).prev().val() > 1) {
				$(this).prevAll(".js-count-minus").prop("disabled", false);
			}
			return false;
		});
	});

	$(function () {
		$(".js-count-minus").live("click", function () {
			var currentValue = $(this).next().val();
			if (currentValue > 1) {
				$(this)
					.next()
					.val(+currentValue - 1);
				if (currentValue <= 2) {
					$(this).prop("disabled", true);
				}
			}
			return false;
		});
	});

	$(function () {
		$(".js-count-input")
			.on("keypress", function (e) {
				var keyCode = e.which ? e.which : event.keyCode;
				return !(keyCode > 31 && (keyCode < 48 || keyCode > 57));
			})
			.on("change keyup input click mouseup", function () {
				this.value = this.value.replace(/^0|[^\d]/g, "");
			})
			.on("blur", function () {
				if (this.value.length == 0) {
					this.value = 1;
				}
				if (this.value < 2) {
					$(this).prev(".js-count-minus").prop("disabled", true);
				} else {
					$(this).prev(".js-count-minus").prop("disabled", false);
				}
			});
	});
	// plus minus	

	// remove item
	$(".js-remove-button").on("click", function(){
		$(this).closest(".js-remove").fadeOut(300, function(){
			$(this).remove();
		});
	});
	// remove item end

	// input mask
	if ($(".js-mask-tel").length) {
		$(".js-mask-tel").inputmask({
			"mask": "+99 (999) 999-99-99",
			"showMaskOnHover": false
		});;
	}
	if ($(".js-mask-card").length) {
		$(".js-mask-card").inputmask({
			"mask": "9999-9999-9999-9999",
			"showMaskOnHover": false
		});;
	}
	if ($(".js-mask-date").length) {
		$(".js-mask-date").inputmask({
			"mask": "99",
			"showMaskOnHover": false
		});;
	}	
	if ($(".js-mask-code").length) {
		$(".js-mask-code").inputmask({
			"mask": "999",
			"showMaskOnHover": false
		});;
	}		
	// input mask end	

};
// load document end

// resize window
function resizeWindow() {

	// moving content
	if (viewport().width > 1279) {
		$(".js-content-1").appendTo(".js-from-1");
	}
	if (viewport().width <= 1279) {
		$(".js-content-1").appendTo(".js-to-1");
	}
	if (viewport().width > 767) {
		$(".js-content-2").appendTo(".js-from-2");
		$(".js-content-3").appendTo(".js-from-3");
	}
	if (viewport().width <= 767) {
		$(".js-content-2").appendTo(".js-to-2");
		$(".js-content-3").appendTo(".js-to-3");
	}	
	// moving content

	// tabs line fix
	if ($(".js-line").length) {
		$(".js-line").each(function () {
			$(this)
				.find(".js-line-element")
				.css(
					"left",
					$(this)
						.find(".js-line-item.active .js-line-link")
						.position().left + "px"
				)
				.css(
					"top",
					$(this)
						.find(".js-line-item.active .js-line-link")
						.position().top + "px"
				)				
				.css(
					"width",
					$(this).find(".js-line-item.active .js-line-link").width() +
						"px"
				);
		});
	}
	// tabs line fix end	

}

window.addEventListener("load", resizeWindow);
window.addEventListener("resize", resizeWindow);
window.addEventListener("oriantationchange", resizeWindow);
// resize window end

/* scrolled header */
jQuery(window).on("scroll load", function () {
	if (jQuery(window).scrollTop() > 20) {
		jQuery(".header").addClass("scrolled");
	} else {
		jQuery(".header").removeClass("scrolled");
	}
});
/* scrolled header */