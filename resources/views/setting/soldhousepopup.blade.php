{{ HTML::script(asset('public/js/setting.js')) }}
{{ HTML::script(asset('public/js/footable.js')) }}
{{ HTML::script(asset('public/js/lib/bootstrap-datepicker.min.js')) }}
{{ HTML::style(asset('public/css/lib/bootstrap-datetimepicker.min.css')) }}
{{ HTML::style(asset('public/css/footable.core.css')) }}
<script type="text/javascript">

	$(document).on("click", "#soldTable tr", function(e) {
		if (event.target.className != "relTR") {
			$(this).find('td input:radio').prop('checked', true);
			$('#soldBtn').removeClass('disabled');
			$("#soldDate").val("");
			$("#soldAmount").val("");
			$("#selHouseId").val($("input[type='radio']:checked").val());
		}
	});
		
	$(document).ready(function(){
		setDatePicker("soldDate");

		$('#soldBtn').click(function(){
			$("#valuesDiv").show();
		});

		$('#soldHouseProcess').click(function(){
			$("#soldPopup").validate({
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
					soldDate : {required: true, date: true,correctformatdate: true},
					soldAmount : { required: true }
				},
				submitHandler: function(form) { // for demo
					swal({
						title: msg_sold,
						type: "info",
						showCancelButton: true,
						confirmButtonClass: "btn-danger",
						closeOnConfirm: true,
						closeOnCancel: true
					},
					function(isConfirm) {
						if(isConfirm) {    
							var soldDate = $('#soldDate').val();
							var soldAmount = $('#soldAmount').val();
							var houseId = $('#selHouseId').val();
							$.ajax({
								type: 'GET',
								dataType: "JSON",
								url: 'soldHouseProcess',
								data: {
									"houseId": houseId,
									"soldDate": soldDate,
									"soldAmount": soldAmount,
								},
								success: function(resp) {
									if (resp == "1") {
										alert("Updated Successfully !");
										soldHouse();
									} else {
										alert("Updated UnSuccessfully !");
										soldHouse();
									}
								},
								error: function(data) {
									alert(data.status);
								}
							});


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
		});

	});

	function divpopupclose() {
		if (cancel_check == true) {
			$( "body div" ).removeClass( "modalOverlay" );
			$( '#soldHousePopup' ).empty();
			$('#soldHousePopup').modal('toggle');
		} else {
			if (confirm(cancel_msg)) {
				cancel_check = true;
				$( "body div" ).removeClass( "modalOverlay" );
				$( '#soldHousePopup' ).empty();
				$('#soldHousePopup').modal('toggle');
			} else {
				return false;
			}
		}
	}

</script>
<style type="text/css">

	@media all and (min-width:770px) {
		.modal {
			width:900px;
			position: fixed;
			top: 30% ;
			left: 50%;
		}
		.colschange {
			display: none!important;
		}
		.nodatades {
			display: none!important;
		}
	}

	@media all and (max-width: 768px) {
		.modal {
			position: fixed;
			top: 2% !important;
			left: 1% !important;
		}
		.popupsize {
			margin:auto 18%;
			width:332px;
			height:2%!important;
			margin-left: 4%;
		}
		.soldhead {
			font-size: 80%!important;
		}
		.labeltext {
			font-size: 80%;
			float: left;
			margin-left:-40%!important;
		}
		.labeltextamt {
			font-size: 80%;
			float: left;
			margin-left:-45%!important;
		}
		.heading {
			font-size: 150%;
		}
		.btnsize {
			font-size: 80%;
		}
		.select {
			width: 15%;
		}
		.sno {
			width: 15%;
		}
		.house {
			width: 60%;
		}
		.table-striped {
			width:92%!important;
		}
		.regdes {
			margin-left: -50%;
			width:123%!important;
		}
		.tac {
			font-size: 80%;
		}
		.relTR {
			font-size: 80%;
		}
		.designchange {
			font-size: 70%;
		}
		.colschanges {
			display: none!important;
		}
		.nodatades1 {
			display: none!important;
		}
	}
	
</style>
<div class="popupstyle popupsize">	
<div class="modal-content">

	<!-- To sold House -->
	@if($request->viewFlg == 0)

		<div class="modal-header" style="height: 60px;">
			<button type="button" onclick="divpopupclose();" class="close" style="color: red !important;" aria-hidden="true">&#10006;</button>
			<h2 class="pull-left pl5 mt2 heading">{{ trans('messages.lbl_sold_housereg') }}</h2>
		</div>

		<div>
			<div class="col-md-12 mt10 mb10">
				<a href="javascript:showValues();" id="soldBtn" class="btn btn-danger box130 pull-right disabled">
					<i class="fa fa-money"></i>&nbsp;{{ trans('messages.lbl_sold_housereg') }}
				</a>
			</div>
			<center>
			{{--*/ $overflow = 'overflow-y: scroll;' /*--}}
			{{--*/ $tableWidth = 'width:99.5%;' /*--}}
			{{--*/ $height = 'height:235px;' /*--}}
			<div id="scrolloption" style="<?php echo $overflow;?>;<?php echo $height;?>;<?php echo $tableWidth;?>" >	
				<table class="table tablealter table-bordered table-striped box90per mt15 ml10 mr10 mb30" width="<?php echo $tableWidth;?>">
					<colgroup>
						<col class="select" width="4%">
						<col class="sno" width="4%">
						<col class="house" width="25%">

					</colgroup>
					<thead class="CMN_tbltheadcolor">
						<th class="soldhead">{{ trans('messages.lbl_select')}}</th>
						<th class="soldhead">{{ trans('messages.lbl_sno')}}</th>
						<th class="soldhead">{{ trans('messages.lbl_housename')}}</th>

					</thead>
					<tbody class="tablealternateclr" id="soldTable">

						@php $i = 1; @endphp
						@forelse($houseArr as $belongsTo => $relation)
							<tr style="background-color: #c7e1f7 !important;">
								<td colspan="3" class="relTR" >{{ $belongsTo }}</td>
							</tr>
							@foreach($relation as $key => $value)
								<tr class="tac" style="cursor: pointer;">
									<td>
										<input type="radio" name="houseId" id="{{ $value['houseId'] }}" value="{{ $value['houseId'] }}">
									</td>
									<td class="tac">{{ $i }}</td>
									@php $i++; @endphp
									<td class="tal">{{ $value['houseName'] }}</td>
								</tr>
							@endforeach
						@empty
							<tr>
								<td colspan="3" class="tac" id="nodatafound">
									{{ trans('messages.lbl_nodatafound')}}
								</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
			</center>
			<br>
		</div>
		<div id="valuesDiv" style="display: none; float: center !important;">
			{{ Form::open(array('name'=>'soldPopup', 'id'=>'soldPopup', 
						'class' => 'form-horizontal',
						'files'=>true,
						'url' => 'Setting/soldHouseProcess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
						'method' => 'POST')) }}
			{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
			{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
			{{ Form::hidden('selHouseId', "" , array('id' => 'selHouseId')) }}
		<div class="box100per">
				<fieldset class="h50 mr7 ml7">
					<div class="dispinline col-md-12 mt10 mb5 ml120">
						<div class="box25per mt5 pull-left text-right clr_blue fwb labeltext">
						
							{{ trans('messages.lbl_sold_date') }}
							<span style="color:red;"> * 
							</span>
						</div>
						<div class="dispinline ml15 pull-left box30per mb5">
							{{ Form::text('soldDate',null,array('id'=>'soldDate', 
													'name' => 'soldDate','maxlength' => 10,
													'autocomplete' => 'off',
													'onKeyPress'=>'return event.charCode >= 48 && event.charCode <= 57',
													'class'=>'ime_mode_disable form-control inb soldDate box60per regdes',
													'data-label' => trans('messages.lbl_sold_date'))) }}
						<label class=" fa fa-calendar fa-lg inb designchange" for="soldDate" aria-hidden="true"></label>
						</div>
					</div>  
					<div class="dispinline col-md-12 mt5 mb5 ml120">
						<div class="box25per mt5 pull-left text-right clr_blue fwb labeltext">
							{{ trans('messages.lbl_sold_amount') }}
							<span style="color:red;">*</span>
						</div>
						<div class=" dispinline ml15 pull-left box30per mb10">
							{{ Form::text('soldAmount',null,
									array('id'=>'soldAmount', 
											'name' => 'soldAmount',
											'class'=>'box60per form-control tar inb regdes',
											'maxlength' => 12,
											'onkeypress' => 'return numberonly(event)',
											'onkeyup'=>'return fnMoneyFormat(this.id,"jp")',
											'data-label' => trans('messages.lbl_sold_amount'))) }}
						<label class="inb designchange" for="soldAmount" aria-hidden="true">万</label>
						</div>
					</div>  
				</fieldset>
			</div>
			<fieldset class="mt20 mr7 ml7 footerbg" >
				<center>
					<div class="box100per text-center mt5 mb5" id="">
						<div class="CMN_display_block" id="add_var">
							<button type="submit" id="soldHouseProcess" class="btn btn-warning CMN_display_block mt5 box100 soldHouseProcess btnsize"><i class="fa fa-edit"></i>&nbsp;{{ trans('messages.lbl_update') }}</button>
							<button type="button" onclick="divpopupclose();" class="btn btn-danger CMN_display_block box100 button btnsize" >
								{{ trans('messages.lbl_cancel') }}</button>
						</div>
					</div>
				</center>
			</fieldset>
			<br>
	<!-- Sold House List -->
	@else 

		<div class="modal-header" style="height: 60px;">
			<button type="button" onclick="divpopupclose();" class="close" style="color: red !important;" aria-hidden="true">&#10006;</button>
			<h2 class="pull-left pl5 mt2 heading">{{ trans('messages.lbl_sold_houselist') }}</h2>
		</div>

		<style type="text/css">
			.tableFixHead{ overflow-y: auto; height: 400px; }
			/*.tableFixHead thead th { position: sticky; top: 0; }*/
			#currMonth { background-color: #b0e0f2 !important;}
			#editMonth { color:#d72024 !important;}

			/* Just common table stuff. Really. */
			table  { border-collapse: collapse; width: 80%; }
			th, td { padding: 8px 16px; }
		</style>

		<div class="tableFixHead mt15">
			<center>
				<table class="table tablealter table-bordered footable table-striped box95per ml10 mr10 mb30">
					<colgroup>
						<col width="4%">
						<col width="10%">
						<col width="30%">
						<col width="12%">
						<col width="12%">

					</colgroup>
					<thead class="CMN_tbltheadcolor">
						<th class="soldhead">{{ trans('messages.lbl_sno')}}</th>
						<th class="soldhead">{{ trans('messages.lbl_image')}}</th>
						<th class="soldhead" data-hide="phone">{{ trans('messages.lbl_address')}}</th>
						<th class="soldhead" data-hide="phone">{{ trans('messages.lbl_pur_amt').' ・ '.trans('messages.lbl_date')}}</th>
						<th class="soldhead" data-hide="phone">{{ trans('messages.lbl_sold_amt').' ・ '.trans('messages.lbl_date')}}</th>

					</thead>
					<tbody class="tablealternateclr" id="soldTable">

						@php $i = 1; @endphp
						@forelse($houseArr as $belongsTo => $relation)
							<tr style="background-color:#c7e1f7 !important;">
								<th colspan="2" class="relTR colschange" >{{ $belongsTo }}</th>
							</tr>
							<tr style="background-color: #c7e1f7 !important;">
								<td colspan="5" class="relTR colschanges" >{{ $belongsTo }}</td>
							</tr>
							@foreach($relation as $key => $value)

								@php
									$src = $path.$value['userId']."/House/".$value['houseId']."/".$value['image1'];
								@endphp

								<tr>
									<td class="tac">{{ $i }}</td>
									@php $i++; @endphp
									<td class="tac" style="max-width: 150px;">
										<img src="{{ URL::asset($src) }}" class="image1 box100">
									</td>

									<td class="tal pl5 deswidth">
										<div>
											<label style="font-size: 16px;color: blue;">
												{{ $value['houseName'] }}
											</label>
										</div>
										<div class="mt10">{{ $value['pincode'] }}</div>
										<div>{{ $value['address'] }}</div>
										<div>{{ $value['houseName'] }}</div>
									</td>

									<td class="tac vam">
										<label class="mt10 deswidth">
											{{ ($value['purchaseAmount'] != "" ? number_format($value['purchaseAmount']).' 万' : '')}}
										</label><br>
										<label class="mt10 deswidth">{{ $value['purchaseDate'] }}</label>
									</td>
									<td class="tac vam">
										<label class="mt10 deswidth" >
											{{ ($value['soldAmount'] != "" ? number_format($value['soldAmount']).' 万' : '')}}
										</label><br>
										<label class="mt10 deswidth">{{ $value['soldDate'] }}</label>
									</td>
								</tr>
							@endforeach
						@empty
							<tr>
								<th colspan="2" class="tac nodatades" id="nodatafound">
									{{ trans('messages.lbl_nodatafound')}}
								</th>
							</tr>
							<tr>
								<td colspan="5" class="tac nodatades1" id="nodatafound">
									{{ trans('messages.lbl_nodatafound')}}
								</td>
							</tr>
						@endforelse
					</tbody>
				</table>
				<br>
			</center>
		</div>
	@endif
<script>
		$('.footable').footable({
			calculateWidthOverride: function() {
				return { width: $(window).width() };
			}
		}); 
	</script>
</div>
