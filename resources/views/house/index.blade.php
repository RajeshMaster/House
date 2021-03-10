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
					<col width="5%">
					<col width="10%">
					<col width="">
					<col width="14%">
					<col width="12%">
				</colgroup>
				<thead class="CMN_tbltheadcolor" >
					<tr class="CMN_tbltheadcolor">
						<th class="tac">{{ trans('messages.lbl_sno') }}</th>
						<th class="tac">{{ trans('messages.lbl_house') }}</th>
						<th class="tac">{{ trans('messages.lbl_address') }}</th>
						<th class="tac">{{ trans('messages.lbl_purch_amount')."・".trans('messages.lbl_date')}}</th>
						<th class="tac">{{ trans('messages.lbl_curr_value') }}</th>
					</tr>
				</thead>
				<tbody class="tablealternateclr">

					@php 
						$i = 1; 
						$purchTotal = 0;
						$currValTotal = 0;
					@endphp

					@forelse($houseDetails as $key => $house)
						@php
							$src = $path.$house->userId."/House/".$house->houseId."/".$house->image1;
						@endphp
						<tr>
							<td class="tac">
								<div class="fwb mt35">
									{{ $i }}
									@php $i++; @endphp
								</div>
							</td>
							<td class="tac" style="max-width: 150px;">
								@php $fileType = explode(".",$house->image1); @endphp
								@if(end($fileType) == "pdf")
									@php $pdfImg = "public/images/pdfIcon.png"; @endphp
									<img src="{{ URL::asset($pdfImg) }}" class="image1 box100">
								@else 
									<img src="{{ URL::asset($src) }}" class="image1 box100">
								@endif
							</td>
							<td class="tal">
								@php
									$houseId = $house->houseId;
									$userId = $house->userId;
								@endphp
								<div class="ml20">
									<a href="javascript:fnViewHouse('{{ $houseId }}','{{ $userId }}');" style="font-size: 22px;" class="textDecNone">
										{{ ($house->houseName != "" ? $house->houseName : '-')}}
									</a>
								</div>
								<div class="ml20 mt10">
									{{ $house->pincode }}
								</div>
								<div class="ml20">
									{{ $house->address }}
								</div>
								<div class="ml20">
									{{ ($house->houseName != "" ? $house->houseName : '-')}}
								</div>
								<div class="ml20" style="color: brown;">
									{{ trans('messages.lbl_belongs_to') }} :
									{{ $house->familyName }}
								</div>
							</td>

							<td class="tac vam">
								<label class="mt10" style="font-size: 20px;">
									{{ ($house->purchaseAmount != "" ? number_format($house->purchaseAmount).' 万' : '')}}
								</label><br>
								<label class="mt10">
									{{ $house->purchaseDate }} 
									@if($house->purchaseDate != "")
										({{ date('Y') - date("Y",strtotime($house->purchaseDate)) }})
									@endif
								</label>
							</td>
							<td class="tar vam">
								<label class="mt10" style="font-size: 18px;">
									{{ ($house->currentValue != "" ? number_format($house->currentValue).' 万' : '')}}
								</label>
							</td>
							
							@php
								$purchTotal += $house->purchaseAmount; 
								$currValTotal += $house->currentValue; 
							@endphp
						</tr>
					@empty
						<tr class="nodatades1">
							<td class="text-center red" colspan="5">
								{{ trans('messages.lbl_nodatafound') }}
							</td>
						</tr>
					@endforelse

					@if($purchTotal != 0)
						<tr style="background-color: #ddd !important;">
							<td colspan="3" class="tar">{{ trans('messages.lbl_grandtot') }}</td>
							<td class="totAmt tar">{{ number_format($purchTotal) }} 万</td>
							<td class="totAmt tar">{{ number_format($currValTotal) }} 万</td>
						</tr>
					@endif

				</tbody>
			</table>

			@php 
				$a = 1; 
			@endphp

			@forelse($houseDetails as $key => $house)
				@php
					$src = $path.$house->userId."/House/".$house->houseId."/".$house->image1;
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
									$houseId = $house->houseId;
									$userId = $house->userId;
								@endphp
								<a href="javascript:fnViewHouse('{{ $houseId }}','{{ $userId }}');" 
									style="font-size: 15px;" class="textDecNone clr_blue"  
									title="{{ $house->houseName }}">
									@if(strlen($house->houseName) > 15)
										{{ singlefieldlength($house->houseName,15) }}
									@else
										{{ $house->houseName }}
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
							<td class="tac" style="max-width: 300px;min-height: 300px;" rowspan="3">
								@php $fileType = explode(".",$house->image1); @endphp
								@if(end($fileType) == "pdf")
									@php $pdfImg = "public/images/pdfIcon.png"; @endphp
									<img src="{{ URL::asset($pdfImg) }}" class="mt30 mb30 box80per">
								@else 
									<img src="{{ URL::asset($src) }}" class="mt30 mb30 box80per">
								@endif
								@if($houseArrVal[$house->houseId]['countImg'] != 0)
									<a onclick="fileImgPopup('index','{{ $houseId }}')">
										{{ trans('messages.lbl_image') }}({{$houseArrVal[$house->houseId]['countImg']}})
									</a> 
								@else
									{{ trans('messages.lbl_image') }}({{$houseArrVal[$house->houseId]['countImg']}})
								@endif
							</td>	
							<td class="vam">
								{{ trans('messages.lbl_room') }}
							</td>
							<td class="vam">
								{{ ($house->houseNo != "" ? $house->houseNo.' 号 ' : '-')}}
							</td>	
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_size') }}
							</td>
							<td class="vam">
								{{ ($house->houseSize != "" ? $house->houseSize : '-')}}
								@if($house->houseSize != "")<label>m<sup>2</sup></label>@endif
							</td>		
						</tr>
						<tr>
							<td class="vam">
								{{ trans('messages.lbl_current') }}
							</td>	
							<td class="vam">
								<label class="mt10">
									{{ ($house->currentValue != "" ? number_format($house->currentValue).' 万' : '')}}
								</label>
							</td>
						</tr>
						<tr>
							<td class="vam" colspan="3">
								<div class="mt5">
									{{ trans('messages.lbl_bdate') }} :
									{{ $house->houseBuildOn }}
									@if($house->houseBuildOn != "")
										({{ date('Y') - date("Y",strtotime($house->houseBuildOn)) }})
									@endif
								</div>
								<div class="mt5">
									{{ trans('messages.lbl_pdate') }} :
									{{ $house->purchaseDate }}
									@if($house->purchaseDate != "")
										({{ date('Y') - date("Y",strtotime($house->purchaseDate)) }})
									@endif
								</div>
							</td>
						</tr>
						<tr>
							<td class="vam" colspan="3">
								<div class="mt5">
									〒  {{ $house->pincode }}
								</div>
								<div class="mt5">
									{{ $house->address }}
								</div>
								<div class="mt5">
									{{ ($house->houseName != "" ? $house->houseName : '-')}}
								</div>
								<div class="mt10" style="color: brown;">
									{{ trans('messages.lbl_belongs_to') }} :
									{{ $house->familyName }}
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			@empty
				<div class="nodatades tac red">{{ trans('messages.lbl_nodatafound') }}</div>
			@endforelse

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