$(document).ready(function() {
	var $tableBody = $('#recipeTableBody');
	var $menu = $('#menu');
	$(document).on('click', '.recipe-table__add-row-btn', function(e) {
		var $el = $(e.currentTarget);
		var htmlString = $('#rowTemplate').html();
		$tableBody.append(htmlString);
		return false;
	});

	$tableBody.on('click', '.recipe-table__del-row-btn', function(e) {
		var $el = $(e.currentTarget);
		var $row = $el.closest('tr');
		$row.remove();
		return false;
	});

});