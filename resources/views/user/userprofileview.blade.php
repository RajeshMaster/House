@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/user.js')) }}
{{ HTML::style(asset('public/css/tableviewlayout.css')) }}
<style type="text/css">
	.textDecNone:hover {
		text-decoration: none !important;
		color: white !important;
	}
</style>
<script type="text/javascript">
	var mainmenu = '@php echo $request->mainmenu; @endphp';
	var datetime = '@php echo date("Ymdhis") @endphp';
</script>
<div class="" id="main_contents">
<!-- article to select the main&sub menu -->
@if($request->mainmenu == "menu_userlist")
<article id="userlist" class="DEC_flex_wrapper" data-category="userlist userlist_sub_1">
@else
<article id="profile" class="DEC_flex_wrapper" data-category="profile profile_sub_1">
@endif
	<fieldset class="headerbg mt20">
		{{ Form::open(array('name'=>'profileview',
								'id'=>'profileview',
								'url' => 'User/edit?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
								'method' => 'POST',
								'files'=>true)) }}
		{{ Form::hidden('editid', $profileview[0]->id , array('id' => 'editid')) }}
		{{ Form::hidden('editflg', '', array('id' => 'editflg')) }}
		{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
		<div class="header">
			@if($request->mainmenu == "menu_user")
				<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/profile1.png')  }}">
				<h2 class="h2cnt">
					{{ trans('messages.lbl_profile')}}
				</h2>
			@else
				<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/list.png')  }}">
				<h2 class="h2cnt">
					{{ trans('messages.lbl_userlistview')}}
				</h2>
			@endif
		</div>
	</fieldset>
	<fieldset class="bordernone">
		<div class="col-xs-12 mt5 mb5 mwhead" style="padding: 0px !important;">
			<div class="col-xs-12 pull-left mt10 mb10" style="padding: 0px !important;">
			@if($request->mainmenu == "menu_user")
				<button type="button" onclick="javascript:useredit('edit','{{ $profileview[0]->id }}');" class="button button-orange pull-left textDecNone" style="">
					<span class="fa fa-edit"></span> {{ trans('messages.lbl_edit')}}
				</button>
			@else
				<a href="javascript:fnredirectback();" class="button button-blue textDecNone">
					<span class="fa fa-arrow-left"></span> {{ trans('messages.lbl_back') }}
				</a>
			@endif
			</div>
			<div class="col-xs-9 pull-left pm0" style="padding: 0px !important;">
				@if (session('danger'))
					<div class="alert1" align="center">
						<div>
							<span class="alert-danger ml250">{{ session('danger') }}</span>
						</div>
					</div>
				@endif
				@if (session('message'))
					<div class="alert1" align="center">
						<div >
							<span class="alert-success ml250">{{ session('message') }}</span>
						</div>
					</div>
				@endif
			</div>
		</div>
	</fieldset>
	<fieldset class="mb5">
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right">
				<label class="clr_blue">{{ trans('messages.lbl_userid')}}</label>
			</div>
			<div class="col-xs-8 mw clr_black">
				{{ ($profileview[0]->userId!="")?$profileview[0]->userId:trans('messages.lbl_nil') }}
			</div>
		</div>
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right pm0">
				<label class="clr_blue">{{ trans('messages.lbl_surname')}}</label>
			</div>
			<div class="col-xs-8 mw clr_black">
				{{ empnamelength(($profileview[0]->firstName!="")?$profileview[0]->firstName:trans('messages.lbl_nil'), 30) }}
			</div>
		</div>
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right pm0">
				<label class="clr_blue">{{ trans('messages.lbl_givenname')}}</label>
			</div>
			<div class="col-xs-8 mw pm0 clr_black">
				{{ empnamelength(($profileview[0]->lastName!="")?$profileview[0]->lastName:trans('messages.lbl_nil'), 30) }}
			</div>
		</div>
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right pm0">
				<label class="clr_blue">{{ trans('messages.lbl_gender')}}</label>
			</div>
			<div class="col-xs-8 mw pm0 clr_black">
				{{ ($profileview[0]->gender!="")?$profileview[0]->gender:trans('messages.lbl_nil') }}
			</div>
		</div>
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right pm0">
				<label class="clr_blue">{{ trans('messages.lbl_dob')}}</label>
			</div>
			<div class="col-xs-8 mw pm0 inb clr_black">
				{{ ($profileview[0]->dob!="")?$profileview[0]->dob:trans('messages.lbl_nil') }}
			</div>
		</div>
		<div class="col-xs-9 mt10">
			<div class="col-xs-4 lb text-right">
				<label class="clr_blue">{{ trans('messages.lbl_email')}}</label>
			</div>
			<div class="col-xs-8 mw clr_black">
				{{ ($profileview[0]->email!="")?$profileview[0]->email:trans('messages.lbl_nil') }}
			</div>
		</div>
		<div class="col-xs-9 mt10 mb10">
			<div class="col-xs-4 lb text-right">
				<label class="clr_blue">{{ trans('messages.lbl_mobileno')}}</label>
			</div>
			<div class="col-xs-8 mw clr_black">
				{{ ($profileview[0]->mobileNo!="")?$profileview[0]->mobileNo:trans('messages.lbl_nil') }}
			</div>
		</div>
	</fieldset>
</article>
</div>
@endsection