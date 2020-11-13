@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/lib/bootstrap-datepicker.min.js')) }}
{{ HTML::style(asset('public/css/lib/bootstrap-datetimepicker.min.css')) }}
{{ HTML::script(asset('public/js/user.js')) }}
{{ HTML::style(asset('public/css/user.css')) }}
<script type="text/javascript">
	var datetime = '@php echo date("Ymdhis") @endphp';
	var mainmenu = '@php echo $request->mainmenu @endphp';
	$(document).ready(function() {
		setDatePicker("dataview");
		setDatePicker18yearbefore("dob");
	});
</script>
<div class="" id="main_contents">
<!-- article to select the main&sub menu -->
<article id="profile" class="DEC_flex_wrapper" data-category="profile profile_sub_1">
<fieldset class="headerbg" style="margin-top: 20px;">
	<div class="header">
		@if(!empty(Auth::user()))
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/profile1.png')  }}">
		@else
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/signup.png')  }}">
		@endif
		<h2 class="h2cnt changeln pl8">
			@if(!empty(Auth::user()))
				 <span>{{ trans('messages.lbl_profile') }}</span>
				 <h2 class="pull-left h2cnt">・</h2> 
				 <h2 class="pull-left h2cnt" style="color:red;">{{ trans('messages.lbl_edit') }}
			@else
				<span>{{ trans('messages.lbl_user')}}</span>
				<h2 class="pull-left h2cnt">・</h2> 
				<h2 class="pull-left h2cnt" style="color:green;">{{ trans('messages.lbl_register') }}
			@endif
		</h2>
		@if(Auth::user() == "")
			<div class="dispinline pull-right mr10">
				{{ Form::hidden('langvalue', Session::get('setlanguageval'), array('id' => 'langvalue')) }}
				@if (Session::get('setlanguageval') == 'en')
					<a class="" name="Database" style="text-decoration: none !important;" id="Database" onclick="javascript:changelanguage();">
						&nbsp;&nbsp;
						<img class="headerimg box40 imgviewheight changeln" src="{{ URL::asset('public/images/languageiconen.png')  }}">
					</a>
				@else
					<a class="" name="Database" style="text-decoration: none !important;" id="Database" onclick="javascript:changelanguage();">
						&nbsp;&nbsp;
						<img class="headerimg box40 imgviewheight changeln" src="{{ URL::asset('public/images/jpflg.png')  }}">
					</a>
				@endif	
			</div>
		@endif
	</div>
</fieldset>
<fieldset class="mt10">
		{{ Form::open(array('name'=>'frmuseraddedit','id'=>'frmuseraddedit', 
			'url' => 'User/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),
			'files'=>true,'method' => 'POST')) }}
			{{ Form::hidden('editid', $request->editid, array('id' => 'editid')) }}
	@if($request->editflg =="edit")
	<div class="col-xs-12 mt10">
		<div class="col-xs-3 lb text-right pm0">
			<label class="clr_black">{{ trans('messages.lbl_userid')}}</label>
			<span class="fr ml2 fs7"> * </span>
		</div>
		<div class="col-xs-9 mw pl5" style="color: blue;">
			{{ ($useredit[0]->userId!="")?$useredit[0]->userId:trans('messages.lbl_nil') }}
		</div>
	</div>
	@endif
	<div class="col-xs-12 mt10">
		<div class="col-xs-3 lb text-right pm0">
			<label class="clr_black lblname">{{ trans('messages.lbl_surname')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw regchange pl5">
			{{ Form::text('firstname',(isset($useredit[0]->firstName)) ? $useredit[0]->firstName : 										'',array('id'=>'firstname',
													 'name' => 'firstname',
													 'maxlength'=>'100',
													 'autocomplete' => 'off',
													 'style'=> 'width:30%;',
													 'class'=>'ime_mode_disable txt dispinline form-control regdes',
													 'data-label' => trans('messages.lbl_surname'))) }}
		</div>
	</div>
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right pm0">
			<label class="clr_black lblname">{{ trans('messages.lbl_givenname')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pm0 pl5">
			{{ Form::text('lastname',(isset($useredit[0]->lastName)) ? $useredit[0]->lastName : 										'',array('id'=>'lastname',
													 'name' => 'lastname',
													 'autocomplete' => 'off',
													 'maxlength'=>'100',
													 'style'=> 'width:30%;',
													 'class'=>'ime_mode_disable txt dispinline form-control regdes',
													 'data-label' => trans('messages.lbl_givenname'))) }}
		</div>
	</div>
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right pm0">
			<label class="clr_black lblname">{{ trans('messages.lbl_gender')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pm0 pl5">
			<div class="dispinline pl5">
				{{ Form::radio('gender', '1', (isset($useredit[0]->gender) && ($useredit[0]->gender)=="1") ? $useredit[0]->gender : '', array('id' =>'male',
													'name' => 'gender',
													'class' => 'gender','data-label' => trans('messages.lbl_gender'))) }}
				<label for="male" class="gender1" >
							{{ trans('messages.lbl_male')}}
					</label>
				{{ Form::radio('gender', '2',(isset($useredit[0]->gender) && ($useredit[0]->gender)=="2") ? $useredit[0]->gender : '', array('id' =>'female',
												'name' => 'gender',
												'class' => 'gender2','data-label' => trans('messages.lbl_gender'))) }}
				<label for="female" class="gender1" >
					{{ trans('messages.lbl_female')}}
				</label>
				<div class="gender_err dispinline"></div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right pm0">
			<label class="clr_black lblname">{{ trans('messages.lbl_dob')}}</label>
			<span class="fr ml2 fs7 lblname1"> * </span>
		</div>
		<div class="col-xs-9 mw pm0 inb pl5">
			{{ Form::text('dob',(isset($useredit[0]->dob)) ? $useredit[0]->dob : 										'',array('id'=>'dob', 
											'name' => 'dob','maxlength' => 10,
											'autocomplete' => 'off',
											'onKeyPress'=>'return event.charCode >= 48 && event.charCode <= 57',
											'style'=> 'width:15%;',
											'class'=>'ime_mode_disable form-control txtwth inb dob',
											'data-label' => trans('messages.lbl_dob'))) }}
			<label class="mt10 ml2 fa fa-calendar fa-lg calenderdes" for="dob" aria-hidden="true"></label>
			<div class="dob_err inb"></div>
		</div>
	</div>
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right">
			<label class="clr_black lblname">{{ trans('messages.lbl_email')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pl5">
			{{ Form::text('emailid',(isset($useredit[0]->email)) ? $useredit[0]->email : 										'',array('id'=>'emailid',
												'name' => 'emailid',
												'autocomplete' => 'off',
												'maxlength'=>'100',
												'style'=> 'width:30%;',
												'class'=>'ime_mode_disable txt dispinline form-control regdes',
												'data-label' => trans('messages.lbl_email'))) }}
		<label id="existsChk_textbox1" style="color: red;" class="registernamecolor display_none">
			{{ trans('messages.lbl_emailalreadyexists')}}
		</label>
		</div>
	</div>
	@if($request->editflg !="edit")
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right">
			<label class="clr_black lblname">{{ trans('messages.lbl_password')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pl5">
			
			{{ Form::password('password',array('id'=>'password',
															'name' => 'password',
															'autocomplete' => 'off',
															'style'=> 'width:30%;',
															'data-label' => trans('messages.lbl_password'),
															'class'=>'form-control regdes')) }}
		</div>
	</div>
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right">
			<label class="clr_black  lblnamecon">{{ trans('messages.lbl_confirmpassword')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pl5">
			{{ Form::password('conpassword',array('id'=>'conpassword',
															'name' => 'conpassword',
															'style'=> 'width:30%;',
															'autocomplete' => 'off',
															'data-label' => trans('messages.lbl_confirmpassword'),
															'class'=>'form-control regdes')) }}
		</div>
	</div>
	@endif
	<div class="col-xs-12 mt8">
		<div class="col-xs-3 lb text-right">
			<label class="clr_black lblname">{{ trans('messages.lbl_mobileno')}}</label>
			<span class="fr ml2 fs7 lblname"> * </span>
		</div>
		<div class="col-xs-9 mw pl5">
			{{ Form::text('mobileno',(isset($useredit[0]->mobileNo)) ? $useredit[0]->mobileNo : 										'',array('id'=>'mobileno',
												'name' => 'mobileno',
												'autocomplete' => 'off',
												'onkeypress'=>'return event.charCode >=6&& event.charCode <=58|| event.key === "Backspace"',
												'maxlength' => '10',
												'style' =>'width:30%',
												'data-label' => trans('messages.lbl_mobileno'),
												'class'=>'mobile ime_mode_disable txtbxwth dispinline form-control regdes')) }}
		</div>
	</div>
	<div class="col-xs-12 mt2 mt8 mb5">
		<div class="col-xs-3 lb">
		</div>
	</div>
</fieldset>
<fieldset class="mt10 footerbg" >
	<div class="col-xs-12 mb10 mt10">
		<div class="col-xs-12 buttondes" style="text-align: center;">
				@if($request->editflg =="edit")
					<button type="submit" class="button button-orange addeditprocess">
						<i class="fa fa-edit"></i> {{ trans('messages.lbl_update')}}
					</button>
				@else
					<button type="submit" class="button button-green addeditprocess">
						<i class="fa fa-plus"></i> {{ trans('messages.lbl_register')}}
					</button>
				@endif
				&emsp;
				@if(!empty(Auth::user()))
					<a onclick="javascript:return fnuserCancel();"
						class="button button-red" 
						style="color:white;text-decoration:none!important;">
						<span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel')}}
					</a>
				@else
					<a onclick="javascript:return fncancelcheck('{{ url('/') }}','frmuseraddeditcancel');"
						class="button button-red" 
						style="color:white;text-decoration:none!important;"><span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel')}}
					</a>
				@endif
		</div>
	</div>
	{{ Form::close() }}
</fieldset>
	<div class="col-xs-12 mt20"></div>
	{{ Form::open(array('name'=>'frmuseraddeditcancel','id'=>'frmuseraddeditcancel', 
			'url' => 'User/addeditprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),
			'files'=>true,'method' => 'POST')) }}
	{{ Form::close() }}
@endsection
