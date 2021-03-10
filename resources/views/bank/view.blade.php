@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/bank.js')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}
{{ HTML::style(asset('public/css/tableviewlayout.css')) }}
<script type="text/javascript">
	var mainmenu = '@php echo $request->mainmenu; @endphp';
	var datetime = '@php echo date("Ymdhis") @endphp';
</script>
<style type="text/css">
	/*Start Mobile layout*/
	@media all and (max-width: 330px) {
		.banknick{
			font-size: 85%;
		}
	}
	/*End Mobile layout*/
</style>
<div class="" id="main_contents">
<!-- article to select the main&sub menu -->
	@if($request->pageview == "bankView")
		<article id="bank" class="DEC_flex_wrapper" data-category="bank bank_sub_1">
	@else
		<article id="bank" class="DEC_flex_wrapper" data-category="bank bank_sub_2">
	@endif
		<fieldset class="mt20">
			<div class="header">
				<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/bank.png')  }}">
				<h2 class="h2cnt">
					@if($request->pageview == "bankView")
						{{ trans('messages.lbl_bank') }}
					@else
						{{ trans('messages.lbl_otherbank') }}
					@endif
				</h2>
				<h2 class="pull-left h2cnt">&#9642;</h2> 
				<h2 class="pull-left h2cnt" style="color:blue;">
					{{ trans('messages.lbl_view') }}
				</h2>
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
		<div class="col-xs-12 pull-left mt10 mb10">
			<a href="javascript:goToListView('{{ $request->userId }}');" 
				class="button button-blue textDecNone">
				<span class="fa fa-arrow-left"></span> {{ trans('messages.lbl_back') }}
			</a>
			<a href="javascript:fnEditBank('{{ $request->bankId }}','{{ $request->userId }}');" 
				class="button button-orange textDecNone">
			<span class="fa fa-edit"></span> {{ trans('messages.lbl_edit') }}</a>
		</div>
		{{ Form::open(array('name'=>'bankView',
		'id'=>'bankView',
		'url' => 'Bank/view?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
		'method' => 'POST')) }}
		{{ Form::hidden('plimit', $request->plimit , array('id' => 'plimit')) }}
		{{ Form::hidden('page', $request->page , array('id' => 'page')) }}
		{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
		{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
		{{ Form::hidden('bankId', $request->bankId , array('id' => 'bankId')) }}
		{{ Form::hidden('editChk', '' , array('id' => 'editChk')) }}
		{{ Form::hidden('pageview', $request->pageview , array('id' => 'pageview')) }}
		<fieldset class="mt20 mb20">
			@if($request->pageview == "bankView")
				<div class="col-xs-9 mt10">
					<div class="col-xs-4 lb tar" >
						<label class="clr_blue">{{ trans('messages.lbl_belongsTo')}}</label>
					</div>
					<div class="col-xs-8 mw" style="word-wrap: break-word;">
						@if($details->familyName =="")
							<span>{{ trans('messages.lbl_nil')}}</span>
						@else
							<span>{!! nl2br(e($details->familyName)) !!}</span>
						@endif
					</div>
				</div>
			@else
				<div class="col-xs-9 mt10">
					<div class="col-xs-4 lb tar" >
						<label class="clr_blue">{{ trans('messages.lbl_building_name')}}</label>
					</div>
					<div class="col-xs-8 mw" style="word-wrap: break-word;">
						@if($details->buildingName =="")
							<span>{{ trans('messages.lbl_nil')}}</span>
						@else
							<span>{!! nl2br(e($details->buildingName)) !!}</span>
						@endif
					</div>
				</div>
			@endif
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar" >
					<label class="clr_blue">{{ trans('messages.lbl_bank_name')}}</label>
				</div>
				<div class="col-xs-8 mw" style="word-wrap: break-word;">
					@if($details->bankName =="")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else
						<span>{!! nl2br(e($details->bankName)) !!}</span>
					@endif
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue banknick">{{ trans('messages.lbl_bank_nickname')}}</label>
				</div>
				<div class="col-xs-8 mw">
					@if($details->nickName =="")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else
						{{ $details->nickName }}
					@endif
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_account_type')}}</label>
				</div>
				<div class="col-xs-8 mw">
					<span>普通</span>
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_account_no')}}</label>
				</div>
				<div class="col-xs-8 mw" style="word-wrap: break-word;">
					@if($details->accountNo == "")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else 
					<span>
						@php $accountNo = sprintf("%07d", $details->accountNo); @endphp
						{{ $accountNo }}
					</span>
					@endif
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_branch_name')}}</label>
				</div>
				<div class="col-xs-8 mw">
					@if($details->branchName =="")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else
						{{ $details->branchName }}
					@endif
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_branch_number')}}</label>
				</div>
				<div class="col-xs-8 mw">
					@if($details->branchNo =="")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else
						@php $branchNo = sprintf("%03d", $details->branchNo); @endphp
						{{ $branchNo }}
					@endif
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_kananame')}}</label>
				</div>
				<div class="col-xs-8 mw" style="word-wrap: break-word;">
					@if($details->kanaName == "")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else 
						{{ $details->kanaName }}
					@endif
					
				</div>
			</div>
			<div class="col-xs-9 mt10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_bank_username')}}</label>
				</div>
				<div class="col-xs-8 mw" style="word-wrap: break-word;">
					@if($details->bankUserName == "")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else 
						{{ $details->bankUserName }}
					@endif
					
				</div>
			</div>
			<div class="col-xs-9 mt10 mb10">
				<div class="col-xs-4 lb tar">
					<label class="clr_blue">{{ trans('messages.lbl_registerDate')}}</label>
				</div>
				<div class="col-xs-8 mw" style="word-wrap: break-word;">
					@if($details->createdDateTime == "")
						<span>{{ trans('messages.lbl_nil')}}</span>
					@else 
						{{ substr($details->createdDateTime, 0, 10) }}
					@endif
					
				</div>
			</div>
		</fieldset>
		{{ Form::close() }}
	</article>
</div>
@endsection