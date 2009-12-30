/**
 * editProjects
 * 
 * Enables an object to show a given "on" element and hide an "off" element
 * when clicked. Initially executes the behavior when the object is ":checked". 
 */
(function($) {
	$.fn.editProjects = function() {

		/*return $(this).click(doToggle);*/

	}
})(jQuery);

/**
 * Initiate plugins.
 */
(function($) {
	$(document).ready(function() {

		/* sampleText for search box */
		$('.projects.edit').editProjects();

	});
})(jQuery);