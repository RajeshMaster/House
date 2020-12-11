function pageClick(pageval) {
	$('#page').val(pageval);
	$("#mailstatus").submit();
}

function pageLimitClick(pagelimitval) {
	$('#page').val('');
	$('#plimit').val(pagelimitval);
	$("#mailstatus").submit();
}

// Redirect to Mail Status View Page
function mailview(mailid){
	pageload();
	$('#mailid').val(mailid);
	$('#mailstatus').attr('action', '../Mail/mailview'+'?mainmenu=menu_mailstatus&time='+datetime);
	$("#mailstatus").submit();
}

// Mail Status Fliter
function fnmailfilter(filval){
	pageload();
	$('#plimit').val('');
	$('#page').val('');
	$('#filval').val(filval);
	$('#mailstatus').attr('action', '../Mail/index'+'?mainmenu=menu_mailstatus&time='+datetime);
	$("#mailstatus").submit();
}

// To Mail Status Index Back
function fnredirectmailstatus() {
	pageload();
	$('#mailView').attr('action', '../Mail/index'+'?mainmenu=menu_mailstatus&time='+datetime); 
	$("#mailView").submit();
}

// Mail Content Fliter
function fnfilter(filterval) {
	pageload();
	$('#filvalhdn').val(filterval);
	$('#singlesearch').val('');
	$('#searchmethod').val('');
	$('#mailcontentindx').attr('action', '../Mail/mailcontent'+'?mainmenu=menu_mail&time='+datetime);
	$("#mailcontentindx").submit();
}

// Redirect to Mail Content View Page
function fncontentview(mailId) {
	pageload();
	$('#mailid').val(mailId);
	$('#mailcontentindx').attr('action', '../Mail/mailcontentview'+'?mainmenu=menu_mail&time='+datetime);
	$("#mailcontentindx").submit();
}

// Mail Content Sorting
$(function () {
	var cc = 0;
	$('#mailcontentsort').click(function () {
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
	var sortselect = $('#mailcontentsort').val();
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
	$("#mailcontentindx").submit();
}

// Mail Content Single Search
function fnSingleSearch() {
	var singlesearchtxt = $("#singlesearch").val();
	var singlesearchtxt = document.getElementById('singlesearch').value;
	if (singlesearchtxt == "") {
		alert("Please Enter The User Search.");
		$("#singlesearch").focus(); 
		return false;
	} else {
		pageload();
		$('#plimit').val(50);
		$('#page').val('');
		$('#filvalhdn').val('');
		$('#searchmethod').val('1');
		$("#mailcontentindx").submit();
	}
}

// Enter ker Search process in Mail Content Index page
function checkSubmitsingle(e) {
	if(e && e.keyCode == 13) {
		fnSingleSearch();
	}
}

// Mail Content Clear Search
function clearsearch() {
	$('#plimit').val(50);
	$('#page').val('');
	$("#filvalhdn").val('');
	$('#mailcontentsort').val('');
	$('#sortOrder').val('desc'); 
	$('#singlesearch').val('');
	$("#mailcontentindx").submit();
}

// Change Use or Not Use Flag in Mail Content
function fndelflg(flg,mailid) {
	swal({
		title: msg_flagchange,
		type: "warning",
		showCancelButton: true,
		confirmButtonClass: "btn-danger",
		closeOnConfirm: true,
		closeOnCancel: true
	},
	function(isConfirm) {
		if (isConfirm) {
			pageload();
			$('#delflg').val(flg);
			$('#mailid').val(mailid);
			$('#mailcontentindx').attr('action', '../Mail/mailcontentflg'+'?mainmenu=menu_mail&time='+datetime);
			$("#mailcontentindx").submit();
		} else {
			return false;
		}
	});
}

// To Mail Content Index Back
function fnback() {
	pageload();
	$('#mailcontentView').attr('action', '../Mail/mailcontent'+'?mainmenu=menu_mail&time='+datetime);
	$("#mailcontentView").submit();
}