@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/setting.js')) }}
{{ HTML::style(asset('public/css/settinglayout.css')) }}
<style type="text/css">
	/* Start Laptop screen Setting index page design */
@media all and (min-width:1205px) {
	.settingdesign{
		margin-left: 15%!important;
	}
	.settingsubdesignfamily{
		margin-left: 21%!important;
	}
	.settingdesignright{
		margin-left: 7%!important;
	}
	.settingsubdesignright{
		margin-left: 13%!important;
	}
}
/*End Laptop screen Setting index page design */
</style>
<script type="text/javascript">
	var mainmenu = '@php echo $request->mainmenu; @endphp';
	var datetime = '@php echo date("Ymdhis") @endphp';
</script>
<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	<article id="settings" class="DEC_flex_wrapper" data-category="settings setting_sub_1">
	<fieldset class="mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" style="padding-left: 0px!important;" src="{{ URL::asset('public/images/setting.png')  }}">
			<h2 class="h2cnt">
				{{ trans('messages.lbl_settings')}}
			</h2>
		</div>
	</fieldset>
	{{ Form::open(array('name'=>'indexform', 'id'=>'indexform', 'url' => 'Setting/index?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),'method' => 'POST')) }}
	{{ Form::hidden('mainmenu', $request->mainmenu, array('id' => 'mainmenu')) }}
		<fieldset class="mt10 mb20">
			<div class="box100per pr10 pt35 pl10">
			  	<div id="divPopup" class="color popup_position"></div>
				<div class="box50per pull-left table">
					<div class="box80per pull-left">
						<div class="col-xs-12 fwb headlbl headlbl1 settingdesign">
							<div class="mt3" style="padding-left: 15px;">{{ trans('messages.lbl_family') }}</div>
						</div>
						<div class="pull-left mt10 mb10 box100per">
							<span  class="col-xs-10 ml30 lbldessetcat settingsubdesignfamily">
								@php
									$tbl_name = 'ams_family_master';
								@endphp
								<a name="family" style="color:#33AFFF !important;" id="family" href="javascript:settingpopupsinglefield('twotextpopup','{{ $tbl_name }}','');">{{ trans('messages.lbl_familymember') }}</a>
							</span>
						</div>
					</div>
					<div class="box80per pull-left mt30">
						<div class="col-xs-12 fwb headlbl headlbl1 settingdesign">
							<div class="mt3" style="padding-left: 15px;">
								{{ trans('messages.lbl_sold_house') }}
							</div>
						</div>
						<div class="pull-left mt10 mb10 box100per">
							<span  class="col-xs-10 mt5 ml30 lbldessetcat settingsubdesignfamily">
								<a name="soldHouse" id="soldHouse" style="color:#33AFFF !important;" href="javascript:soldHouse(0);">{{ trans('messages.lbl_sold_housereg') }}</a></span>
							<span  class="col-xs-10 mt5 ml30 lbldessetcat settingsubdesignfamily">
								<a name="soldHouse" id="soldHouse" style="color:#33AFFF !important;" href="javascript:soldHouse(1);">{{ trans('messages.lbl_sold_houselist') }}</a></span>
						</div>
					</div>
					<div class="box80per pull-left mt190">
					</div>
				</div>
				<div class="box50per pull-left buildingalign">
					<div class="box80per pull-left">
						<div class="col-xs-12 fwb headlbl headlbl2 settingdesignright">
							<div class="mt3" style="padding-left: 15px;">{{ trans('messages.lbl_house') }}</div>
						</div>
						<div class="pull-left mt10 mb10 box100per">
							<span  class="col-xs-10 ml30 mt5 lbldesset settingsubdesignright">
								@php
									$tbl_name = 'ams_master_buildingname';
								@endphp
							 	<a name="houseName" style="color: #33AFFF !important;" 
						 		id="houseName" href="javascript:settingpopupsinglefield('threetextpopup','{{ $tbl_name }}','');">{{ trans('messages.lbl_building_name') }}</a>
							</span>
							<span  class="col-xs-10 mt5 ml30 lbldesset settingsubdesignright">
								@php
									$tbl_name = 'ams_master_houseimg_main';
								@endphp
								<a name="houseImg" id="houseImg" style="color:#33AFFF !important;" href="javascript:settingpopupsinglefield('singletextpopup','{{ $tbl_name }}','');">{{ trans('messages.lbl_houseimgmain') }}</a>
							</span>
							<span  class="col-xs-10 mt5 ml30 lbldesset settingsubdesignright">
								@php
									$tbl_name = 'ams_master_houseimg_sub';
									$tbl_select = 'ams_master_houseimg_main';
								@endphp
								<a name="houseImg" id="houseImg" style="color:#33AFFF !important;" href="javascript:settingpopupsinglefield('selecttextpopup','{{ $tbl_name }}','{{ $tbl_select }}');">{{ trans('messages.lbl_houseimgsub') }}</a>
							</span>
						</div>
					</div>
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

		<!-- For Soldhouse Popup -->
		<div id="soldHousePopup" class="modal fade">
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