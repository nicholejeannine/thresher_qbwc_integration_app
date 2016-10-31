/*
Name: 			View - Home
Written by: 	Crivos - (http://www.crivos.com)
Version: 		1.0
*/

var Home = {

	initialized: false,

	initialize: function() {

		if (this.initialized) return;
		this.initialized = true;

		this.build();
		this.events();

	},

	build: function() {

		// Circle Slider
		if($("#fcSlideshow").get(0)) {
			$("#fcSlideshow").flipshow();

			setInterval( function() {
				$("#fcSlideshow div.fc-right span:first").click();
			}, 3000);

		}

		// Revolution Slider Initialize
		if($("#revolutionSlider").get(0)) {
			var rev = $("#revolutionSlider").revolution({
				delay:9000,
				startheight:500,
				startwidth:960,

				hideThumbs:10,

				thumbWidth:100,
				thumbHeight:50,
				thumbAmount:5,

				navigationType:"both",
				navigationArrows:"verticalcentered",
				navigationStyle:"round",

				touchenabled:"on",
				onHoverStop:"on",

				navOffsetHorizontal:0,
				navOffsetVertical:20,

				stopAtSlide:-1,
				stopAfterLoops:-1,

				shadow:1,
				fullWidth:"on"
			});

			$("#revolutionSlider .caption").on("mousedown", function(e) {
				e.preventDefault();
				rev.revpause();
				return false;
			});

		}

			// Revolution Slider Initialize
		if($("#revolutionSliderFullScreen").get(0)) {
			var rev = $("#revolutionSliderFullScreen").revolution({
				delay:9000,
				startwidth:1170,
				startheight:600,

				hideThumbs:200,

				thumbWidth:100,
				thumbHeight:50,
				thumbAmount:5,

				navigationType:"both",
				navigationArrows:"verticalcentered",
				navigationStyle:"round",

				touchenabled:"on",
				onHoverStop:"on",

				navOffsetHorizontal:0,
				navOffsetVertical:20,

				stopAtSlide:-1,
				stopAfterLoops:-1,

				shadow:0,
				fullWidth:"on",
				fullScreen:"on",
				fullScreenOffsetContainer:".header"
			});

		}

		// Nivo Slider
		if($("#nivoSlider").get(0)) {
			$("#nivoSlider").nivoSlider();
		}

	},

	events: function() {

		this.moveCloud();

	},

	moveCloud: function() {

		var $this = this;

		$(".cloud").animate( {"top": "+=20px"}, 3000, "linear", function() {
			$(".cloud").animate( {"top": "-=20px"}, 3000, "linear", function() {
				$this.moveCloud();
			});
		});

	}

};

Home.initialize();