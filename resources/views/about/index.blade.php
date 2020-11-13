@extends('layouts.app')
@section('content')
<style type="text/css">
	div#footer {
	  border-top: 2px #1E90FF solid;
	}
/*hide by rajesh	*/
	/*@media  screen and (max-width: 500px) {
    fieldset{  width: 24% !important;border:1px solid red; }
    .txt{ width: 95% !important; }
    .s-mw { width:96% !important;max-width:96% !important; }
    .txt-mw{ width :96% !important;max-width:96% !important;}
    h2{ font-size:18px ;font-weight:  bold;}
    iframe{ width: 150% !important;}
}
@media only screen and (max-width: 500px) {
    .mw{min-width: 110% !important;}
    .lb{min-width: 95% !important;text-align: left !important;}
    .headimg{margin-top: 5px !important;}
    h2{ font-size:26px ;font-weight:  bold;}
}
@media only screen and (max-width: 350px) {
    body{overflow-x: scroll !important; }
}*/
.headimg{height:50px; width:50px;}
</style>
	<fieldset>
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/company-profile.png')  }}">
			<h2 class="h2cnt">{{ trans('messages.lbl_companyprofile')}}</h2>
		</div>
	</fieldset> 
	{{ Form::open(array('name'=>'about_us',
						'id'=>'about_us')) }}
		<fieldset id="hdnfield" class="mt10">
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_companyname')}}</label>
				</div>
				<div class="col-xs-9 mw fs17">
					<span>{{ trans('messages.lbl_microbit_cmpy_ltd')}}</span> 
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_ceo')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_ceo_name')}}</span> 
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_address')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_japan_address')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label></label>
				</div>
				<div class="col-xs-9">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.026939300449!2d135.4984158155503!3d34.729715330427084!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6000e43b6b9cd471%3A0xe704a2c61934469f!2z44CSNTMyLTAwMTEg5aSn6Ziq5bqc5aSn6Ziq5biC5reA5bed5Yy66KW_5Lit5bO277yV5LiB55uu77yW4oiS77yTIOODgeOCteODs-ODnuODs-OCt-ODp-ODs-esrO-8kuaWsOWkp-mYqg!5e0!3m2!1sja!2sjp!4v1472111698903" width="600" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_tel')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_tel_number')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_fax')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_fax_number')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_emailid')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_microbit_email')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_url')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<a href="http://www.microbit.co.jp/" target="_blank"><span>{{ trans('messages.lbl_url_microbit')}}</span></a>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_Registered_on')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_Registered_date')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_Capital')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_Capital_en')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_employee')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_employee_count')}}</span><br />
					<span>{{ trans('messages.lbl_employee_country')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_it_service')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<li>{{ trans('messages.lbl_it_service_cnt1')}}</li>
					<li>{{ trans('messages.lbl_it_service_cnt2')}}</li>
					<li>{{ trans('messages.lbl_it_service_cnt3')}}</li>
					<li>{{ trans('messages.lbl_it_service_cnt4')}}</li>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_india_office')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<a href="http://www.sathisys.com/" target="_blank"><span>{{ trans('messages.lbl_sathi_name')}}</span></a><br />
				  	<span>{{ trans('messages.lbl_sathiemployee_count')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_affiliated')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<span>{{ trans('messages.lbl_affiliated_cnt')}}</span>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_our_bank')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<li>{{ trans('messages.lbl_our_bank_cnt1')}}</li>
					<li>{{ trans('messages.lbl_our_bank_cnt2')}}</li>
					<li>{{ trans('messages.lbl_our_bank_cnt3')}}</li>
				</div>
			</div>
			<div class="col-xs-12 mt10">
				<div class="col-xs-3 lb tar" >
					<label>{{ trans('messages.lbl_history')}}</label>
				</div>
				<div class="col-xs-9 mw">
					<li>{{ trans('messages.lbl_history_cnt1')}}</li>
					<li>{{ trans('messages.lbl_history_cnt2')}}</li>
					<li>{{ trans('messages.lbl_history_cnt3')}}</li>
					<li>{{ trans('messages.lbl_history_cnt4')}}</li>
					<li>{{ trans('messages.lbl_history_cnt5')}}</li>
					<li>{{ trans('messages.lbl_history_cnt6')}}</li>
				</div>
			</div>
			<div id="footer" class="col-xs-12 mb10 mt10">
				<div class="col-xs-12 mt10">
				<div class="col-xs-9 lb tal" >
					<label>Microbit Co., Ltd.</label><br>
					<label>{{ trans('messages.lbl_japan_address')}}</label><br>
					<label>{{ trans('messages.lbl_tel')}}</label>:
					<label>{{ trans('messages.lbl_tel_number')}}</label><br>
					<label>{{ trans('messages.lbl_fax')}}</label>:
					<label>{{ trans('messages.lbl_fax_number')}}</label>
				</div>
			</div>
			<div class="col-xs-12 tac">
				<div class="copyright tac">Copyright&copy;2016 Microbit co,. Ltd.  All rights reserved.</div>
			</div>
		</fieldset> 
	{{ Form::close() }}
@endsection