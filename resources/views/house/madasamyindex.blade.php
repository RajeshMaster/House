@extends('layouts.app')
@section('content')
{{ HTML::style(asset('public/css/lib/lightbox.css')) }}
{{ HTML::script(asset('public/js/lib/lightbox.js')) }}
{{ HTML::script(asset('public/js/house.js')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}
{{ HTML::style(asset('public/css/tableviewlayout.css')) }}
<style type="text/css">

	.totAmt {
		color:blue;
		font-size: 18px !important;
	}

	.image1 {
		margin: 5% !important;
		height: 100px !important;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}

	.sort_asc {
		background-image:url({{ URL::asset('public/images/upArrow.png') }}) !important;
	}
	
	.sort_desc {
		background-image:url({{ URL::asset('public/images/downArrow.png') }}) !important;
	}

</style>

<script type="text/javascript">

	var datetime = '<?php echo date('Ymdhis'); ?>';

</script>

<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	<article id="house" class="DEC_flex_wrapper" data-category="house house_sub_1">
	{{ Form::open(array('name'=>'houseIndex',
			'id'=>'houseIndex',
			'url' => 'House/index?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
			'method' => 'POST')) }}

	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('plimit', $request->plimit , array('id' => 'plimit')) }}
	{{ Form::hidden('page', $request->page , array('id' => 'page')) }}
	{{ Form::hidden('sortOptn',$request->loanSort , array('id' => 'sortOptn')) }}
	{{ Form::hidden('sortOrder', $request->sortOrder , array('id' => 'sortOrder')) }}
	{{ Form::hidden('searchmethod', $request->searchmethod , array('id' => 'searchmethod')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('editChk', 0 , array('id' => 'editChk')) }}

		<fieldset class="pm0 mt20">
			<div class="header">
				<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/house.png')  }}">
				<h2 class="h2cnt">{{ trans('messages.lbl_housedetails') }}</h2>
			</div>
		</fieldset>

		@if (session('danger'))
			<div class="col-xs-12 mt10" align="center">
				<span class="alert-danger">{{ session('danger') }}</span>
			</div>
		@elseif (session('message'))
			<div class="col-xs-12 mt10" align="center">
				<span class="alert-success">{{ session('message') }}</span>
			</div>
		@endif

		<div class="col-xs-12 pm0 pull-left mt10 mb10" style="padding: 0px !important;">
			<a href="javascript:houseRegister('{{ $request->userId }}');" 
				class="button button-green textDecNone">
				<span class="fa fa-plus"></span> {{ trans('messages.lbl_register') }}
			</a>
			{{ Form::select('houseSort', $sortarray, $request->houseSort,
						array('class' => 'form-control sortposition '.' ' .$request->sortstyle.' '.'CMN_sorting pull-right mr0',
								'id' => 'houseSort',
								'style' =>'border-radius: 4px;',
								'name' => 'houseSort'))
				}}
		</div>

		<div class="box100per tableShrink pt10 mnheight mb0">
			<table class="table-striped table footable table-bordered mt10 mb10 colschanges">
				<colgroup>
					<col width="3%">
					<col width="10%">
					<col width="">
					<col width="12%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="CMN_tbltheadcolor" >
					<tr class="CMN_tbltheadcolor">
						<th class="tac">{{ trans('messages.lbl_sno') }}</th>
						<th class="tac">{{ trans('messages.lbl_house') }}</th>
						<th class="tac">{{ trans('messages.lbl_address') }}</th>
						<th class="tac">{{ trans('messages.lbl_purch_amount')."・".trans('messages.lbl_date')}}</th>
						<th class="tac">{{ trans('messages.lbl_curr_value') }}</th>
						<th class="tac">{{ trans('messages.lbl_remain_loanamt') }}</th>
						<th class="tac">{{ trans('messages.lbl_asset_amt') }}</th>
						<th class="tac">{{ trans('messages.lbl_bank') }}</th>
					</tr>
				</thead>
				<tbody class="tablealternateclr">

					@php 
						$i = 1; 
						$purchTotal = "";
						$currValTotal = "";
						$remainLoanTotal = "";
						$assetAmtTotal = "";
					@endphp

					@foreach($houseArrBelongsTo as $belongsToId => $relation)

						@php
							$purchTotal += $totArrVal[$relation]['purchTotal']; 
							$currValTotal += $totArrVal[$relation]['currValTotal']; 
							$remainLoanTotal +=	$totArrVal[$relation]['remainLoanTotal']; 
							$assetAmtTotal += $totArrVal[$relation]['assetAmtTotal']; 
						@endphp

						<tr style="background-color: #c7e1f7 !important;">
							<td colspan="3" >{{ $relation }}</td>
							<td class="tar totAmt">
								@if($totArrVal[$relation]['purchTotal'] != "")
									{{ number_format($totArrVal[$relation]['purchTotal']) }} 万
								@endif
							</td>
							<td class="tar totAmt">
								@if($totArrVal[$relation]['currValTotal'] != "")
									{{ number_format($totArrVal[$relation]['currValTotal']) }} 万
								@endif
							</td>
							<td class="tar totAmt">
								@if($totArrVal[$relation]['remainLoanTotal'] != "")
									{{ number_format($totArrVal[$relation]['remainLoanTotal']) }} 万
								@endif
							</td>
							<td class="tar totAmt">
								@if($totArrVal[$relation]['assetAmtTotal'] != "")
									{{ number_format($totArrVal[$relation]['assetAmtTotal']) }} 万
								@endif
							</td>
							<td></td>
						</tr>

						@foreach ($houseArrVal[$relation] as $key => $house)
							@if($house['belongsTo'] == $relation)
								@php
									$src = "public/uploads/".$house['userId']."/House/".$house['houseId']."/".$house['image1'];
								@endphp
								<tr>
									<td class="tac">
										<div class="fwb mt35">
											{{ $i }}
											@php $i++; @endphp
										</div>
									</td>
									<td class="tac" style="max-width: 150px;">
										@php $fileType = explode(".",$house['image1']); @endphp
										@if(end($fileType) == "pdf")
											@php $pdfImg = "public/images/pdfIcon.png"; @endphp
											<img src="{{ URL::asset($pdfImg) }}" class="image1 box100">
										@else 
											<img src="{{ URL::asset($src) }}" class="image1 box100">
										@endif
									</td>
									<td class="tal">
										@php
											$houseId = $house['houseId'];
											$userId = $house['userId'];
										@endphp
										<div class="ml20">
											<a href="javascript:fnViewHouse('{{ $houseId }}','{{ $userId }}');" style="font-size: 22px;" class="textDecNone">
												{{ ($house['houseName'] != "" ? $house['houseName'] : '-')}}
											</a>
										</div>
										<div class="ml20 mt10">
											{{ $house['pincode'] }}
										</div>
										<div class="ml20">
											{{ $house['address'] }}
										</div>
										<div class="ml20">
											{{ ($house['houseName'] != "" ? $house['houseName'] : '-')}}
										</div>
									</td>

									<td class="tac vam">
										<label class="mt10" style="font-size: 20px;">
											{{ ($house['purchaseAmount'] != "" ? number_format($house['purchaseAmount']).' 万' : '')}}
										</label><br>
										<label class="mt10">
											{{ $house['purchaseDate'] }} 
											@if($house['purchaseDate'] != "")
												({{ date('Y') - date("Y",strtotime($house['purchaseDate'])) }})
											@endif
										</label>
									</td>
									<td class="tar vam">
										<label class="mt10" style="font-size: 18px;">
											{{ ($house['currentValue'] != "" ? number_format($house['currentValue']).' 万' : '')}}
										</label>
									</td>

									<td class="tar vam">
										@if($house['loanFlg'] == 1)
											<label class="mt10" style="font-size: 18px;">
												{{ number_format($house['loanBalance']) }} 万
											</label>
										@endif
									</td>

									<td class="tar vam">
										@if($house['assetAmt'] != "")
											<label class="mt10" style="font-size: 18px;">
												{{ number_format($house['assetAmt']) }} 万
											</label>
										@endif	
									</td>

									<td class="vam">
										@if($house['loanFlg'] == 1)
											<label class="mt10">{{ $house['nickName'] }}</label>
										@endif
									</td>
								</tr>

							@endif
						@endforeach

					@endforeach	

					@if($purchTotal != "")
						<tr style="background-color: #ddd !important;">
							<td colspan="3" class="tar">{{ trans('messages.lbl_grandtot') }}</td>

							<td class="totAmt tar">{{ number_format($purchTotal) }} 万</td>
							<td class="totAmt tar">{{ number_format($currValTotal) }} 万</td>
							<td class="totAmt tar pr20">
								{{ number_format($remainLoanTotal) }} 万
							</td>
							<td class="totAmt tar pr20">
								{{ number_format($assetAmtTotal) }} 万
							</td>
							<td></td>
						</tr>
					@endif

					@if($houseArrVal == "")
						<tr class="nodata">
							<td class="text-center red" colspan="3">
								{{ trans('messages.lbl_nodatafound') }}
							</td>
						</tr>
					@endif
				</tbody>
			</table>

			@php 
				$a = 1; 
				$purchTotal = "";
				$currValTotal = "";
				$remainLoanTotal = "";
				$assetAmtTotal = "";
			@endphp

			@foreach($houseArrBelongsTo as $belongsToId => $relation)
			@foreach ($houseArrVal[$relation] as $key => $house)

				@php
					$src = "public/uploads/".$house['userId']."/House/".$house['houseId']."/".$house['image1'];
				@endphp

				<table class = "table table-bordered mt10 mb10 colschange">
					<colgroup>
						<col width="40%">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<thead class="CMN_tbltheadcolor" >
						<tr class="CMN_tbltheadcolor">
							<th class="tal" colspan="2" rowspan="5">
								@php
									$houseId = $house['houseId'];
									$userId = $house['userId'];
								@endphp
								<a href="javascript:fnViewHouse('{{ $houseId }}','{{ $userId }}');" 
									style="font-size: 15px;" class="textDecNone clr_blue"  
									title="{{ $house['houseName'] }}">
									@if(strlen($house['houseName']) > 15)
										{{ singlefieldlength($house['houseName'],15) }}
									@else
										{{ $house['houseName'] }}
									@endif
								</a>
							</th>
							<th class="tac clr_black">
								{{ $a }} | {{ count($houseDetails) }}
								@php
									$a++; 
								@endphp
							</th>
						</tr>
					</thead>
					<tbody class="">
						<tr>
							<td class="tac" style="max-width: 500px;min-height: 500px;" rowspan="5">
								@php $fileType = explode(".",$house['image1']); @endphp
								@if(end($fileType) == "pdf")
									@php $pdfImg = "public/images/pdfIcon.png"; @endphp
									<img src="{{ URL::asset($pdfImg) }}" class="mt30 mb30 box80per">
								@else 
									<img src="{{ URL::asset($src) }}" class="mt30 mb30 box80per">
								@endif
								@if($house['countImg'] != 0)
									<a onclick="fileImgPopup('index','{{ $houseId }}')">
										{{ trans('messages.lbl_image') }}({{$house['countImg']}})
									</a> 
								@else
									{{ trans('messages.lbl_image') }}({{$house['countImg']}})
								@endif
							</td>	
							<td class="vam">
								{{ trans('messages.lbl_room') }}
							</td>
							<td class="vam">
								{{ ($house['houseNo'] != "" ? $house['houseNo'].' 号 ' : '-')}}
							</td>	
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_size') }}
							</td>
							<td class="vam">
								{{ ($house['houseSize'] != "" ? $house['houseSize'] : '-')}}
								@if($house['houseSize'] != "")<label>m<sup>2</sup></label>@endif
							</td>		
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_current') }}
							</td>	
							<td class="vam">
								<label class="mt10">
									{{ ($house['currentValue'] != "" ? number_format($house['currentValue']).' 万' : '')}}
								</label>
							</td>
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_remaining') }}
							</td>	
							<td class="vam">
								@if($house['loanFlg'] == 1)
									<label class="mt10">
										{{ number_format($house['loanBalance']) }} 万
									</label>
								@endif
							</td>	
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_bank') }}
							</td>
							<td class="vam">
								@if($house['loanFlg'] == 1)
									<label class="mt10">{{ $house['nickName'] }}</label>
								@endif
							</td>		
						</tr>
						<tr>
							<td class="vam" colspan="3">
								<div class="mt5">
									{{ trans('messages.lbl_bdate') }} :
									{{ $house['houseBuildOn'] }}
									@if($house['houseBuildOn'] != "")
										({{ date('Y') - date("Y",strtotime($house['houseBuildOn'])) }})
									@endif
								</div>
								<div class="mt5">
									{{ trans('messages.lbl_pdate') }} :
									{{ $house['purchaseDate'] }}
									@if($house['purchaseDate'] != "")
										({{ date('Y') - date("Y",strtotime($house['purchaseDate'])) }})
									@endif
								</div>
							</td>
						</tr>
						<tr>
							<td class="vam" colspan="3">
								<div class="mt5">
									〒  {{ $house['pincode'] }}
								</div>
								<div class="mt5">
									{{ $house['address'] }}
								</div>
								<div class="mt5">
									{{ ($house['houseName'] != "" ? $house['houseName'] : '-')}}
								</div>
								<div class="mt10">
									{{ trans('messages.lbl_belongs_to') }} :
									{{ $relation }}
								</div>
							</td>
						</tr>
				</table>
			@endforeach
			@endforeach
		</div>

		<a id="back2Top" title="Back to top" href="#">&#10148;</a>
		
		@if($houseDetails->total())
			<div class="text-center col-xs-12 pm0　mt50 pagealign">
				@if(!empty($houseDetails->total()))
					<span class="pull-left mt24 pagination1">{{ $houseDetails->firstItem() }}
						<span class="mt5">～</span>
						{{ $houseDetails->lastItem() }} / {{ $houseDetails->total() }}
					</span>
				　@endif 
				<span class ="pagintion2">
					{{ $houseDetails->links() }}
				</span>
				<span class="pull-right pagination mt0">
					{{ $houseDetails->linkspagelimit() }}
				</span>
			</div>
		@endif

		<div id="imgViewPopup" class="modal fade">
			<div id="login-overlay">
				<div class="modal-content">
					<!-- Popup will be loaded here -->
				</div>
			</div>
		</div>

	{{ Form::close() }}
	</article>
</div>

@endsection

<?php 

// House Controller 


	/**  
	*  House Index Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public function index(Request $request){

		// PAGINATION
		if ($request->plimit=="") {
			$request->plimit = 50;
		}
		// SORTING PROCESS
		if ($request->houseSort == "") {
			$request->houseSort = "purchaseDate";
		}
		if (empty($request->sortOrder)) {
			$request->sortOrder = "desc";
		}
		if ($request->sortOrder == "asc") {
			$request->sortstyle = "sort_asc";
		} else {
			$request->sortstyle = "sort_desc";
		}
		$sortarray = array("purchaseDate" => trans('messages.lbl_purch_date'),
							"houseName" => trans('messages.lbl_housename'),
							"belongsTo" => trans('messages.lbl_belongsTo'),
							"bankId" => trans('messages.lbl_bankId'));

		if ($request->userId == "") {
			$request->userId = Auth::user()->userId;
		}

		$houseArr = array();
		$houseDetails = House::fnGetHouseDetails($request,0);
		foreach ($houseDetails as $key => $value) {
			$houseArr[$key] = (array)$value;

			if ($houseArr[$key]['belongsTo'] != "") {
				$houseArr[$key]['belongsToId'] = $houseArr[$key]['belongsTo'];
				$houseArr[$key]['belongsTo'] =  Loan::fnGetFamilyMaster($houseArr[$key]['belongsTo']);
			} else{
				$houseArr[$key]['belongsToId'] = "Others";
				$houseArr[$key]['belongsTo'] =  "Others";
			}
		}

		// Used for relation wise records in blade
		$houseArrBelongsTo = array();
		foreach ($houseArr as $key => $value) {
			$houseArrBelongsTo[$value['belongsToId']] = ($value['belongsTo']) ? $value['belongsTo'] : 1;
		}

		// Used for display
		$houseArrVal = array();
		$totArrVal = array();
		$loanIdArr = array();
		$date = date("Y-m-d");
		$yrMnth = date("Y-m");
		foreach ($houseArrBelongsTo as $belongsToId => $relation) {
			$purchTotal = "";
			$currValTotal = "";
			$remainLoanTotal = "";
			$assetAmtTotal = "";
			foreach ($houseArr as $key => $value) {
				$loanBalance = 0;
				if($value['belongsToId'] == $belongsToId){
					$houseArrVal[$relation][$value['houseId']] = $value; // housewise record
					// house wise total
					$purchTotal += $value['purchaseAmount']; 
					$currValTotal += $value['currentValue'];
					$houseArrVal[$relation][$value['houseId']]['loanBalance'] = "";
					if ($value['loanFlg'] == 1) {
						$loanDetails = House::fnGetLoanDetails($value['houseId']);
						if (!empty($loanDetails)) {
							// to avoid same loan repeatation
							if (!in_array($loanDetails[0]->loanId, $loanIdArr)) {
								array_push($loanIdArr, $loanDetails[0]->loanId);
								$currEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,"","",$yrMnth);
								// print_r($currEmiData);exit();
								$nextEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,$date,"next");
								// For active Loan
								if (!empty($currEmiData)) {		
									$loanBalance = $currEmiData[0]->loanBalance/10000;
								} 
								// For future Loan
								else if(!empty($nextEmiData)){		
									$loanBalance = $loanDetails[0]->loanAmount;
								} 
								// for expired loan
								else { 	
									$prevEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,$date,"prev");
									if (!empty($prevEmiData)) {
										end($prevEmiData); // for lask key of array
										$loanBalance = $prevEmiData[key($prevEmiData)]->loanBalance;
									} 
								}
							}
						}
						$houseArrVal[$relation][$value['houseId']]['loanBalance'] = $loanBalance;
						$remainLoanTotal += $loanBalance;
					}
					
					$assetAmt = "";
					if ($value['currentValue'] != "") {
						$assetAmt = $value['currentValue'] - $loanBalance; 
					}
					$houseArrVal[$relation][$value['houseId']]['assetAmt'] = $assetAmt;
					$assetAmtTotal += $assetAmt;
					$getCntHouseImg = House::getCntHouseImg($request,$value['houseId']);
					$houseArrVal[$relation][$value['houseId']]['countImg'] = count($getCntHouseImg);
				}
			}
			// relation wise total
			$totArrVal[$relation]['purchTotal'] = $purchTotal; 
			$totArrVal[$relation]['currValTotal'] = $currValTotal; 
			$totArrVal[$relation]['remainLoanTotal'] = $remainLoanTotal; 
			$totArrVal[$relation]['assetAmtTotal'] = $assetAmtTotal; 
		}
		return view('house.index', ['houseDetails' => $houseDetails,
									'sortarray' => $sortarray,
									'houseArr' => $houseArr,
									'houseArrBelongsTo' => $houseArrBelongsTo,
									'houseArrVal' => $houseArrVal,
									'totArrVal' => $totArrVal,
									'request' => $request]);

	}  ?>

	<script type="text/javascript">

	// For Memo Register Validation

	$('.memoRegprocess').on('click', function() {
		resetErrors();
		var url = 'memoRegValidation';
		$.each($('form input, form select, form textarea'), function(i, v) {  
			if (v.type !== "submit") {
				data[v.name] = v.value;
			}
		}); 
		$.ajax({
			dataType: 'json',
			type: 'POST',
			url: url,
			data: data,
			async: false, //blocks window close
			success: function(resp) {
				if(resp == true){
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
				} else{
				   $.each(resp, function(i, v) {
						// alert(i + " => " + v); // view in console for error messages
						var msg = '<label class="error pl5 mt5 tal" style="color:#9C0000;" for="'+i+'">'+v+'</label>';
						if ($('input[name="' + i + '"]').hasClass('memoContent')) {
							$('input[name="' + i + '"]').addClass('inputTxtError');
							$('.memoContent_err').append(msg)
						} else {
							$('input[name="' + i + '"], select[name="' + i + '"],textarea[name="' + i + '"]').addClass('inputTxtError').after(msg);
						}
					});
				}
			},
			error: function(data) {
				alert(data.status);
				// alert('there was a problem checking the fields');
			}
		});
	});

	</script>