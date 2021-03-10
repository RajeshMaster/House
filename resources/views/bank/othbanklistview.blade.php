@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/bank.js')) }}
{{ HTML::script(asset('public/js/footable.js')) }}
{{ HTML::style(asset('public/css/tableviewlayout.css')) }}
{{ HTML::style(asset('public/css/footable.core.css')) }}
<div class="" id="main_contents">
<!-- article to select the main&sub menu -->
<article id="bank" class="DEC_flex_wrapper" data-category="bank bank_sub_2">
	<fieldset class="mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/bank.png')  }}">
			<h2 class="h2cnt">
				{{trans('messages.lbl_otherbank')}}
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
	<div class="col-xs-12 pm0 pull-left mt10 mb10" style="padding: 0px !important;">
		<a href="javascript:bankRegister('{{ $request->userId }}');" class="button button-green textDecNone">
			<span class="fa fa-plus"></span> {{ trans('messages.lbl_register') }}
		</a>

	</div>
	{{ Form::open(array('name'=>'othbanklistview',
						 'id'=>'othbanklistview', 
						 'url' => 'Bank/othbanklistview?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
						 'method' => 'POST')) }}
	{{ Form::hidden('plimit', $request->plimit , array('id' => 'plimit')) }}
	{{ Form::hidden('page', $request->page , array('id' => 'page')) }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('bankId', '' , array('id' => 'bankId')) }}
	{{ Form::hidden('pageview', 'othbanklistview' , array('id' => 'pageview')) }}
		<div class="box100per tableShrink pt10 mnheight mb0">
			<table class="table-striped table footable table-bordered mt10 mb10" >
				<colgroup>
					<col width="4%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="8%">
					<col width="20%">
					<col width="14%">
					<col width="4%">
				</colgroup>
				<thead class="CMN_tbltheadcolor" >
					<tr class="CMN_tbltheadcolor">
						<th class="tac fs10">
							{{ trans('messages.lbl_sno') }}
						</th>
						<th class="tac fs10">
							{{ trans('messages.lbl_bank_name') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_account_type') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_account_no') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_branch_name') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_branch_number') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_kananame') }}
						</th>
						<th class="tac fs10" data-hide="phone">
							{{ trans('messages.lbl_bank_username') }}
						</th>
						<th class="tac fs10" data-hide="phone">
						</th>
					</tr>
				</thead>
				<tbody class="tablealternateclr">
					@php $temphouseId = ''; @endphp
					@forelse ($userBankDtls as $count => $data)
						@if($temphouseId != $data ->buildingName)
							<tr>
								<th colspan="2" class="colschange" style="background-color: #c7e1f7;">
									@php $temphouseId = $data ->buildingName; @endphp
									{{ $data ->buildingName }}
								</th>
							</tr>
							<tr>
								<td colspan="9" class="colschanges" style="background-color: #c7e1f7;">
									@php $temphouseId = $data ->buildingName; @endphp
									{{ $data ->buildingName }}
								</td>
							</tr>
						@endif
						<tr>
							<td class="text-center vam">
								{{ ($userBankDtls->currentpage()-1) * $userBankDtls->perpage() + $count + 1 }}
							</td>
							<td class="tal Vam"
								title="{{ singlefieldtitle($data ->nickName, 10) }}">
								@if(strlen($data->nickName) > 10)
									{{ singlefieldlength($data ->nickName,10) }}
								@else
									{{ $data ->nickName }}
								@endif
							</td>
							<td class="tac Vam"
								title="普通">
								普通
							</td>
							
							<td class="tac Vam"
								title="{{ singlefieldtitle($data ->accountNo, 7) }}">
								@php $accountNo = sprintf("%07d", $data ->accountNo); @endphp
								{{ $accountNo }}
							</td>
							
							<td class="tal vam"
								title="{{ singlefieldtitle($data ->branchName, 10) }}">
								@if(strlen($data->branchName) > 10)
									{{ singlefieldlength($data ->branchName,10) }}
								@else
									{{ $data ->branchName }}
								@endif
							</td>
							<td class="tac vam"
								title="{{ singlefieldtitle($data ->branchNo, 5) }}">
								@php $branchNo = sprintf("%03d", $data ->branchNo); @endphp
								{{ $branchNo }}
							</td>
							<td class="tal vam" 
								title="{{ singlefieldtitle($data ->kanaName, 17) }}">
								@php 
									$kanaName = $data ->kanaName;
									if($kanaName != "") {
										if(strlen($kanaName) > 17) {
											echo singlefieldlength($kanaName,17);
										} else {
											echo $kanaName;
										}
									}
								@endphp
							</td>
							<td class="tal vam" 
								title="{{ singlefieldtitle($data ->kanaName, 10) }}">
								@php 
									$bankUserName = $data ->bankUserName;
									if($bankUserName != "") {
										if(strlen($bankUserName) > 10) {
											echo singlefieldlength($bankUserName,10);
										} else {
											echo $bankUserName;
										}
									}
								@endphp
							</td>
							<td class="tac vam">
								<a href="javascript:bankview('<?php echo $data->id ?>');"><img title="{{ trans('messages.lbl_view') }}" class=" box15" src="{{ URL::asset('public/images/ourdetails.png')}}"></a>
							</td>
						</tr>
					@empty
						<tr class="nodata">
							<th class="text-center red nodatades" colspan="2">
								{{ trans('messages.lbl_nodatafound') }}
							</th>
						</tr>
						<tr class="nodata">
							<td class="text-center red nodatades1" colspan="9">
								{{ trans('messages.lbl_nodatafound') }}
							</td>
						</tr>
					@endforelse
				</tbody>
			</table>
		</div>
		<a id="back2Top" title="Back to top" href="#">&#10148;</a>
		@if($userBankDtls->total())
			<div class="text-center col-xs-12 pm0　mt50 pagealign">
				@if(!empty($userBankDtls->total()))
					<span class="pull-left mt24 pagination1">{{ $userBankDtls->firstItem() }}
						<span class="mt5">～</span>
						{{ $userBankDtls->lastItem() }} / {{ $userBankDtls->total() }}
					</span>
				　@endif 
				<span class ="pagintion2">
					{{ $userBankDtls->links() }}
				</span>
				<span class="pull-right pagination mt0">
					{{ $userBankDtls->linkspagelimit() }}
				</span>
			</div>
		@endif
	{{ Form::close() }}
	<script>
		$('.footable').footable({
			calculateWidthOverride: function() {
				return { width: $(window).width() };
			}
		}); 
	</script>
</article>
</div>
@endsection