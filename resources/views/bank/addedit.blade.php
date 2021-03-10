@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/bank.js')) }}
{{ HTML::script(asset('public/js/setting.js')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}

<style type="text/css">

	/*Start Mobile layout*/

	@media all and (max-width: 768px) {
		
		.regdes{
			width:128%!important;
		}

		.h2cnt {
			font-size: 150%!important;
			margin-top: 5%!important;
		}

		.buttondes {
			font-size: 80%!important;
		}

		.col-xs-3 {
			 width:50%;
			 font-size:80%;
			 margin-left:-10%;
		}

		.col-xs-9{
			width:50%;
		}

		.belongsTo {
			width: 60%!important;
		}

		.selectdes {
			font-size: 55%;
		}
	}

	/*End Mobile layout*/
	
</style>
<script type="text/javascript">
	var datetime = '<?php echo date('Ymdhis'); ?>';
	$(document).ready(function() {
		fnGetBankNickName();
	});
</script>

<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	@if($request->pageview == "bankAddEdit")
		<article id="bank" class="DEC_flex_wrapper" data-category="bank bank_sub_1">
	@else
		<article id="bank" class="DEC_flex_wrapper" data-category="bank bank_sub_2">
	@endif
	@if($detedit != "")
		{{ Form::model($detedit, array('name'=>'bankAddEdit','id'=>'bankAddEdit', 
		'files'=>true, 'method' => 'POST','class'=>'form-horizontal','url' => 'Bank/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis') ) ) }}
		{{ Form::hidden('editpage','editpage', array('id' => 'editpage')) }}
		{{ Form::hidden('confirm','2', array('id' => 'confirm')) }}
		{{ Form::hidden('bankId',$detedit[0]->id, array('id' => 'bankId')) }}
	@else
		{{ Form::open(array('name'=>'bankAddEdit', 'id'=>'bankAddEdit', 
						'class' => 'form-horizontal',
						'files'=>true,
						'url' => 'Bank/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
						'method' => 'POST')) }}
		{{ Form::hidden('confirm','1', array('id' => 'confirm')) }}
	@endif
	{{ csrf_field() }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('pageview', $request->pageview , array('id' => 'pageview')) }}
	<fieldset class="pm0 mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/bank.png')  }}">
			<h2 class="h2cnt">
				@if($request->pageview == "bankAddEdit")
					{{ trans('messages.lbl_bank') }}
				@else
					{{ trans('messages.lbl_otherbank') }}
				@endif
			</h2>
			<h2 class="pull-left h2cnt">・</h2> 
			@if($detedit != "")
				<h2 class="pull-left h2cnt" style="color:red;">
					{{ trans('messages.lbl_edit') }}
				</h2>
			@else
				<h2 class="pull-left h2cnt" style="color:green;">
					{{ trans('messages.lbl_register') }}
				</h2>
			@endif
		</div>
	</fieldset>
	@if(Session::has('error'))
		<div class="alert-box success" style="text-align: center;color: red;">
			{{ Session::get('error') }}
		</div>
	@endif
	<fieldset class="mt10">
		<div class="col-xs-12 mt20">
			@if($request->pageview == "bankAddEdit")
				<div class="col-xs-3 lb text-right pm0">
					<label class="clr_black">{{ trans('messages.lbl_belongsTo') }}</label>
					<span class="fr ml2 fs7"> * </span>
				</div>
				<div class="col-xs-9 pl30">
					{{ Form::select('belongsTo', [null=>''] + $familyMembersarray,null,
							array('class' => 'form-control inb belongsTo',
									'id' => 'belongsTo',
									'name' => 'belongsTo',
									'style'=> 'width:185px;',
									'data-label' => trans('messages.lbl_belongsTo') )) }}

					@php
						$tbl_name = 'ams_family_master';
					@endphp
					<span class="fa fa-plus inb button button-green selectdes"  style="cursor: pointer;"
						onclick="settingpopupsinglefield('twotextpopup','{{ $tbl_name }}','');">
						ADD
					</span>
				</div>
			@else
				<div class="col-xs-3 lb text-right pm0">
					<label class="clr_black">{{ trans('messages.lbl_building_name') }}</label>
					<span class="fr ml2 fs7"> * </span>
				</div>
				<div class="col-xs-9 pl30">
					{{ Form::select('houseId', [null=>''] + $houseAddressarray,null,
							array('class' => 'form-control inb belongsTo',
									'id' => 'houseId',
									'name' => 'houseId',
									'style'=> 'width:185px;',
									'data-label' => trans('messages.lbl_building_name'))) }}

					@php
						$tbl_name = 'ams_master_buildingname';
					@endphp
					<span class="fa fa-plus inb button button-green selectdes"  style="cursor: pointer;"
						onclick="settingpopupsinglefield('threetextpopup','{{ $tbl_name }}','');">
						ADD
					</span>
				</div>
				
			@endif
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_bank_name')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 pl30">
				{{ Form::select('bankName', [null=>''] + $bankNamearray,null,
					array('class' => 'form-control inb belongsTo',
							'id' => 'bankName',
							'name' => 'bankName',
							'style'=> 'width:185px;',
							'onchange'=>'fnGetBankNickName();',
							'data-label' => trans('messages.lbl_bank_name'))) }}
				@php
					$tbl_name = 'ams_bankname_master';
				@endphp
				<span class="fa fa-plus inb button button-green selectdes"  style="cursor: pointer;"
					onclick="settingpopupsinglefield('twotextpopup','{{ $tbl_name }}','');">
					ADD
				</span>
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_bank_nickname')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 pl30">
				{{ Form::select('bankNickName', [null=>''],null,
					array('class' => 'form-control',
							'id' => 'bankNickName',
							'name' => 'bankNickName',
							'style'=> 'width:93px;',
							'data-label' => trans('messages.lbl_bank_nickname'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_account_type')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 pl30">
				@php
					$accountType = array( 1 =>'普通');
				@endphp
				{{ Form::select('accountType', $accountType,null,
							array('class' => 'form-control',
									'id' => 'accountType',
									'name' => 'accountType',
									'style'=> 'width:93px;',
									'data-label' => trans('messages.lbl_account_type'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt8">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_account_no')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 pl30">
				{{ Form::text('accountNo',null,array('id'=>'accountNo',
													 	'name' => 'accountNo',
														'autocomplete' => 'off',
														'maxlength'=>'7',
														'onkeypress' => 'return numberonly(event)',
														'class'=>'form-control regdes',
														'style'=> 'width:185px;',
														'data-label' => trans('messages.lbl_account_no'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_branch_name')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw pl30">
				{{ Form::text('branchName',null,array('id'=>'branchName',
														 'name' => 'branchName',
														 'maxlength'=>'20',
														 'class'=>'ime_mode_disable txt dispinline form-control regdes',
														 'style'=> 'width:185px;',
														 'data-label' => trans('messages.lbl_branch_name'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_branch_number')}}</label>
				<span class="fr ml10 fs7">  </span>
			</div>
			<div class="col-xs-9 mw pl30">
				{{ Form::text('branchNo',null,array('id'=>'branchNo',
														 'name' => 'branchNo',
														 'maxlength'=>'3',
														 'onkeypress' => 'return numberonly(event)',
														 'class'=>'ime_mode_disable txt dispinline form-control',
														 'style'=> 'width:90px;',
														 'data-label' => trans('messages.lbl_branch_number'))) }}
			</div>
		</div>
		<div class="col-xs-12 mt10">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_kananame')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw pl30">
				{{ Form::text('kanaName',null,array('id'=>'kanaName', 
												'name' => 'kanaName',
												'maxlength' => '100',
												'class'=>'txt dispinline form-control regdes',
												'style'=> 'width:270px;',
												'data-label' => trans('messages.lbl_kananame'))) 
				}}
			</div>
		</div>
		<div class="col-xs-12 mt10 mb20">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_bank_username')}}</label>
				<span class="fr ml2 fs7"> * </span>
			</div>
			<div class="col-xs-9 mw pl30">
				{{ Form::text('bankUserName',null,array('id'=>'bankUserName', 
												'name' => 'bankUserName',
												'maxlength' => '100',
												'class'=>'txt dispinline form-control regdes',
												'style'=> 'width:270px;',
												'data-label' => trans('messages.lbl_bank_username'))) 
				}}
			</div>
		</div>
	</fieldset>
	<fieldset class="mt10 footerbg" >
		<div class="col-xs-12 mb10 mt10">
			<div class="col-xs-12" style="text-align: center;">
				@if($detedit != "")
					<button type="submit" class="button button-orange addeditprocess textDecNone">
						<i class="fa fa-edit"></i>&nbsp;{{ trans('messages.lbl_update') }}
					</button>
					&emsp;
					<a href="javascript:bankCancel();" class="button button-red textDecNone">
						<span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel') }}
					</a>
				@else
					<button type="submit" class="button button-green addeditprocess textDecNone">
						<i class="fa fa-plus"></i>&nbsp;{{ trans('messages.lbl_register')}}
					</button>
					&emsp;
					<a href="javascript:bankCancel();" class="button button-red textDecNone">
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

	{{ Form::open(array('name'=>'bankAddEditcancel', 'id'=>'bankAddEditcancel', 
					'url' => 'bank/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),
					'files'=>true,'method' => 'POST')) }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('pageview', $request->pageview , array('id' => 'pageview')) }}
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