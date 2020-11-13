@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/house.js')) }}
{{ HTML::script(asset('public/js/setting.js')) }}
{{ HTML::script(asset('public/js/lib/bootstrap-datepicker.min.js')) }}
{{ HTML::style(asset('public/css/lib/bootstrap-datetimepicker.min.css')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}
<style type="text/css">

	/*Start Mobile layout*/

	@media all and (max-width: 768px) {

		.regdes{
			width:128%!important;
		}
		.h2cnt {
			font-size: 150%!important;
			margin-top: 3%!important;
		}
		.buttondes {
			font-size: 80%!important;
		}
		.col-xs-3 {
			 width:50%;
			 font-size:80%;
			 margin-left:-10%;
		}
		.col-xs-9 {
			width:50%;
		}
		.dispMainMobile {
			width:100%;
		}
		.dispSubMobile {
			width:100%;
		}
		.belongsTo {
			width: 60%!important;
		}
		.purchasedes {
			font-size: 80%;
		}
		.selectdes {
			font-size: 55%;
		}

	}

	/*End Mobile layout*/

	@media all and (min-width:770px) {

		.dispMainMobile {
			width:50%;
		}
		.dispSubMobile {
			width:48%;
		}

	}

</style>
<script type="text/javascript">
	var datetime = '<?php echo date('Ymdhis'); ?>';
	var mainmenu = '@php echo $request->mainmenu; @endphp';
	$(document).ready(function() {
		setDatePicker("purchaseDate");
		// setDatePicker("houseBuildOn");
	});
</script>
<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	<article id="house" class="DEC_flex_wrapper" data-category="house house_sub_1">
	@if($detedit != "")
		{{ Form::model($detedit, array('name'=>'houseAddEdit','id'=>'houseAddEdit', 'files'=>true, 'method' => 'POST','class'=>'form-horizontal','url' => 'House/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis') ) ) }}
		{{ Form::hidden('editpage','editpage', array('id' => 'editpage')) }}
		{{ Form::hidden('confirm','2', array('id' => 'confirm')) }}
	@else
		{{ Form::open(array('name'=>'houseAddEdit', 'id'=>'houseAddEdit', 
						'class' => 'form-horizontal',
						'files'=>true,
						'url' => 'House/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
						'method' => 'POST')) }}
		{{ Form::hidden('confirm','1', array('id' => 'confirm')) }}
	@endif
	{{ csrf_field() }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}
	<fieldset class="pm0 mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/house.png')  }}">
			<h2 class="h2cnt">{{ trans('messages.lbl_house') }}</h2>
			<h2 class="pull-left h2cnt">・</h2> 
			@if($detedit != "")
				<h2 class="pull-left h2cnt" style="color:red;">{{ trans('messages.lbl_edit') }}</h2>
			@else
				<h2 class="pull-left h2cnt" style="color:green;">{{ trans('messages.lbl_register') }}
				</h2>
			@endif
		</div>
	</fieldset>
	@if(Session::has('error'))
		<div class="alert-box success" style="text-align: center;color: red;">
			{{ Session::get('error') }}
		</div>
	@endif
	<fieldset class="mt10 pull-left dispMainMobile">
		<div class="col-xs-12 mt20">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_belongsTo') }}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::select('belongsTo', [null=>''] + $familyMembersarray,null,
						array('class' => 'form-control inb box30per belongsTo',
								'id' => 'belongsTo',
								'name' => 'belongsTo',
								'data-label' => trans('messages.lbl_belongsTo') )) }}
				@php
					$tbl_name = 'ams_family_master';
				@endphp
				<span class="fa fa-plus inb button button-green selectdes"  style="cursor: pointer;"
					onclick="settingpopupsinglefield('twotextpopup','{{ $tbl_name }}','');">
					ADD
				</span>
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_purch_date')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('purchaseDate',null,array('id'=>'purchaseDate', 
												'name' => 'purchaseDate','maxlength' => 10,
												'autocomplete' => 'off',
												'onKeyPress'=>'return event.charCode >= 48 && event.charCode <= 57',
												'style'=> 'width:105px;',
												'class'=>'ime_mode_disable form-control inb purchaseDate',
												'data-label' => trans('messages.lbl_purch_date'))) }}
				<label class="mt10 ml2 fa fa-calendar fa-lg" for="purchaseDate" aria-hidden="true"></label>
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_purch_amount')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('purchaseAmount',null,array('id'=>'purchaseAmount',
														 'name' => 'purchaseAmount',
														 'maxlength'=>'11',
														 'autocomplete' => 'off',
														 'onkeypress' => 'return isNumberKey(event)',
														 'onkeyup'=>'return fnMoneyFormat(this.id,"jp")',
														 'class'=>'form-control inb tar',
														 'style'=> 'width:105px;',
														 'data-label' => trans('messages.lbl_purch_amount'))) }}
				<label class="mt7 inb ml2 purchasedes" aria-hidden="true">万円</label>
			</div>
		</div>
		<div class="col-xs-12 mt8">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_pincode')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9">
				{{ Form::text('pincode',null,array('id'=>'pincode',
														 'name' => 'pincode',
														 'autocomplete' => 'off',
														 'maxlength'=>'8',
														 'class'=>'form-control regdes',
														 'style'=> 'width:105px;',
														 'data-label' => trans('messages.lbl_pincode'))) }}
			</div>
		</div>
		

		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_building_name') }}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::select('buildingName', [null=>''] + $houseAddressarray,null,
						array('class' => 'form-control belongsTo inb',
								'id' => 'buildingName',
								'name' => 'buildingName',
								'style'=> 'width:240px;',
								'onchange' => 'javascript:setHouseName(this.value);getHouAddBuildOn();',
								'data-label' => trans('messages.lbl_building_name'))) }}
				@php
					$tbl_name = 'ams_master_buildingname';
				@endphp
				<span class="fa fa-plus inb button button-green selectdes"  style="cursor: pointer;"
					onclick="settingpopupsinglefield('threetextpopup','{{ $tbl_name }}','');">
					ADD
				</span>
			</div>
		</div>

		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_house_no')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				<span class="pull-left">
				{{ Form::text('houseNo',null,
						array('id'=>'houseNo',
								 'name' => 'houseNo',
								 'maxlength'=>'10',
								 'autocomplete' => 'off',
								 'style'=> 'width:70px;',
								 'onchange' => 'javascript:setHouseNo(this.value);',
								 'class'=>'ime_mode_disable txt dispinline form-control',
								 'data-label' => trans('messages.lbl_house_no'))) }}
				<span>
					<label class="mt7 box10per">号</label>
				</span>
			</div>
		</div>

		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_housename')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('houseName',null,
						array('id'=>'houseName',
								 'name' => 'houseName',
								 'maxlength'=>'100',
								 'autocomplete' => 'off',
								 'style'=> 'width:240px;',
								 'class'=>'ime_mode_disable txt dispinline form-control firstname regdes',
								 'data-label' => trans('messages.lbl_housename'))) }}
			</div>
		</div>

		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_address')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('address',null,array('id'=>'address',
														 'name' => 'address',
														 'readonly'=>'true',
														 'autocomplete' => 'off',
														 'class'=>'ime_mode_disable txt form-control regdes',
														 'style'=> 'width:240px;',
														 'data-label' => trans('messages.lbl_address'))) }}
			</div>
		</div>

		<div class="col-xs-12 mt10 mb20">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_image')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-4 mw">
				{{ Form::file('image1',array('id'=>'image1','name' => 'image1',
								'data-label' => trans('messages.lbl_file'),
								'accept' => '.jpg, .jpeg , .png , .pdf',
								'height' =>'27px',
								'style'=> 'width:240px;',
								'class'=>'regdes',
								'onchange' => 'javascript:validateImgPDF(this.value);')) 
						}}
			</div>
			@if(isset($detedit['image1']))
				<div class="col-xs-1 mw">
					<label class="mt3 ml12">{{ $detedit['image1'] }}</label>
				</div>
			@endif
		</div>
		{{ Form::hidden('file_name_temp',(isset($detedit['image1'])) ?  $detedit['image1'] : '',
										array('id'=>'file_name_temp',
												'name' => 'file_name_temp',
												'class'=>'form-control')) }}
	</fieldset>
	<fieldset class="mt10 pull-right dispSubMobile">
		<div class="col-xs-12 mt35">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_house_type')}}</label>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('houseType',null,array('id'=>'houseType',
														 'name' => 'houseType',
														 'autocomplete' => 'off',
														 'maxlength'=>'10',
														 'class'=>'form-control lastname',
														 'style'=>'width:105px;',
														 'data-label' => trans('messages.lbl_house_type'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt15">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_house_size')}}</label>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('houseSize',null,array('id'=>'houseSize',
														 'name' => 'houseSize',
														 'maxlength'=>'10',
														 'autocomplete' => 'off',
														 'onkeypress' => 'return isFloatNumberKey(event)',
														 'class'=>'tar form-control',
														 'style'=>'display: inline-block;width:105px;',
														 'data-label' => trans('messages.lbl_house_size'))) }}
				<label class="mt7 ml6 fwb">m<sup>2</sup></label>
			</div>
		</div>
		<div class="col-xs-12 mt15">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_balcony_size')}}</label>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('balaconySize',null,array('id'=>'balaconySize',
														 'name' => 'balaconySize',
														 'maxlength'=>'10',
														 'autocomplete' => 'off',
														  'onkeypress' => 'return isFloatNumberKey(event)',
														 'class'=>'tar form-control',
														  'style'=>'display: inline-block;width:105px;',
														 'data-label' => trans('messages.lbl_balcony_size'))) }}
				<label class="mt7 ml6 fwb">m<sup>2</sup></label>
			</div>
		</div>
		<div class="col-xs-12 mt15">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_house_buildon')}}</label>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('houseBuildOn',null,array('id'=>'houseBuildOn', 
												'name' => 'houseBuildOn','maxlength' => 10,
												'autocomplete' => 'off',
												'readonly'=>'true',
												'onKeyPress'=>'return event.charCode >= 48 && event.charCode <= 57',
												'class'=>'ime_mode_disable form-control txtwth inb houseBuildOn',
												'style'=> 'width:105px;',
												'data-label' => trans('messages.lbl_house_buildon'))) }}
			<!-- <label class="mt10 ml2 fa fa-calendar fa-lg" for="houseBuildOn" aria-hidden="true">
			</label> -->
			</div>
		</div>

		<div class="col-xs-12 mt15">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_maint_fees')}}</label>
			</div>
			<div class="col-xs-9 mw">
				<span>
				{{ Form::text('maintFees',null,
						array('id'=>'maintFees',
								 'name' => 'maintFees',
								 'maxlength'=>'10',
								 'autocomplete' => 'off',
								 'onkeypress' => 'return isNumberKey(event)',
								 'onkeyup'=>'return fnMoneyFormat(this.id,"jp")',
								 'class'=>'ime_mode_disable txt dispinline form-control tar',
								 'style'=>'width:105px;',
								 'data-label' => trans('messages.lbl_maint_fees'))) }}
				<span>
					<label class="mt7 box10per">円</label>
				</span>
			</div>
		</div>

		<div class="col-xs-12 mt15">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black mr8">{{ trans('messages.lbl_tax')}}</label>
			</div>
			<div class="col-xs-9 mw">
				<span>
				{{ Form::text('tax',null,
						array('id'=>'tax',
								 'name' => 'tax',
								 'maxlength'=>'10',
								 'autocomplete' => 'off',
								 'onkeypress' => 'return isNumberKey(event)',
								 'onkeyup'=>'return fnMoneyFormat(this.id,"jp")',
								 'class'=>'ime_mode_disable txt dispinline form-control tar',
								 'style'=>'width:105px;',
								 'data-label' => trans('messages.lbl_tax'))) }}
				<span>
					<label class="mt7 box10per">円</label>
				</span>
			</div>
		</div>
		<div class="col-xs-12 mt15 mb50">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_curr_value')}}</label>
				<span class="fr fs3"> * </span>
			</div>
			<div class="col-xs-9 mw">
				{{ Form::text('currentValue',null,array('id'=>'currentValue',
														 'name' => 'currentValue',
														 'maxlength'=>'11',
														 'autocomplete' => 'off',
														 'onkeypress' => 'return isNumberKey(event)',
														 'onkeyup'=>'return fnMoneyFormat(this.id,"jp")',
														 'class'=>'ime_mode_disable txt inb tar form-control',
														 'style'=>'width:105px;',
														 'data-label' => trans('messages.lbl_curr_value'))) }}
					
				<label class="mt7 ml2 inb purchasedes">万円</label>
			</div>
		</div>

	</fieldset>
	
	<fieldset class="mt10 footerbg pull-left box100per">
		<div class="col-xs-12 mb10 mt10">
			<div class="col-xs-12" style="text-align: center;">
				@if($detedit != "")
					<button type="submit" class="button button-orange addeditprocess">
						<i class="fa fa-edit"></i>&nbsp;{{ trans('messages.lbl_update') }}
					</button>
					&emsp;
					<a href="javascript:houseCancel('view');" class="button button-red textDecNone">
						<span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel') }}
					</a>
				@else
					<button type="submit" class="button button-green addeditprocess">
						<i class="fa fa-plus"></i>&nbsp;{{ trans('messages.lbl_register')}}
					</button>
					&emsp;
					<a href="javascript:houseCancel('index');" class="button button-red textDecNone">
						<span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel') }}
					</a>
				@endif

			</div>
		</div>
	</fieldset>

	<div id="showpopup" class="modal fade" style="width: 775px;">
		<div id="login-overlay">
			<div class="modal-content">
				<!-- Popup will be loaded here -->
			</div>
		</div>
	</div>
	
	{{ Form::close() }}

	{{ Form::open(array('name'=>'houseAddEditcancel', 'id'=>'houseAddEditcancel', 
					'url' => 'House/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),
					'files'=>true,'method' => 'POST')) }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}
	{{ Form::close() }}

	<script type="text/javascript">
		var cancel_check = true;
		$('input, select, textarea').bind("change keyup paste", function() {
			cancel_check = false;
		});
	</script>
</article>
</div>
@endsection