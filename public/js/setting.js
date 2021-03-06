var data = {};
// Singletext popup view process
function settingpopupsinglefield(screen_name,tablename,tableselect) {
	var mainmenu = $('#mainmenu').val();
	$("#screenname").val(screen_name);
	var req = "?screen_name="+screen_name+
				"&tablename="+tablename;
	if (screen_name == "singletextpopup") {
		$('#showpopup').load('../Setting/singletextpopup?screen_name='+screen_name+'&tablename='+tablename);
		$("#showpopup").modal({
			backdrop: 'static',
			keyboard: false
		});
		$('#showpopup').modal('show');
	} else if (screen_name == "selecttextpopup") {
		$('#showpopup').load('../Setting/selecttextpopup?screen_name='+screen_name+'&tablename='+tablename+'&tableselect='+tableselect);
		$("#showpopup").modal({
			backdrop: 'static',
			keyboard: false
		});
		$('#showpopup').modal('show');
	} else if (screen_name == "twotextpopup") {
		$('#showpopup').load('../Setting/twotextpopup?screen_name='+screen_name+'&tablename='+tablename);
		$("#showpopup").modal({
		   backdrop: 'static',
			keyboard: false
		});
		$('#showpopup').modal('show');
	} else {
		$('#showpopup').load('../Setting/threetextpopup?screen_name='+screen_name+'&tablename='+tablename);
		$("#showpopup").modal({
			backdrop: 'static',
			keyboard: false
		});
		$('#showpopup').modal('show');
	}
}

// All popup cancel check
function divpopupclose() {
	if (!cancel_check) {
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
				$( "body div" ).removeClass( "modalOverlay" );
				$( '#showpopup' ).empty();
				$('#showpopup').modal('toggle');
			} else {
				return false;
			}
		});
	} else {
		$( "body div" ).removeClass( "modalOverlay" );
		$( '#showpopup' ).empty();
		$('#showpopup').modal('toggle');
	}
}

// Single text popup Add edit process
function fnaddeditsinglefield(location,mainmenu,tablename,flag,messageflag) {
	var mainmenu = $('#mainmenu').val();
	$("#popupsessionnotuse").css("display", "none");
	$("#popupsessionuse").css("display", "none");
	if($("#textbox1").val()==""){
		$("#empty_textbox1").show(); 
		$("#textbox1").focus();
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} else if($("#textbox1").val()!=""){
		$("#empty_textbox1").hide(); 
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
		var opr = $('#process').val();
		var messageflags = $('#flashmessage').val(messageflag)
		var textbox1 =  $('#textbox1').val();
		$('#textbox1').val(textbox1);
		$('#location').val(location);
		$('#tablename').val(tablename);
		$('#flag').val(flag);
		var editid = $('#rdoid').val();
		$.ajax({
			async: true,
			type: 'GET',
			url: "Already_Exists",
			data: {"textbox1": textbox1,"mainmenu": mainmenu,"tablename": tablename,"id": editid,"flag": flag},
			success: function(data) {
				$("#existsChk_textbox1").hide();
				if (data == 0) {
					if ($('#process').val() == 1) {
						var err_cnfirm = msg_add;
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
						var url = 'SingleFieldaddedit';
						$.ajax({
							async: true,
							type: 'GET',
							url: url,
							data: {"textbox1": textbox1,"location": location,"mainmenu": mainmenu,"tablename": tablename,"id": editid,"flag": flag},
							success: function(data) {
								if (data != "") {
									var res = $.parseJSON(data);
									var orderid = res.orderid;
									var totalid = res.totalid;
									var data = orderid;
									var valid = totalid-1;
									var actualid = res.actualid;
									$('#textbox1').val('');
									if(opr == 1) {
										if(mainmenu == "menu_setting"){
											var tempdata= parseInt(data)+1;
											var data='<tr class="h37" onclick="fnrdocheck(\''+textbox1+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\')"><td class="tac" title="Select"><input type = "radio" name="rdoedit" id="rdoedit'+data+'" class="h13 w13" onclick="fnrdocheck(\''+textbox1+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\');"><input id="rdoid" name="rdoid" type="hidden" value="'+data+'"><input id="idOriginalOrder" name="idOriginalOrder" type="hidden" value="'+actualid+'"><input id="id" name="id" type="hidden" value="'+totalid+'"></td><td class="text-center pt7" title="S.No">'+data+'</td><td class="pl7 pt7" id="dataname'+totalid+'">'+textbox1+'</td><td class="tac pt7" title="Use/Not Use"><a href="javascript:useNotuse(\''+totalid+'\',\''+tempdata+'\');" class="btn-link" style="color:blue;"><label class="btn-link" id="usenotuselabel'+tempdata+'" data-type="0" style="color: blue;">Use</label></a><input id="curtFlg'+tempdata+'" name="curtFlg'+tempdata+'" type="hidden" value="1"><input id="editid'+tempdata+'" name="editid'+tempdata+'" type="hidden" value="'+totalid+'"></td></tr>';
											$('#swaptable1 tr:last').after(data);
											$("#popupsessionreg").css("display", "block");
											$("#popupsessionupd").css("display", "none");
										} else {
											alert('Inserted Successfully');
											window.location.reload();
										}
									} else {
										if(mainmenu == "menu_setting"){
											$("#dataname"+editid).text(textbox1);
											$("#add_var").show();
											$("#update_var").hide();
											$('#process').val(1);
											$("#popupsessionupd").css("display", "block");
											$("#popupsessionreg").css("display", "none");
										} else {
											alert('Updated Successfully');
											window.location.reload();
										}
									}
									var rowCount = $('#swaptable1 tr').length;
									if ($('#swaptable1 tr').hasClass('nodata')) {
										$('#swaptable1 tr:first').remove();
									}
								}
							},
							error: function(data) {
							}
						});
					}
				});
				} else {
					$("#existsChk_textbox1").show(); 
					$("#textbox1").focus();
					$("#popupsessionreg").css("display", "none");
					$("#popupsessionupd").css("display", "none");
				}
			},
			error: function(data) {
			}
		});
	}
}

// Single text popup radio button check
function fnrdocheck(textbox1,editid,totalcount,val) {
	var rowCount = $('#swaptable1 tr').length;
	$('#hid_txtval').val(textbox1);
	$('#rdoid').val(editid);
	// EDIT BUTTON ENABLE
	if(rowCount == 1) {
		document.getElementById("edit").disabled = false;
		$("#edit").css("background-color","#f2aa10");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
		document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");
	} else {
		document.getElementById("edit").disabled = false;
		$("#edit").css("background-color","#f2aa10");
		document.getElementById("dwnArrow").disabled = false;
		$("#dwnArrow").css("color","#5cb85c");
		document.getElementById("upArrow").disabled = true;
		$("#rdoedit"+editid).attr("checked", true);
		$("#edit").css("background-color","#f2aa10");
		updownArrowEnableDisable(val, totalcount);
	}
	
}
function updownArrowEnableDisable(val, totalcount) {
	if (val == 0) {
		document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");
		document.getElementById("dwnArrow").disabled = false;
		// $("#dwnArrow").css("background-color","#5cb85c");
	} else if (val == totalcount-1) {
		document.getElementById("upArrow").disabled = false;
		$("#upArrow").css("color","#5cb85c");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
	} else {
		// enable_arrow();
		document.getElementById("dwnArrow").disabled = false;
		document.getElementById("upArrow").disabled = false;
		$("#dwnArrow").css("color","#5cb85c");
		$("#upArrow").css("color","#5cb85c");
	}
}
// Single text popup edit check
function fneditcheck() {
	$("#existsChk_textbox1").hide();
	$("#empty_textbox1").hide(); 
	$("#popupsessionreg").css("display", "none");
	$("#popupsessionupd").css("display", "none");
	$("#popupsessionnotuse").css("display", "none");
	$("#popupsessionuse").css("display", "none");
	var editid = $('#rdoid').val();
	$("#edit").addClass("CMN_cursor_default");
	$('#process').val(2);
	document.getElementById("edit").disabled = true;
	document.getElementById("dwnArrow").disabled = true;
	document.getElementById("upArrow").disabled = true;
	document.getElementById("commit_button").disabled = true;
	$("#dwnArrow").css("color","#bbb5b5");
	$("#upArrow").css("color","#bbb5b5");
	$("#commit_button").css("background-color","#bbb5b5");
	$("#edit").css("background-color","#bbb5b5");
	$("#add_var").hide();
	$("#update_var").show();
	var dataname = $('#dataname'+editid).text();
	$('#textbox1').val($.trim(dataname));
	$('#hdnprocessid').val(editid);
	$('#textbox1').focus();
	return false;
}
// Single text popup Use and Notuse process
function useNotuse(editid,i) {
	$("#existsChk_textbox1").hide();
	$("#empty_textbox1").hide(); 
	$("#empty_textbox2").hide(); 
	$("#popupsessionreg").css("display", "none");
	$("#popupsessionupd").css("display", "none");
	var tablename =  $('#tablename').val();
	var editid =  $('#editid'+i).val();
	var curtFlg =  $("#usenotuselabel"+i).attr('data-type');
	var url = 'useNotuse';
	$.ajax({
		async: true,
		type: 'GET',
		url: url,
		data: {"tablename": tablename,"editid": editid,"curtFlg": curtFlg },
		success: function(data) {
			if(curtFlg==1) {
				$("#usenotuselabel"+i).text('Use');
				$("#usenotuselabel"+i).css('color','blue');
				$("#usenotuselabel"+i).attr('data-type','0');
				$("#usenotuseanchor"+i).css('text-decoration', 'none');
				$("#popupsessionnotuse").css("display", "none");
				$("#popupsessionuse").css("display", "block");
			} else {
				$("#usenotuselabel"+i).text('Not Use');
				$("#usenotuselabel"+i).css('color','red');
				$("#usenotuselabel"+i).attr('data-type','1');
				$("#usenotuseanchor"+i).css('text-decoration', 'none');
				$("#popupsessionnotuse").css("display", "block");
				$("#popupsessionuse").css("display", "none");
			}
		},
		error: function(data) {
		}
	});
}

// Two field popup Edit check
function fneditchecktwofield() {
	$("#existsChk_textbox1").hide();
	$("#empty_textbox1").hide(); 
	$("#empty_textbox2").hide(); 
	$("#popupsessionreg").css("display", "none");
	$("#popupsessionupd").css("display", "none");
	$("#popupsessionnotuse").css("display", "none");
	$("#popupsessionuse").css("display", "none");
	var editid = $('#rdoid').val();
	$("#edit").addClass("CMN_cursor_default");
	$('#process').val(2);
	document.getElementById("edit").disabled = true;
	document.getElementById("dwnArrow").disabled = true;
	document.getElementById("upArrow").disabled = true;
	 document.getElementById("commit_button").disabled = true;
	$("#edit").css("background-color","#bbb5b5");
	$("#dwnArrow").css("color","#bbb5b5");
	$("#upArrow").css("color","#bbb5b5");
	$("#commit_button").css("background-color","#bbb5b5");
	$("#add_var").hide();
	$("#update_var").show();
	var dataname1 = $('#dataname1'+editid).text();
	var dataname2 = $('#dataname2'+editid).text();
	$('#textbox1').val($.trim(dataname1));
	$('#textbox2').val($.trim(dataname2));
	$('#hdnprocessid').val(editid);
	$('#textbox1').focus();
	return false;
}
// Two field popup Radio check
function fnrdochecktwofield(textbox1,textbox2,editid,scroolid,totalcount,val) {
	var rowCount = $('#swaptable1 tr').length;
	$('#hid_txtval').val(textbox1);
	$('#hid_txt2val').val(textbox2);
	$('#rdoid').val(editid);
	$('#scrollval').val(scroolid);
	if (rowCount == 1) {
		document.getElementById("edit").disabled = false;
		$("#edit").css("background-color","#f2aa10");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
		document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");
	} else {
		// EDIT BUTTON ENABLE
		document.getElementById("edit").disabled = false;
		document.getElementById("dwnArrow").disabled = false;
		$("#dwnArrow").css("color","#5cb85c");
		$("#rdoedit"+editid).attr("checked", true);
		$("#edit").css("background-color","#f2aa10");
		updownArrowEnableDisable(val, totalcount);
	}
}
// Two field popup Addedit process
function fnaddedittwofield(location,mainmenu,tablename,flag) {
	var mainmenu = $('#mainmenu').val();
	var opr=$('#process').val();
	$("#popupsessionnotuse").css("display", "none");
	$("#popupsessionuse").css("display", "none");
	if($("#textbox1").val()==""){
		$("#empty_textbox1").show(); 
		$("#textbox1").focus();
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} else if($("#textbox2").val()==""){
		$("#empty_textbox2").show(); 
		$("#textbox2").focus();
		$("#empty_textbox1").hide(); 
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} else {
		$("#empty_textbox1").hide(); 
		$("#empty_textbox2").hide(); 
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
		var textbox1 =  $('#textbox1').val();
		$('#textbox1').val(textbox1);
		var textbox2 =  $('#textbox2').val();
		$('#textbox2').val(textbox2);
		$('#location').val(location);
		$('#tablename').val(tablename);
		$('#flag').val(flag);
		var editid = $('#rdoid').val();
		var hdnprocessid = $('#hdnprocessid').val();
		$.ajax({
			async: true,
			type: 'GET',
			url: "getdataexisttwotextpopup",
			data: {"textbox1": textbox1,
					"textbox2": textbox2,
					"mainmenu": mainmenu,
					"tablename": tablename,
					"editid": hdnprocessid,
					"id": editid,
					"flag": flag
				},
			success: function(data) {
							$("#existsChk_textbox1").css("display", "block");
							if (data == 0) {
								$("#existsChk_textbox1").css("display", "none");
								if ($('#process').val() == 1) {
									var err_cnfirm = msg_add;
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
									var url = 'twoFieldaddedit';
									$.ajax({
										async: true,
										type: 'GET',
										url: url,
										data: {"textbox1": textbox1,
												"textbox2": textbox2,
												"location": location,
												"mainmenu": mainmenu,
												"tablename": tablename,
												"id": editid,
												"flag": flag
											},
										success: function(data) {
											if (data != "") {
												// $('#swaptable1 tr:last').remove();
												$('#textbox1').val('');
												$('#textbox2').val('');

												if(opr==1) {
													if(mainmenu == "menu_setting"){
														var tempdata = parseInt(data)+1;
														var res = $.parseJSON(data);
														var orderid = res.orderid;
														var totalid = res.totalid;
														var actualid = res.actualid;
														var tempdata = res.orderid + 1;
														var valid = totalid-1;
														var data = orderid;
														var data='<tr class="h37"><td class="tac" title="Select"><input type = "radio" name="rdoedit" id="rdoedit'+totalid+'" class="h13 w13" onclick="fnrdochecktwofield(\''+textbox1+'\',\''+textbox2+'\',\''+totalid+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\');"><input id="rdoid" name="rdoid" type="hidden" value="'+data+'"><input id="idOriginalOrder" name="idOriginalOrder" type="hidden" value="'+actualid+'"><input id="id" name="id" type="hidden" value="'+totalid+'"></td><td class="text-center pt7" title="S.No">'+data+'</td><td class="pl7 pt7" id="dataname1'+data+'">'+textbox1+'</td><td class="pl7 pt7" id="dataname2'+data+'">'+textbox2+'</td><td class="tac pt7" title="Use/Not Use"><a href="javascript:useNotuse(\''+data+'\',\''+tempdata+'\');" class="btn-link" style="color:blue;"><label class="btn-link" id="usenotuselabel'+tempdata+'" data-type="0" style="color: blue;">Use</label></a><input id="curtFlg'+tempdata+'" name="curtFlg'+tempdata+'" type="hidden" value="1"><input id="editid'+tempdata+'" name="editid'+tempdata+'" type="hidden" value="'+data+'"></td></tr>';
														$('#swaptable1 tr:last').after(data);
														$("#popupsessionreg").css("display", "block");
														$("#popupsessionupd").css("display", "none");
														$("#swaptable1 tr:last").css('cursor', 'hand');
													} else {
														alert('Inserted Successfully');
														window.location.reload();
													}
												} else {
													if(mainmenu == "menu_setting"){
														$("#dataname1"+editid).text(textbox1);
														$("#dataname2"+editid).text(textbox2);
														$("#add_var").show();
														$("#update_var").hide();
														$('#process').val(1);
														$("#popupsessionupd").css("display", "block");
														$("#popupsessionreg").css("display", "none");
													} else {
														alert('Updated Successfully');
														window.location.reload();
													}
												}
												var rowCount = $('#swaptable1 tr').length;
												if ($('#swaptable1 tr').hasClass('nodata')) {
													$('#swaptable1 tr:first').remove();
												}
											}
										},
										error: function(data) {
										}
									});
								}
							});
							} 
			},
			error: function(data) {
			}
		});
	}
}
function resetErrors() {
	$('form input, form select, form radio, form textarea').css("border-color", "");
	$('form input').removeClass('inputTxtError');
	$('label.error').remove();
}
function fnaddeditselecttextfield(tablename,flag) {
	var mainmenu = $('#mainmenu').val();
	resetErrors();
	$tbl_select = $('#table_sel').val();
	$.each($('form input, form select'), function(i, v) {
			data[v.name] = v.value;
	});
	$.ajax({
		async: false,
		dataType:'json',
		type: 'GET',
		url: 'formValidationforsingletext',
		data: data,
		success: function(resp) {
			// alert(JSON.stringify(resp));
			if (resp === true) {
				var opr=$('#process').val();
				if ($('#process').val() == 1) {
					$('#hdnprocessid').val(0);
					var err_cnfirm = msg_add;
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
					if (isConfirm) {
						var selectbox1 = $('#selectbox1').val();
						var textbox1 = $('#textbox1').val();
						$('#selectbox1').val(selectbox1);
						$('#textbox1').val(textbox1);
						$('#tablename').val(tablename);
						$('#flag').val(flag);
						var hdnprocessid = $('#hdnprocessid').val();
						var editid = $('#rdoid').val();
						$.ajax({
							type: 'POST',
							url: 'existforselecttext',
							data: {"textbox1": textbox1,
									"selectbox1": selectbox1,
									"editid": hdnprocessid,
									"flag": flag,
									"tablename": tablename},
							success: function(resp) {
								// alert(resp);
								if (resp > 0) { 
									$("#popupsessionexist").css("display", "block");
									$("#popupsessionupd").css("display", "none");
									$("#popupsessionreg").css("display", "none");
									return false;
								} else {
									$.ajax({
										async: true,
										type: 'GET',
										url: 'SelecttextFieldaddedit',
										data: {"textbox1": textbox1,"selectbox1": selectbox1,"tablename": tablename,"id": editid,"flag": flag},
										success: function(data) {
											// settingpopupsinglefield('selecttextpopup',tablename,$tbl_select);
											if (data != "") {
												var res = $.parseJSON(data);
												var orderid = res.orderid;
												var totalid = res.totalid;
												var actualid = res.actualid;
												var data = orderid;
												var valid = totalid-1;
												$('#selectbox1').val('');
												$('#textbox1').val('');
												if(opr==1) {
													if(mainmenu == "menu_setting"){
														$('.rdoedit').prop('checked', false);
														var tempdata= parseInt(data)+1;
														var tempselecctvalue=$("#selectbox1 option[value="+selectbox1+"]").text();
														var data='<tr class="colortds" id=rowcolor'+totalid+' onclick="fnrdocheckforselecttext(\''+selectbox1+'\',\''+textbox1+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\')"><td class="tac" title="Select"><input type = "radio"" name="rdoedit" id="rdoedit'+totalid+'" class="h13 w13" onclick="fnrdocheckforselecttext(\''+tempselecctvalue+'\',\''+textbox1+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\');"><input id="rdoid" name="rdoid" type="hidden" value="'+data+'"><input id="idOriginalOrder" name="idOriginalOrder" type="hidden" value="'+actualid+'"><input id="id" name="id" type="hidden" value="'+totalid+'"></td><td class="text-center" title="S.No">'+data+'</td><td class="pl7" id="datanametd2'+totalid+'">'+tempselecctvalue+'<input type="hidden" name="hiddenselectvalue" id="dataname1'+totalid+'" value="'+selectbox1+'"></td><td class="pl7" id="dataname2'+totalid+'">'+textbox1.charAt(0).toUpperCase() + textbox1.slice(1)+'</td><td class="tac" title="Use/Not Use"><a href="javascript:useNotuse(\''+totalid+'\',\''+tempdata+'\');" class="btn-link" style="color:blue;"><label class="btn-link" id="usenotuselabel'+tempdata+'" data-type="0" style="color: blue;">Use</label></a><input id="curtFlg'+tempdata+'" name="curtFlg'+tempdata+'" type="hidden" value="1"><input id="editid'+tempdata+'" name="editid'+tempdata+'" type="hidden" value="'+totalid+'"></td></tr>'; 
														$('#swaptable1 tr:last').after(data);
														$("#popupsessionreg").css("display", "block");
														$("#popupsessionupd").css("display", "none");
														$("#popupsessionexist").css("display", "none");
														$("#swaptable1 tr:last").css('cursor', 'hand');
														$(".setcolor tr:even").css("background-color", "#F9F9F9");
														$(".setcolor tr:odd").css("background-color", "#DCE3F4");
														$('.setcolor #rowcolor'+totalid).css("background-color", "#d3c8f4");
														$('#scrolloption').scrollTop($('#scrolloption')[0].scrollHeight);
													} else {
														alert('Inserted Successfully');
														window.location.reload();
													}
												} else {
													if(mainmenu == "menu_setting"){
														$('input[id=rdoedit'+editid+']').prop('checked', false);
														var tempselecctvalue=$("#selectbox1 option[value="+selectbox1+"]").text();
														$("#datanametd2"+editid).html('');
														var tempdata=tempselecctvalue+'<input type="hidden" name="hiddenselectvalue" id="dataname1'+editid+'" value="'+selectbox1+'">'
														$("#datanametd2"+editid).html(tempdata);
														$("#dataname2"+editid).text(textbox1);
														$('#dataname1'+editid).val(selectbox1);
														$("#add_var").show();
														$("#update_var").hide();
														$('#process').val(1);
														$("#popupsessionupd").css("display", "block");
														$("#popupsessionreg").css("display", "none");
														$("#popupsessionexist").css("display", "none");
														$(".setcolor tr:even").css("background-color", "#F9F9F9");
														$(".setcolor tr:odd").css("background-color", "#DCE3F4");
														$('.setcolor #rowcolor'+editid).css("background-color", "#d3c8f4");
														var ypos = $('#swaptable1 tr:eq('+editid+')').offset();
															ypos = ypos-200;
															// Go to row
															$('#scrolloption').animate({
																scrollTop: $('#scrolloption').scrollTop()+ypos
															}, 500);
													   cancel_check = true;
													} else {
														alert('Inserted Successfully');
														window.location.reload();
													}
												}
												var rowCount = $('#swaptable1 tr').length;
												if ($('#swaptable1 tr').hasClass('nodata')) {
													$('#swaptable1 tr:first').remove();
												}

											}
										},
										error: function(data) {
											// alert(data);
										}
									});
								}
							},
							error: function(data) {
								// alert(data);
							}
						});
					} else {
						return false;
					}
				});
			} else {
				$.each(resp, function(i, v) {
					//  alert(i + " => " + v); // view in console for error messages
					var msg = '<label class="error pl5 pm0" style="color:#9C0000;display:inline-block;" for="'+i+'">'+v+'</label>';
					if ($('input[name="' + i + '"]').hasClass('selectbox1')) {
						$('input[name="' + i + '"]').addClass('inputTxtError');
						$('.selectbox1_err').append(msg);
					} else if ($('input[name="' + i + '"]').hasClass('textbox1')) {
						$('input[name="' + i + '"]').addClass('inputTxtError');
						$('.textbox1_err').append(msg);
					} else {
						$('input[name="' + i + '"], select[name="' + i + '"]').addClass('inputTxtError').after(msg);
					}
				});
				var keys = Object.keys(resp);
				$('select[name="'+keys[0]+'"]').focus();
				$('input[name="'+keys[0]+'"]').focus();
				data = {};
			}
			
		},
		error: function(resp) {
			// alert(resp.status);
		}
	});	
}
function fneditcheckforselecttext() {
	var editid = $('#rdoid').val();
	$("#edit").addClass("CMN_cursor_default");
	$('#process').val(2);
	document.getElementById("edit").disabled = true;
	document.getElementById("dwnArrow").disabled = true;
	document.getElementById("upArrow").disabled = true;
	document.getElementById("commit_button").disabled = true;
	$("#edit").css("background-color","#bbb5b5");
	$("#dwnArrow").css("color","#bbb5b5");
	$("#upArrow").css("color","#bbb5b5");
	$("#commit_button").css("background-color","#bbb5b5");
	$("#add_var").hide();
	$("#update_var").show();
	var dataname1 = $('#dataname1'+editid).val();
	var dataname1 = $.trim(dataname1);
	var dataname2 = $('#dataname2'+editid).text();
	var dataname2 = $.trim(dataname2);
	$('#selectbox1').val(dataname1);
	$('#textbox1').val(dataname2);
	$('#hdnprocessid').val(editid);
	$('#selectbox1').focus();
	return false;
}
function fnrdocheckforselecttext(textbox1,selectbox1,editid,totalcount,val) {
	$('#hid_selectval').val(selectbox1);
	$('#hid_txtval').val(textbox1);
	$('#rdoid').val(editid);
	// val = document.getElementById("hdnNewOrderid_"+val).value;
	var rowCount = $('#swaptable1 tr').length;
	if (rowCount == 1) {
		document.getElementById("edit").disabled = false;
		$("#edit").css("background-color","#f2aa10");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
		document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");
	} else {
		// EDIT BUTTON ENABLE
		document.getElementById("edit").disabled = false;
		document.getElementById("dwnArrow").disabled = false;
		$("#dwnArrow").css("color","#5cb85c");
		document.getElementById("upArrow").disabled = true;
		$("#rdoedit"+editid).attr("checked", true);
		$("#edit").css("background-color","#f2aa10");
		updownArrowEnableDisable(val, totalcount);
	}
}
// setting UpArrow Process
function getupdata(){
	Commit_buttonenable();
	var upid = document.getElementsByName("rdoedit");
	var radioLength = upid.length;
	$("#commit_button").css("background-color","#5cb85c");
	document.getElementById('dwnArrow').disabled=false;
	$("#dwnArrow").css("color","#5cb85c");
	for(var i = 0; i <radioLength; i++) {
		if (upid[i].checked) {
			selid =  i;
		}
	}
	var checkid = selid+1;
	if (selid > 0){
		exchange(selid,selid-1,'swaptable1');
		document.getElementsByName('hdnNewOrderid')[(selid-1)].value = document.getElementsByName('hdnNewOrderid')[selid].value;
		document.getElementsByName('hdnNewOrderid')[selid].value = (document.getElementsByName('hdnNewOrderid')[(selid-1)].value)-(-1) ;
		if (selid ==1){
			document.getElementById('upArrow').disabled=true;
			$("#upArrow").css("color","#bbb5b5");
			$("#commit_button").css("background-color","#5cb85c");
		}
		if (selid != radioLength) {
			document.getElementById('dwnArrow').disabled=false;
			$("#dwnArrow").css("color","#5cb85c");
		}
	}else { 
		return false;
	}
}

function Commit_buttonenable() {
	document.getElementById("commit_button").disabled = false;
}

//setting Down Arrow process
function getdowndata(){
	//GO TO COMMIT ENABLE
	Commit_buttonenable();
	// 
	document.getElementById("upArrow").disabled = false;
	$("#upArrow").css("color","#5cb85c");
	var upid = document.getElementsByName("rdoedit");
	var radioLength = upid.length;
	for(var i = 0; i <radioLength; i++) {
		if (upid[i].checked) {
			selid =  i;         
		}
	};
	if (selid+1 == radioLength-1) {
		$("#commit_button").css("background-color","#5cb85c");
		document.getElementById("upArrow").disabled = false;
		$("#upArrow").css("color","#5cb85c");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
	} else {
		document.getElementById("dwnArrow").disabled = false;
		$("#commit_button").css("background-color","#5cb85c");
		document.getElementById("upArrow").disabled = false;
	}

	if (selid < radioLength-1){
		exchange(selid,selid+1,'swaptable1');
		document.getElementsByName('hdnNewOrderid')[(selid+1)].value = document.getElementsByName('hdnNewOrderid')[selid].value;
		document.getElementsByName('hdnNewOrderid')[selid].value = (document.getElementsByName('hdnNewOrderid')[(selid+1)].value) - 1;
		document.getElementById('upArrow').disabled=false;
		if (selid == radioLength-2){
			// enable_disable_arrow('upArrow','dwnArrow');
			document.getElementById('dwnArrow').disabled=true;
		}
	} else {   
		return false;
	}
}

function exchange(i, j,tableID){
	var oTable = document.getElementById(tableID);
	var trs = oTable.tBodies[0].getElementsByTagName("tr");
	if (i >= 0 && j >= 0 && i < trs.length && j < trs.length)
	{
		if (i == j+1) {
			oTable.tBodies[0].insertBefore(trs[i], trs[j]);         
		} else if (j == i+1) {
			oTable.tBodies[0].insertBefore(trs[j], trs[i]);
		} else {
			var tmpNode = oTable.tBodies[0].replaceChild(trs[i], trs[j]);
			if (typeof(trs[i]) != "undefined") {
				oTable.tBodies[0].insertBefore(tmpNode, trs[i]);
			} else {
				oTable.appendChild(tmpNode);
			}
		}
	}
	else
	{
		swal({
			title: "invalid values",
			type: "info",
		})
	}
}

// for commit 
function getcommitCheck(tablename,screenname,tableselect) {
	var idnew = "";
	var actualId =  $('#idOriginalOrder').val();
	var id = $("[name=id]");
	var upid = $("[name=rdoedit]");
	var radioLength = upid.length;
	$('#process').val(4);
	for(var i = 0; i <radioLength; i++) {
		if (i == (radioLength-1)) {
			idnew += id[i].value;
		} else {
			idnew += id[i].value+',';
		}   
	}
	swal({
		title: "Do You Want To Commit",
		type: "warning",
		showCancelButton: true,
		confirmButtonClass: "btn-danger",
		closeOnConfirm: true,
		closeOnCancel: true
	},
	function(isConfirm) {
		if (isConfirm) {
			 fnsettingcommitajax(actualId,idnew,tablename,screenname,tableselect);
		} else {
			return false;
		}
	});
}
function fnsettingcommitajax(actualId,idnew,tablename,screenname,tableselect){
	$.ajax({
		async: true,
		type: 'GET',
		url: 'commitProcess',
		data: {"actualId": actualId,"idnew": idnew,"tablename": tablename},
		success: function(data) {
				$("#popupsessioncommit").css("display", "block");
				settingpopupsinglefield(screenname,tablename,tableselect);
		},
		error: function(data) {
			// alert(data.status);
		}
	});
}

// For Sold house - Madasamy 2020/10/01
function soldHouse(viewFlg){

	$('#soldHousePopup').load('soldHousePopup?mainmenu='+mainmenu+'&time='+datetime+'&viewFlg='+viewFlg);
	$("#soldHousePopup").modal({
		backdrop: 'static',
		keyboard: false
	});
	$('#soldHousePopup').modal('show');

}

function myTrim(x) {
	return x.replace(/^\s+|\s+$/gm,'');
}

function fneditcheckthreefield() {
	var editid = $('#rdoid').val();
	$("#edit").addClass("CMN_cursor_default");
	$('#process').val(2);
	document.getElementById("edit").disabled = true;
	$("#edit").css("background-color","#bbb5b5");
	document.getElementById("dwnArrow").disabled = true;
	document.getElementById("upArrow").disabled = true;
	document.getElementById("commit_button").disabled = true;
	$("#dwnArrow").css("color","#bbb5b5");
	$("#upArrow").css("color","#bbb5b5");
	$("#commit_button").css("background-color","#bbb5b5");
	$("#add_var").hide();
	$("#update_var").show();
	var dataname1 = $('#dataname1'+editid).text();
	var dataname2 = $('#dataname2'+editid).text();
	var dataname3 = $('#dataname3'+editid).text();
	$('#textbox1').val($.trim(dataname1));
	$('#textbox2').val($.trim(dataname2));
	$('#textbox3').val($.trim(dataname3));
	$('#hdnprocessid').val(editid);
	$('#textbox1').focus();
	return false;
}
function fnrdocheckthreefield(textbox1,textbox2,textbox3,editid,orderId,totalcount,val) {
	$('#hid_txtval').val(textbox1);
	$('#hid_txt2val').val(textbox2);
	$('#hid_txt3val').val(textbox3);
	$('#rdoid').val(editid);
	/*val =document.getElementById("hdnNewOrderid_"+val).value;*/
	var rowCount = $('#swaptable1 tr').length;
	if (rowCount == 1) {
		document.getElementById("edit").disabled = false;
		$("#edit").css("background-color","#f2aa10");
		document.getElementById("dwnArrow").disabled = true;
		$("#dwnArrow").css("color","#bbb5b5");
		document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");
	} else {
		// EDIT & Commit BUTTON ENABLE
		document.getElementById("edit").disabled = false;
		document.getElementById("dwnArrow").disabled = false;
		$("#dwnArrow").css("color","#5cb85c");
		/*document.getElementById("upArrow").disabled = true;
		$("#upArrow").css("color","#bbb5b5");*/
		$("#rdoedit"+editid).attr("checked", true);
		$("#edit").css("background-color","#f2aa10");
		updownArrowEnableDisable(val, totalcount);
	}
}
// Three field popup Addedit process
function fnaddeditthreefield(location,mainmenu,tablename,flag) {
	var mainmenu = $('#mainmenu').val();
	var opr=$('#process').val();
	$("#popupsessionnotuse").css("display", "none");
	$("#popupsessionuse").css("display", "none");
	if($("#textbox1").val()==""){
		$("#empty_textbox1").show(); 
		$("#textbox1").focus();
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} else if($("#textbox2").val()==""){
		$("#empty_textbox2").show(); 
		$("#textbox2").focus();
		$("#empty_textbox1").hide();
		$("#empty_textbox3").hide();  
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} else if($("#textbox3").val()==""){
		$("#empty_textbox3").show(); 
		$("#textbox3").focus();
		$("#empty_textbox1").hide();
		$("#empty_textbox2").hide(); 
		$("#existsChk_textbox1").hide();
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
	} 
	else {
		$("#empty_textbox1").hide(); 
		$("#empty_textbox2").hide();
		$("#empty_textbox3").hide();  
		$("#popupsessionreg").css("display", "none");
		$("#popupsessionupd").css("display", "none");
		var textbox1 =  $('#textbox1').val();
		$('#textbox1').val(textbox1);
		var textbox2 =  $('#textbox2').val();
		$('#textbox2').val(textbox2);
		var textbox3 =  $('#textbox3').val();
		$('#textbox3').val(textbox3);
		$('#location').val(location);
		$('#tablename').val(tablename);
		$('#flag').val(flag);
		var editid = $('#rdoid').val();
		var hdnprocessid = $('#hdnprocessid').val();
		$.ajax({
			async: true,
			type: 'GET',
			url: "getdataexistthreetextpopup",
			data: {"textbox1": textbox1,
					"textbox2": textbox2,
					"textbox3": textbox3,
					"mainmenu": mainmenu,
					"tablename": tablename,
					"editid": hdnprocessid,
					
					"flag": flag
				},
			success: function(data) {
							$("#existsChk_textbox1").css("display", "block");
							if (data == 0) {
								$("#existsChk_textbox1").css("display", "none");
								if ($('#process').val() == 1) {
									var err_cnfirm = msg_add;
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
									var url = 'ThreeFieldaddedit';
									$.ajax({
										async: true,
										type: 'GET',
										url: url,
										data: {"textbox1": textbox1,
												"textbox2": textbox2,
												"textbox3": textbox3,
												"tablename": tablename,
												"id": editid,
												"flag": flag
											},
										success: function(data) {
											if (data != "") {
												// $('#swaptable1 tr:last').remove();
												$('#textbox1').val('');
												$('#textbox2').val('');
												$('#textbox3').val('');

												if(opr==1) {
													if(mainmenu == "menu_setting"){
														var tempdata = parseInt(data)+1;
														var res = $.parseJSON(data);
														var orderid = res.orderid;
														var totalid = res.totalid;
														var actualid = res.actualid;
														var tempdata = res.orderid + 1;
														var valid = totalid-1;
														var data = orderid;
														var data='<tr class="h37"><td class="tac" title="Select"><input type = "radio" name="rdoedit" id="rdoedit'+totalid+'" class="h13 w13" onclick="fnrdocheckthreefield(\''+textbox1+'\',\''+textbox2+'\',\''+textbox3+'\',\''+totalid+'\',\''+totalid+'\',\''+totalid+'\',\''+valid+'\');"><input id="rdoid" name="rdoid" type="hidden" value="'+data+'"><input id="idOriginalOrder" name="idOriginalOrder" type="hidden" value="'+actualid+'"><input id="id" name="id" type="hidden" value="'+totalid+'"></td><td class="text-center pt7" title="S.No">'+data+'</td><td class="pl7 pt7" id="dataname1'+data+'">'+textbox1+'</td><td class="pl7 pt7" id="dataname2'+data+'">'+textbox2+'</td><td class="pl7 pt7" id="dataname3'+data+'">'+textbox3+'</td><td class="tac pt7" title="Use/Not Use"><a href="javascript:useNotuse(\''+data+'\',\''+tempdata+'\');" class="btn-link" style="color:blue;"><label class="btn-link" id="usenotuselabel'+tempdata+'" data-type="0" style="color: blue;">Use</label></a><input id="curtFlg'+tempdata+'" name="curtFlg'+tempdata+'" type="hidden" value="1"><input id="editid'+tempdata+'" name="editid'+tempdata+'" type="hidden" value="'+data+'"></td></tr>';
														$('#swaptable1 tr:last').after(data);
														$("#popupsessionreg").css("display", "block");
														$("#popupsessionupd").css("display", "none");
														$("#swaptable1 tr:last").css('cursor', 'hand');
													} else {
														alert('Inserted Successfully');
														window.location.reload();
													}
												} else {
													if(mainmenu == "menu_setting"){
														$("#dataname1"+editid).text(textbox1);
														$("#dataname2"+editid).text(textbox2);
														$("#dataname3"+editid).text(textbox3);
														$("#add_var").show();
														$("#update_var").hide();
														$('#process').val(1);
														$("#popupsessionupd").css("display", "block");
														$("#popupsessionreg").css("display", "none");
													} else {
														alert('Updated Successfully');
														window.location.reload();
													}
												}
												var rowCount = $('#swaptable1 tr').length;
												if ($('#swaptable1 tr').hasClass('nodata')) {
													$('#swaptable1 tr:first').remove();
												}
											}
										},
										error: function(data) {
										}
									});
								}
							});
							} else {
								$("#textbox2").focus();
								$("#popupsessionreg").css("display", "none");
								$("#popupsessionupd").css("display", "none");
							}
			},
			error: function(data) {
			}
		});
	}
}