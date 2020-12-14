@extends('layouts.app')
@section('content')
{{ HTML::style(asset('public/css/lib/lightbox.css')) }}
{{ HTML::script(asset('public/js/lib/lightbox.js')) }}
{{ HTML::script(asset('public/js/house.js')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}
{{ HTML::style(asset('public/css/tableviewlayout.css')) }}

<style type="text/css">
	
	.image1 {
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}

</style>
<script type="text/javascript">

	var datetime = '<?php echo date('Ymdhis'); ?>';
	$(document).ready(function() {
		setDatePicker("purchaseDate");
	});

</script>

<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	<article id="house" class="DEC_flex_wrapper" data-category="house house_sub_1">
	{{ Form::open(array('name'=>'houseView',
			'id'=>'houseView',
			'url' => 'House/view?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
			'method' => 'POST')) }}

	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('editChk', 0 , array('id' => 'editChk')) }}

	<fieldset class="pm0 mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/house.png')  }}">
			<h2 class="h2cnt">{{ trans('messages.lbl_house') }}</h2>
			<h2 class="pull-left h2cnt">・</h2> 
			<h2 class="pull-left h2cnt" style="color:blue;">{{ trans('messages.lbl_view') }}
			</h2>
		</div>
	</fieldset>

	@if (session('danger'))
		<div class="col-xs-12 mt10" align="center">
			<span class="alert-danger">{{ session('danger') }}</span>
		</div>
	@elseif (session('success'))
		<div class="col-xs-12 mt10" align="center">
			<span class="alert-success">{{ session('success') }}</span>
		</div>
	@endif
	@php Session::forget('success'); @endphp
	@php Session::forget('danger'); @endphp
	<div class="col-xs-12 pull-left mt20 mb10">
		<a href="javascript:goToIndex('{{ $request->userId }}');" class="button button-blue textDecNone">
			<span class="fa fa-arrow-left"></span>
			{{ trans('messages.lbl_back') }}
		</a>
		<div class="pull-right">
			<a href="javascript:fnMemoReg();" class="button button-green textDecNone" id="uploadBtn">
				<span class="fa fa-plus"></span>
				{{ trans('messages.lbl_memoreg') }} 
			</a>
			<a href="javascript:fnUpload();" class="button button-blue textDecNone" id="uploadBtn">
				<span class="fa fa-upload"></span>
				{{ trans('messages.lbl_upload') }}
			</a>
		</div>
	</div>

	<fieldset class="mt10 mb10 pull-left dispviewMainMobile">
		<div class="col-md-12">
			<div class="col-xs-12 mt20">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_belongsTo')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if($details->familyName != "")
							{{ $details->familyName }}
						@else
							{{ trans('messages.lbl_nil')}}
						@endif
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt20">
				<div class="col-xs-4  lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_purch_date')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">{{ $details->purchaseDate }}</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_purch_amount')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">{{ number_format($details->purchaseAmount) }} 万円</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_pincode')}}</label>
				</div>
				<div class="col-xs-8">
					<label class="clr_black">{{ $details->pincode }}</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_address')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">{{ $details->address }}</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_building_name')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">{{ $details->buildingName }}</label>
				</div>
			</div>
			<div class="col-xs-12 mt15 mb20">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_housename')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">{{ $details->houseName }}</label>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset class="mt10 pull-right dispviewSubMobile">
		<div class="col-md-12">
			<div class="col-xs-12 mt20">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_house_type')}}</label>
				</div>
				<div class="col-xs-8">
					<label class="clr_black">
						@if($details->houseType == "")
							{{ trans('messages.lbl_nil')}}
						@else
							{{ $details->houseType }}
						@endif
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_house_size')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if($details->houseSize == "")
							{{ trans('messages.lbl_nil')}} 
						@else
							{{ $details->houseSize }} 
							<span class="mt5 ml10 fwb">m<sup>2</sup></span>
						@endif
						
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_balcony_size')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if($details->balaconySize == "")
							{{ trans('messages.lbl_nil')}} 
						@else
							{{ $details->balaconySize }} 
							<span class="mt5 ml10 fwb">m<sup>2</sup></span>
						@endif
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_house_buildon')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if($details->houseBuildOn == "" || $details->houseBuildOn == "0000-00-00")
							{{ trans('messages.lbl_nil')}}
						@else
							{{ $details->houseBuildOn }}
						@endif
					</label>
				</div>
			</div>

			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_maint_fees')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if(isset($details->maintFees) && $details->maintFees != "")
							{{ number_format($details->maintFees) }} 円
						@else
							{{ trans('messages.lbl_nil') }}
						@endif
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt15">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_tax')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if(isset($details->tax) && $details->tax != "")
							{{ number_format($details->tax) }} 円
						@else
							{{ trans('messages.lbl_nil') }}
						@endif
					</label>
				</div>
			</div>
			<div class="col-xs-12 mt15 mb20">
				<div class="col-xs-4 lb text-right">
					<label class="clr_blue">{{ trans('messages.lbl_curr_value')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<label class="clr_black">
						@if(isset($details->currentValue) && $details->currentValue != "")
							{{ number_format($details->currentValue) }} 万円
						@else
							{{ trans('messages.lbl_nil') }}
						@endif
					</label>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset class="mt20 mb20 dispviewMainMobile pull-left tac">
		<div style="height: 300px !important;">
			@php
				$src = $path.$details->userId."/House/".$details->houseId."/".$details->image1;
				$despath = "../../../".$path.$details->userId."/House/".$details->houseId."/";
			@endphp
			<div>
				<label class="mt20 mb10">
					{{ trans('messages.lbl_houseimg')}}
				</label>
				<div class="mt10">
					@php $fileType = explode(".",$details->image1); @endphp
					@if(end($fileType) == "pdf")
						@php $pdfImg = "public/images/pdfIcon.png"; @endphp
						<img src="{{ URL::asset($pdfImg) }}"  class="mt10 mb10" 
							style="height: 150px;width: 170px;">
					@else 
						<a style="text-decoration:none !important;" 
							href="{{ URL::asset($src) }}" data-lightbox="img">
							<img src="{{ URL::asset($src) }}" class="mt10 mb10" 
							style="height: 150px;width: 170px;">
						</a>
					@endif
				</div>
				<div class="mt10 mt20">
					<a class="glyphicon glyphicon-save" style="text-decoration:none !important;"
						href="javascript:download('{{ $details->image1 }}','{{ $despath }}');">
					</a>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset class="mt20 mb20 pull-right dispviewSubMobile">
		<div class = "ml20 mb5" style="overflow-y: auto; height: 300px !important;">
			@php $tempMainVal = ''; @endphp
			@php $tempImgMainVal = ''; @endphp
			@php $tempSubVal = ''; @endphp
			@foreach($mainCatdetails as $mainkey => $main)
				@if($tempMainVal !== $main->id)
					<div class="mt10">
						@if($subCatdetails[$main->id]['mainCount'] != 0)
							<span class="fa fa-plus" id="mainPlus<?php echo $main->id; ?>" 
								onclick="mainplus('{{ $main->id }}');" 
								style="cursor: pointer;">
							</span>
							<span class="fa fa-minus" id="mainMins<?php echo $main->id; ?>" 
								style="display: none;" 
								onclick="mainmins('{{ $main->id }}');">
							</span>
						@else
							<span class="ml20" id="mainPlus<?php echo $main->id; ?>"></span>
						@endif
						@php $tempMainVal = $main->id; @endphp
						{{ $main->imageName }} ({{ $subCatdetails[$main->id]['mainCountDtls'] }})
					</div>
				@endif
				@foreach($subCatdetails[$main->id]['subCat'] as $subkey => $sub)
					@php $category = $main->id.$sub->id; @endphp
					@if($tempSubVal != $sub->id)
						<div id="sub<?php echo $category; ?>" style="display: none;">
							@if($subCatdetails[$main->id][$sub->id]['subCount'] != 0)
								<span class="fa fa-plus ml17" id="subPlus<?php echo $category; ?>" 
									onclick="subplus('{{ $main->id }}','{{ $sub->id }}');">
								</span>
								<span class="fa fa-minus ml17" id="subMins<?php echo $category; ?>" 
									style="display: none;" 
									onclick="submins('{{ $main->id }}','{{ $sub->id }}');">
								</span>
								<label class="mt10">
									@php $tempSubVal = $sub->id; @endphp
									{{ $sub->imageName }} ({{ $subCatdetails[$main->id][$sub->id]['subCount'] }})
								</label>
							@else
								<span id="subMins<?php echo $category; ?>" style="display: none;">
								</span>
								<label class="mt10 ml36">
									@php $tempSubVal = $sub->id; @endphp
									{{ $sub->imageName }} ({{ $subCatdetails[$main->id][$sub->id]['subCount'] }})
								</label>
							@endif
						</div>
						<div></div>
					@endif
					@foreach($subCatdetails[$main->id][$sub->id]['fileCat'] as $filekey => $file)
						@php $fileName = $category.$file->id; @endphp
						<div id="file<?php echo $fileName; ?>" style="display: none;">
							<label class="mt10 ml36">
								<!-- <a onclick="fileImage('{{ $fileName }}')" 
									id="filelink<?php echo $fileName; ?>">
									{{ $file->fileName }}
								</a> -->
								<a onclick="fileImgPopup('{{ $fileName }}','{{ $request->houseId }}')" 
									id="filelink<?php echo $fileName; ?>">
									{{ $file->fileName }}
								</a>
							</label>
						</div>
						<div></div>
					@endforeach
				@endforeach
			@endforeach
		</div>
	</fieldset>

	<div id="uploadPopup" class="modal fade">
		<div id="login-overlay">
			<div class="modal-content">
				<!-- Popup will be loaded here -->
			</div>
		</div>
	</div>

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