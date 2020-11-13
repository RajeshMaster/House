var data = {};
$(document).ready(function() {

	$('.addeditprocess').click(function () {
		$("#houseAddEdit").validate({
			showErrors: function(errorMap, errorList) {
			// Clean up any tooltips for valid elements
				$.each(this.validElements(), function (index, element) {
						var $element = $(element);
						$element.data("title", "") // Clear the title - there is no error associated anymore
								.removeClass("error")
								.tooltip("destroy");
				});
				// Create new tooltips for invalid elements
				$.each(errorList, function (index, error) {
						var $element = $(error.element);
						$element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
								.data("title", error.message)
								.addClass("error")
								.tooltip(); // Create a new tooltip based on the error messsage we just set in the title
				});
			},
			rules: {
				belongsTo: {required: true},
				purchaseDate: {required: true, date: true,correctformatdate: true},
				purchaseAmount: {required: true},
				pincode: {required: true},
				address: {required: true},
				buildingName: {required: true},
				houseName: {required: true},
				houseNo: {required: true},
				houseBuildOn: {date: true,correctformatdate: true},
				currentValue: {required: true},
				image1: {
					checkotherField: "#file_name_temp", 
				}
			},
			submitHandler: function(form) { // for demo
				if($('#editpage').val() != "editpage") {
					var err_cnfirm = msg_register;
				} else {
					var err_cnfirm = msg_update;
				}
				swal({
					title: err_cnfirm,
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					closeOnConfirm: true,
					closeOnCancel: true
				},
				function(isConfirm) {
					if(isConfirm) {    
						pageload();
						form.submit();
						return true;
					} else {
						return false;
					}
				});
			}
		});

		$.validator.messages.required = function (param, input) {
			var article = document.getElementById(input.id);
			return article.dataset.label + ' field is required';
		}
		$.validator.messages.extension = function (param, input) {
			return err_extension;
		}
		
	});

	$('.memoRegprocess').on('click', function() {
		swal({
			title: msg_register,
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function(isConfirm) {
			if (isConfirm) {
			   pageload();
				$('#houseMemoReg').attr('action', 'memoRegprocess'+'?mainmenu=menu_house&time='+datetime);
				$("#houseMemoReg").submit();
			} else {
				 $("#addeditprocess").attr("disabled", false);
			}
		});
	});

});

function resetErrors() {
	$('form input, form select, form radio, form textarea').css("border-color", "");
	$('form input').removeClass('inputTxtError');
	$('label.error').remove();
}

// Sorting process in UserIndex page
$(function () {
	var cc = 0;
	$('#houseSort').click(function () {
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
	var mainmenu = $('#mainmenu').val();
	$('#plimit').val(50);
	$('#page').val('');
	var sortselect=$('#houseSort').val();
	$('#sortOptn').val(sortselect);
	var alreadySelectedOptn = $('#sortOptn').val();
	var alreadySelectedOptnOrder = $('#sortOrder').val();
	if (sortselect == alreadySelectedOptn) {
		if (alreadySelectedOptnOrder == "asc") {
			$('#sortOrder').val('desc');
		} else {
			$('#sortOrder').val('asc');
		}
	}
	$("#houseIndex").submit();
}

function pageClick(pageval) {
	$('#page').val(pageval);
	$("#houseIndex").submit();
}

function pageLimitClick(pagelimitval) {
	$('#page').val('');
	$('#plimit').val(pagelimitval);
	$("#houseIndex").submit();
}

function clearsearch() {
	$('#plimit').val(50);
	$('#page').val('');
	$('#staffsort').val('');
	$('#sortOrder').val('asc'); 
	$('#singlesearch').val('');
	$('#employeeno').val('');
	$('#employeename').val('');
	$('#startdate').val('');
	$('#enddate').val('');
	$('#searchmethod').val('');
	$('#msearchempid').val('');
	$("#employeefrm").submit();
}

function houseRegister(userId){
	var mainmenu = $('#mainmenu').val();
	$('#userId').val(userId);
	$('#houseIndex').attr('action', 'addEdit?mainmenu='+mainmenu+'&time='+datetime);
	$("#houseIndex").submit();
}

function validate(file) {
	var ext = file.split(".");
	ext = ext[ext.length-1].toLowerCase();
	var arrayExtensions = ["jpg" , "jpeg", "png"];
	if (arrayExtensions.lastIndexOf(ext) == -1) {
		alert("Please select image format.");
		$("#image1").val("");
		$("#imgfile").val("");
	}
	$("#file_name_temp").val("");
	$("#file_type").val("");
	$('#prevDoc').prop("checked",false);
	$("#prevDocName").text("");
}

function validateImgPDF(file) {
	var ext = file.split(".");
	ext = ext[ext.length-1].toLowerCase();
	var arrayExtensions = ["jpg", "jpeg", "png", "pdf"];
	if (arrayExtensions.lastIndexOf(ext) == -1) {
		alert("Please select image format or Pdf File.");
		$("#image1").val("");
		$("#imgfile").val("");
	}
}

function houseCancel(viewFlg) {
	var mainmenu = $("#mainmenu").val();
	if (cancel_check == false) {
		swal({
			title: msg_cancel,
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function(isConfirm) {
			if (isConfirm) {
				pageload();
				$('#houseAddEditcancel').attr('action', viewFlg+'?mainmenu='+mainmenu+'&time='+datetime);
				$("#houseAddEditcancel").submit();
			} else {
				return false;
			}
		});
	} else {
		pageload();
		$('#houseAddEditcancel').attr('action', viewFlg+'?mainmenu='+mainmenu+'&time='+datetime);
		$("#houseAddEditcancel").submit();
	}
}

function goToIndex(){
	$("#houseId").val("");
	var mainmenu = $('#mainmenu').val();
	$('#houseView').attr('action', 'index?mainmenu='+mainmenu+'&time='+datetime);
	$("#houseView").submit();
}

function fnViewHouse(houseId,userId){
	$("#houseId").val("");
	$("#houseId").val(houseId);
	$("#userId").val(userId);
	var mainmenu = $('#mainmenu').val();
	$('#houseIndex').attr('action', 'view?mainmenu='+mainmenu+'&time='+datetime);
	$("#houseIndex").submit();
}

function fnEditHouse(houseId,userId){
	$("#houseId").val(houseId);
	$("#userId").val(userId);
	$('#editChk').val(1);
	var mainmenu = $('#mainmenu').val();
	$('#houseView').attr('action', 'addEdit?mainmenu='+mainmenu+'&time='+datetime);
	$("#houseView").submit();
}
// Download Process
function download(file,path) {
	var confirm_download = "Do You Want To Download?";
	if(confirm(confirm_download)) {
		window.location.href = "../app/Http/Common/downloadfile.php?file="+file+"&path="+path+"/";
	}
}

function setHouseName(orderId){
	if (orderId != "") {
		$.ajax({
			type:"GET",
			dataType: "JSON",
			url: 'getBuildingName',
			data: {
				orderId: orderId,
			},
			success: function(data) { // What to do if we succeed
				$("#houseName").val(data);
			},
			error: function(data) {
				alert('there was a problem checking the fields');
			}
		});
	} else {
		$("#houseName").val("");
	}
}

function setHouseNo(val){
	var name = $("#houseName").val();
	if (name != "") {
		name = name +" - "+val+"号";
		$("#houseName").val(name);
	}
}

// Upload Image For Category
function fnUpload() {
	var mainmenu = $("#mainmenu").val();
	var userId = $("#userId").val();
	var houseId = $("#houseId").val();
	$('#uploadPopup').load('uploadImgPopup?mainmenu='+mainmenu+'&time='+datetime+'&userId='+userId+'&houseId='+houseId);
	$("#uploadPopup").modal({
		backdrop: 'static',
		keyboard: false
	});
	$('#uploadPopup').modal('show');
}

function fnGetSubImgName(){
	$('#subImageId').find('option').not(':first').remove();
	var mainmenu = $('#mainmenu').val();
	var mainImageId = $('#mainImageId').val();
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'subImageId_ajax',
		data: {"mainImageId": mainImageId,"mainmenu": mainmenu},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#subImageId').append('<option value="'+resp[i]["id"]+'">'+resp[i]["imageName"]+'</option>' );
				// $('select[name="subImageId"]').val(resp[i]["id"]);
			}
		},
		error: function(data) {
			alert(data.status);
		}
	});
}

function mainplus(maincategory) {
	var mainmenu = $('#mainmenu').val();
	$('#mainPlus'+maincategory).attr("style", "display: none");
	$('#mainMins'+maincategory).attr("style", "display: inline-block");
	$('#mainMins'+maincategory).attr("style", "cursor: pointer");
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'subImageId_ajax',
		data: {"mainImageId": maincategory,"mainmenu": mainmenu},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#sub'+maincategory+resp[i]["id"]).attr("style", "display: inline-block");
				$('#subPlus'+maincategory+resp[i]["id"]).attr("style", "cursor: pointer");
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function mainmins(maincategory) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	var houseId = $('#houseId').val();
	$('#mainMins'+maincategory).attr("style", "display: none");
	$('#mainPlus'+maincategory).attr("style", "display: inline-block");
	$('#mainPlus'+maincategory).attr("style", "cursor: pointer");
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'subImageId_ajax',
		data: {"mainImageId": maincategory,"mainmenu": mainmenu},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#sub'+maincategory+resp[i]["id"]).attr("style", "display: none");
				$('#subMins'+maincategory+resp[i]["id"]).attr("style", "display: none");
				$('#subPlus'+maincategory+resp[i]["id"]).attr("style", "display: inline-block");
				$('#subPlus'+maincategory+resp[i]["id"]).attr("style", "cursor: pointer");
				var subcategory = resp[i]["id"];
				$.ajax({
					type: 'GET',
					dataType: "JSON",
					url: 'subMainImageName_ajax',
					data: {
						"mainmenu": mainmenu,
						"userId": userId,
						"houseId": houseId,
						"maincategory": maincategory,
						"subcategory": subcategory
					},
					success: function(resp) {
						for (i = 0; i < resp.length; i++) {
							$('#file'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "display: none");
						}
					},
					error: function(data) {
						// alert(data.status);
					}
				});
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function subplus(maincategory,subcategory) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	var houseId = $('#houseId').val();
	var category = maincategory+subcategory;
	$('#subPlus'+category).attr("style", "display: none");
	$('#subMins'+category).attr("style", "display: inline-block");
	$('#subMins'+category).attr("style", "cursor: pointer");
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'subMainImageName_ajax',
		data: {
			"mainmenu": mainmenu,
			"userId": userId,
			"houseId": houseId,
			"maincategory": maincategory,
			"subcategory": subcategory
		},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#file'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "display: inline-block");
				$('#filelink'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "cursor: pointer");
				$('#filelink'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "text-decoration: none !important");
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function submins(maincategory,subcategory) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	var houseId = $('#houseId').val();
	var category = maincategory+subcategory;
	$('#subMins'+category).attr("style", "display: none");
	$('#subPlus'+category).attr("style", "display: inline-block");
	$('#subPlus'+category).attr("style", "cursor: pointer");
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'subMainImageName_ajax',
		data: {
			"mainmenu": mainmenu,
			"userId": userId,
			"houseId": houseId,
			"maincategory": maincategory,
			"subcategory": subcategory
		},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#file'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "display: none");
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function fileImage(fileImage) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	var houseId = $('#houseId').val();
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'AllImageName_ajax',
		data: {
			"mainmenu": mainmenu,
			"userId": userId,
			"houseId": houseId,
		},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				if (resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"] != fileImage) {
					$('#image'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "display: none");
					$('#dwnld'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "display: none");
				} else {
					$('#image'+fileImage).attr("style", "inline-block");
					$('#dwnld'+fileImage).attr("style", "inline-block");
					$('#image'+fileImage).attr("style", "cursor: pointer");
					$('#dwnld'+fileImage).attr("style", "cursor: pointer");
				}
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function fnprevnext(fileImage,imageId,imageFlg) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	var houseId = $('#houseId').val();
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'prevNxtImg_ajax',
		data: {
			"mainmenu": mainmenu,
			"userId": userId,
			"houseId": houseId,
			"imageId": imageId,
			"imageFlg": imageFlg
		},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#image'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "inline-block");
				$('#dwnld'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "inline-block");
				$('#image'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "cursor: pointer");
				$('#dwnld'+resp[i]["mainCategory"]+resp[i]["subCategory"]+resp[i]["id"]).attr("style", "cursor: pointer");
				$('#image'+fileImage).attr("style", "display: none");
				$('#dwnld'+fileImage).attr("style", "display: none");
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function fileImgPopup(fileImage,houseId) {
	var mainmenu = $('#mainmenu').val();
	var userId = $('#userId').val();
	$('#houseId').val(houseId);
	var houseId = $('#houseId').val();
	$('#imgViewPopup').load('imgViewPopup?mainmenu='+mainmenu+'&time='+datetime+'&userId='+userId+'&houseId='+houseId+'&fileImage='+fileImage);
	$("#imgViewPopup").modal({
		backdrop: 'static',
		keyboard: false
	});
	$('#imgViewPopup').modal('show');
}

function getHouAddBuildOn() {
	var mainmenu = $('#mainmenu').val();
	var buildingId = $('#buildingName').val();
	$.ajax({
		type: 'GET',
		dataType: "JSON",
		url: 'buildingId_ajax',
		data: {"buildingId": buildingId,"mainmenu": mainmenu},
		success: function(resp) {
			for (i = 0; i < resp.length; i++) {
				$('#address').val(resp[i]["buildingAddress"]);
				$('#houseBuildOn').val(resp[i]["buildOnDate"]);
			}
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

function fnMemoReg() {
	var mainmenu = $('#mainmenu').val();
	$('#houseView').attr('action', 'memoReg?mainmenu='+mainmenu+'&time='+datetime);
	$("#houseView").submit();
}

function memoCancel() {
	var mainmenu = $("#mainmenu").val();
	if (cancel_check == false) {
		swal({
			title: msg_cancel,
			type: "warning",
			showCancelButton: true,
			confirmButtonClass: "btn-danger",
			closeOnConfirm: true,
			closeOnCancel: true
		},
		function(isConfirm) {
			if (isConfirm) {
				pageload();
				$('#houseMemoReg').attr('action', 'view?mainmenu='+mainmenu+'&time='+datetime);
				$("#houseMemoReg").submit();
			} else {
				return false;
			}
		});
	} else {
		pageload();
		$('#houseMemoReg').attr('action', 'view?mainmenu='+mainmenu+'&time='+datetime);
		$("#houseMemoReg").submit();
	}
}