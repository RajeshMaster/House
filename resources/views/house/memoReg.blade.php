@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/house.js')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}

<script type="text/javascript">
	var datetime = '<?php echo date('Ymdhis'); ?>';
	var mainmenu = '@php echo $request->mainmenu; @endphp';
</script>
<div class="" id="main_contents">
	<!-- article to select the main&sub menu -->
	<article id="house" class="DEC_flex_wrapper" data-category="house house_sub_1">
	{{ Form::open(array('name'=>'houseMemoReg', 'id'=>'houseMemoReg', 
							'class' => 'form-horizontal',
							'files'=>true,
							'url' => 'House/memoRegprocess?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'), 
							'method' => 'POST')) }}
	{{ csrf_field() }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}

	<fieldset class="pm0 mt20">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/house.png')  }}">
			<h2 class="h2cnt">{{ trans('messages.lbl_memo') }}</h2>
			<h2 class="pull-left h2cnt">・</h2> 
			<h2 class="pull-left h2cnt" style="color:green;">{{ trans('messages.lbl_register') }}</h2>
		</div>
	</fieldset>

	@if(Session::has('error'))
		<div class="alert-box success" style="text-align: center;color: red;">
			{{ Session::get('error') }}
		</div>
	@endif
	
	<div class="col-xs-12 pm0 mt10 mb5">
      	{{ trans('messages.lbl_houseid').':' }}
		<span class="mr40" style="color: blue;">
			@if(isset($houseDtls[0]->houseId))
				{{ $houseDtls[0]->houseId }} 
			@endif
		</span>
		{{ trans('messages.lbl_housename').':' }}
		<span class="mr40" style="color:#9C0000">
			@if(isset($houseDtls[0]->houseName))
				{{ $houseDtls[0]->houseName }} 
			@endif
		</span>
	</div>

	<fieldset class="mt10 mb10">
		<div class="col-xs-12 mt20 mb20">
			<div class="col-xs-3 lb text-right pm0">
				<label class="clr_black">{{ trans('messages.lbl_memo')}}</label>
				<span class="fr ml2 fs7"> </span>
			</div>
			<div class="col-xs-7 mw">
				{{ Form::textarea('memoContent', isset($houseDtls[0]->memoContent)?$houseDtls[0]->memoContent:"",array('id'=>'memoContent', 
											'name' => 'memoContent',
											'maxlength' => '1500',
											'class'=>'form-control txt-mw memoContent dispinline textareaResizeNone',
											'style'=>'width:100%;',
											'size' => '5x35')) }}
				<!-- <div class="memoContent_err dispinline ml5"></div> -->
			</div>
		</div>
	</fieldset>
	
	<fieldset class="mt10 footerbg pull-left box100per mb10 mt10">
		<div class="col-xs-12 mb10 mt10">
			<div class="col-xs-12" style="text-align: center;">
				<button type="button" class="button button-green memoRegprocess">
					<i class="fa fa-plus"></i>&nbsp;{{ trans('messages.lbl_register')}}
				</button>
				&emsp;
				<a href="javascript:memoCancel();" class="button button-red textDecNone">
					<span class="fa fa-remove"></span> {{ trans('messages.lbl_cancel') }}
				</a>
			</div>
		</div>
	</fieldset>

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