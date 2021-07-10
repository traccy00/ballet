// ==================== MENU SHOW =============================

const showMenu = (toggleId, navId) => {
    const toggle = document.getElementById(toggleId),
        nav = document.getElementById(navId);
    if (toggle && nav) {
        toggle.addEventListener('click', () => {
            nav.classList.toggle('show');
        })
    }
}
showMenu('nav-toggle', 'nav-menu');


// ========================= REMOVE MENU MOBILE =====================
const navlink = document.querySelectorAll('.nav__link');

function linkAction() {
    //Acvite link
    navlink.forEach(n => n.classList.remove('active'));
    this.classList.add('active');

    //Remove menu mobile: khi chọn xong một mục nào đó của menu thì menu hiden
    const navMenu = document.getElementById('nav-menu');
    navMenu.classList.remove('show');
}
navlink.forEach(n => n.addEventListener('click', linkAction));


//=================SCROLL SECTIONS ACTIVE LINK =======================
const sections = document.querySelectorAll('section[id]');

window.addEventListener('scroll', scrollActive);

function scrollActive() {
    const scrollY = window.pageYOffset;
    sections.forEach(current => {
        const sectionHeight = current.offsetHeight;
        const sectionTop = current.offsetTop - 50;
        sectionId = current.getAttribute('id');

        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            document.querySelectorAll('.nav_menu a[href*=' + sectionId + ']').classList.add('active');
        } else {
            document.querySelectorAll('.nav_menu a[href*=' + sectionId + ']').classList.remove('active');

        }
    })
}

// ==============SCRIOLL REVEAL ANIMATION ==================
const sr = ScrollReveal({
        orgin: 'top',
        distance: '80px',
        duration: 2000,
        reset = true
    })
    // SCROLL HOME
sr.reveal('.home_title', {});
sr.reveal('.home_scroll', { delay: 200 });
sr.reveal('.home_img', { orgin: 'right', delay: 400 });
// SCROLL ABOUT
sr.reveal('.about_img', { delay: 500 });
sr.reveal('.about_subtitle', { delay: 300 });
sr.reveal('.about_profression', { delay: 400 });
sr.reveal('.about_text', { delay: 500 });
sr.reveal('.about_social', { delay: 600, interval: 200 });
// SCROLL SKILL
sr.reveal('.skill_subtitle', {});
sr.reveal('.skill_name', { distance: '20px', delay: 50, interval: 100 });
sr.reveal('.skills_img', { delay: 400 });
// SCROLL PORTFOLIO
sr.reveal('.portfolio_img', { interval: 200 });
// SCROLL CONTACT
sr.reveal('.contact_subtitle', {});
sr.reveal('.portfolio_text', { interval: 200 });
sr.reveal('.portfolio_input', { delay: 400 });
sr.reveal('.portfolio_button', { delay: 600 });

/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});
