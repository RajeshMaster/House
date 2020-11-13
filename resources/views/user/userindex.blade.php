@extends('layouts.app')
@section('content')
{{ HTML::script(asset('public/js/user.js')) }}
{{ HTML::style(asset('public/css/user.css')) }}
{{ HTML::style(asset('public/css/designtable.css')) }}
<style type="text/css">
.sort_asc {
	background-image:url({{ URL::asset('public/images/upArrow.png') }}) !important;
}
.sort_desc {
	background-image:url({{ URL::asset('public/images/downArrow.png') }}) !important;
}
.CMN_fixed {
	position: fixed ! important;
	background-color: red;
}
.filterdes{
	margin-left: 0%;
	margin-bottom: 5%;
}
.CMN_sorting {
	width: 115px  !important;
	height: 34.5px ! important;
	line-height: 14px !important;
	font-size: 12px !important;
	padding: 0px !important;
	padding-left: 10px !important; 
	background-repeat: no-repeat; 
	background-position:right;
	background-color: white !important;
	background-position: right; 
	-webkit-appearance: none !important;
	-moz-appearance: none !important;
	appearance: none !important; 
	}
@media all and (max-width: 768px) {
	.searchposuser {
		margin-top: 57%!important;
		margin-right: 0.5%!important;
	}
	.filterdes{
		margin-left: -1%;
		margin-bottom:5%!important;
	}
	.clearposition{
		margin-top: 1%!important;
		margin-right: 1%!important;
		width: 8%;
	}
	.CMN_sorting {
		width: 105px  !important;
		height: 34.5px ! important;
		
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	// For triming empty space in front of text box
	$("form").on('submit',function(e){
	$('form input, textarea').each(function(i, v){
		if(v.type != 'file'){
		$(this).val(jQuery.trim($(this).val()));
		}
		});
	});
	});
	// end of trim function
	var mainmenu = '@php echo $request->mainmenu; @endphp';
	var datetime = '@php echo date("Ymdhis") @endphp';
</script>
{{ Form::open(array('name'=>'userIndex', 'id'=>'userIndex', 'url' => 'User/index?mainmenu='.$request->mainmenu.'&time='.date('YmdHis'),'method' => 'POST')) }}
	{{ Form::hidden('userId', '' , array('id' => 'userId')) }}
	{{ Form::hidden('sortOptn',$request->usersort , array('id' => 'sortOptn')) }}
	{{ Form::hidden('sortOrder', $request->sortOrder , array('id' => 'sortOrder')) }}
	{{ Form::hidden('filterval', $request->filterval, array('id' => 'filterval')) }}
	{{ Form::hidden('plimit', $request->plimit , array('id' => 'plimit')) }}
	{{ Form::hidden('page', $request->page , array('id' => 'page')) }}
<div class="" id="main_contents">
<!-- article to select the main&sub menu -->
<article id="userlist" class="DEC_flex_wrapper" data-category="userlist userlist_sub_1">
	<fieldset class="pm0" style="margin-top: 15px;">
		<div class="header">
			<img class="headerimg box40 imgviewheight" src="{{ URL::asset('public/images/list.png')  }}">
			<h2 class="h2cnt">
				{{ trans('messages.lbl_userlist')}}
			</h2>
		</div>
	</fieldset>
	<div class="col-xs-12 pm0 pull-left mt5 mt13">
			
		</div>
			{{ Form::select('usersort', $sortarray, $request->usersort,
						array('class' => 'form-control '.' ' .$request->sortstyle.' '.'CMN_sorting pull-right mr0',
								'id' => 'usersort',
								'style' =>'border-radius: 4px;',
								'name' => 'usersort'))
				}}
			<a href="javascript:clearsearch()" title="Clear Search">
				<img class="pull-right box35 mr10 pageload clearposition" src="{{ URL::asset('public/images/clearsearch.png')  }}">
			</a>
		 <div  style="margin-top:13.5%;position: fixed;" 
			@if($request->singlesearch != "") 
			class="open CMN_fixed mt183 searchposuser" 
			@else 
			class="CMN_fixed mt183 searchposuser" 
			@endif
		 	id="styleSelector">
			<div class="selector-toggle">
				<a id="sidedesignselector" href="javascript:void(0)"></a>
			</div>
			<ul>
				<span>
					<li style="">
						<p class="selector-title">{{ trans('messages.lbl_search') }}</p>
					</li>
				</span>

				<li class="theme-option ml6">
				<div class="box100per mt5"  onKeyPress="return checkSubmitsingle(event)">
					{!! Form::text('singlesearch',null,
							array('','class'=>' form-control box80per pull-left','placeholder' =>trans('messages.lbl_placeholderuser'),'style'=>'height:30px;','id'=>'singlesearch')) !!}

					{{ Form::button('<i class="fa fa-search" aria-hidden="true"></i>', 
							array('class'=>'ml5 mt2 pull-left search box15per btn btn-info btn-sm', 
							'type'=>'button',
							'onclick' => 'javascript:fnSingleSearch();',
							'placeholder' =>trans('messages.lbl_placeholderuser'),
							'style'=>'border: none;' 
						)) }}
					</div>
				</li>
			</ul>
		</div>
		<div class="pull-left input-group mt5 mb5">
			{{ Form::button(
							trans('messages.lbl_all'),
							array('class'=>'pageload btn-link filterdes '.$disabledall,
							'type'=>'button',
							'onclick' => 'javascript:return filter(1)')) 
			}}
			<span class = "filterdes">|</span>
			{{ Form::button(
							trans('messages.lbl_verified'),
							array('class'=>'pageload btn-link filterdes'.$disabledverified,
							'type'=>'button',
							'onclick' => 'javascript:return filter(2)')) 
			}}
			<span class = "filterdes">|</span>
			{{ Form::button(
							trans('messages.lbl_notverified'),
							array('class'=>'pageload btn-link filterdes'.$disabledunverified,
							'type'=>'button',
							'onclick' => 'javascript:return filter(3)')) 
			}}
		</div>
	<div class="container bbgrey pm0">
		<ul class="list-group pm0 rowlist">
				@forelse ($userDetails as $key => $user)
					<li class="list-group-item  col-xs-12">
						<div class="h110 col-xs-1 pm3 pull-left">
							<center>
								<label class="box50per mt15 userdes">
											<a href="javascript:fnRedirectToview('{{ $user->userId }}')" style="color:blue;" class="fwb ftclr vam">
												{{ $user->userId }}
											</a>
										</label><br>
								@if($user->gender == 1)
									<img class="pull-left box70 mr5  ml20 imagedes" src="{{ URL::asset('public/images/no-prof-male.JPG')  }}" 
									width="90" height = "70">
									</img>
								@else
									<img class="pull-left box70 mr5  ml20 imagedes" src="{{ URL::asset('public/images/no-prof-female.jpg')  }}" 
									width="90" height = "70">
									</img>
								@endif
							</center>
						</div>
						<span class="col-xs-10" style="margin-top:1%;">
							<span class="pull-left pm0 fwb fs17 linkclr userdesname" style="padding-left:1%;">
								<b>
								@if(isset($user->lastName))
									{{ empnamelength($user->lastName, 30) }}
								@else
									{{ trans('messages.lbl_nil')}}
								@endif
								@if(isset($user->firstName)) 
									{{ empnamelength($user->firstName, 30) }}
								@else
									{{ trans('messages.lbl_nil')}}
								@endif
								</b>
							</span>
						</span>
						<br>
						<div class="col-xs-9 mt5 userdes">
							<span title="Date Of Birth">
								<span class="cg fa fa-calendar" style="padding-left:1%;"></span>
								@if(isset($user->dob))
									{{ $user->dob }}
								@else
									{{ trans('messages.lbl_nil')}}
								@endif
							</span>
						</div>
						<br>
						<div class="col-xs-9  mt5 userdesmail">
							<span title="Email Id">
								<span class="cg fa fa-envelope-square" style="padding-left:1%;"></span>
								@if(isset($user->email))
									{{ $user->email }}
								@else
									{{ trans('messages.lbl_nil')}}
								@endif
							</span>
						</div>
						<br>
						<div class="col-xs-5 mt5 userdes1" style="margin-bottom:1%;">
							<span title="Contact Number">
								<span class="cg fa fa-phone userdes1" style="padding-left:2%;"></span>
								@if(isset($user->mobileNo))
									{{ $user->mobileNo }}
								@else
									{{ trans('messages.lbl_nil')}}
								@endif
							</span>
						</div>
					</li>
				@empty
					<span class="col-xs-12 fr" id="nodatafound" style="text-align : center">
						{{ trans('messages.lbl_nodatafound')}}</span>
				@endforelse
			</ul>
	</div>
	@if($userDetails->total())
			<div class="text-center col-xs-12 pm0 pagealign">
				@if(!empty($userDetails->total()))
					<span class="pull-left mt24 pagination1">{{ $userDetails->firstItem() }}
						<span class="mt5">～</span>
						{{ $userDetails->lastItem() }} / {{ $userDetails->total() }}
					</span>
				@endif 
				<span class ="pagintion2">
				{{ $userDetails->links() }}
				</span>
				<span class="pull-right pagination mt1">
					{{ $userDetails->linkspagelimit() }}
				</span>
			</div>
		@endif 
	{{ Form::close() }}
</article>
</div>
@endsection