// Userprofileview page view process
function fnRedirectToview(userId) {
	$('#userId').val(userId);
	$('#userIndex').attr('action', '../User/profile?mainmenu='+mainmenu+'&time='+datetime);
	$("#userIndex").submit();
}

// Userprofileview page  back button process
function fnredirectback() {
	pageload();
	$('#profileview').attr('action', '../User/index'+'?mainmenu='+mainmenu+'&time='+datetime); 
	$("#profileview").submit();
}

// Search process in UserIndex page
function fnSingleSearch() {
	var singlesearchtxt = $("#singlesearch").val();
	var singlesearchtxt = document.getElementById('singlesearch').value;
	if (singlesearchtxt == "") {
		alert("Please Enter The User Search.");
		$("#singlesearch").focus(); 
		return false;
	} else {
		$('#plimit').val('');
		$('#page').val('');
		$('#userIndex').attr('action', '../User/index?mainmenu='+mainmenu+'&time='+datetime);
		$("#userIndex").submit();
	}
}

// Enter ker Search process in UserIndex page
function checkSubmitsingle(e) {
	if(e && e.keyCode == 13) {
		fnSingleSearch();
	}
}

// Pagination process in UserIndex page
function pageClick(pageval) {
	$('#page').val(pageval);
	$("#userIndex").submit();
}
function pageLimitClick(pagelimitval) {
	$('#page').val('');
	$('#plimit').val(pagelimitval);
	$("#userIndex").submit();
}

// Sorting process in UserIndex page
$(function () {
	var cc = 0;
	$('#usersort').click(function () {
		cc++;
		if (cc == 2) {
			$(this).change();
			cc = 0;
		}
	}).change (function () {
		sortingfun();
		cc = -1;
	}); 
});

function sortingfun() {
	pageload();
	$('#plimit').val(50);
	$('#page').val('');
	var sortselect = $('#usersort').val();
	$('#sortOptn').val(sortselect);
	$('#singlesearch').val('');
	var alreadySelectedOptn = $('#sortOptn').val();
	var alreadySelectedOptnOrder = $('#sortOrder').val();
	if (sortselect == alreadySelectedOptn) {
		if (alreadySelectedOptnOrder == "asc") {
			$('#sortOrder').val('desc');
		} else {
			$('#sortOrder').val('asc');
		}
	}
	$("#userIndex").submit();
}

// Clear search process in UserIndex page
function clearsearch() {
	$('#plimit').val(50);
	$('#page').val('');
	$("#filterval").val('');
	$('#usersort').val('');
	$('#sortOrder').val('asc'); 
	$('#singlesearch').val('');
	$("#userIndex").submit();
}

// Filter process in UserIndex page
function filter(val) {
	pageload();
	$("#filterval").val(val);
	$("#usersort").val('');
	$('#plimit').val('');
	$('#page').val('');
	$('#singlesearch').val('');
	$('#userIndex').submit();
}
