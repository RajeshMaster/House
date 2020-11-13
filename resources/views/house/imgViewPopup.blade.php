{{ HTML::script(asset('public/js/house.js')) }}
<script type="text/javascript">
	function divpopupclose() {
		if (cancel_check == true) {
			$("body div" ).removeClass( "modalOverlay" );
			$('#imgViewPopup').empty();
			$('#imgViewPopup').modal('toggle');
		} else {
			if (confirm(cancel_msg)) {
				cancel_check = true;
				$("body div").removeClass( "modalOverlay" );
				$('#imgViewPopup').empty();
				$('#imgViewPopup').modal('toggle');
			} else {
				return false;
			}
		}
	}
</script>
<style type="text/css">
	@media all and (min-width:770px) {
		.modal {
			width: 50%;
			position: absolute;
			top: 25%;
			left: 20%;
		}
		.houImage {
			width:400px;
			height:400px;
		}
	}
	@media all and (max-width: 768px) {
		.modal {
			width: 95%;
			position: absolute;
			top: 5%;
			left: 5%;
		}
		.houImage {
			width:200px;
			height:200px;
		}
	}
</style>
{{ Form::open(array('name'=>'imgViewPopup', 'id'=>'imgViewPopup',
							'files'=>true, 
							'class' => 'form-horizontal',
							'url' => '', 
							'method' => 'POST')) }}
	{{ Form::hidden('mainmenu', $request->mainmenu , array('id' => 'mainmenu')) }}
	{{ Form::hidden('userId', $request->userId , array('id' => 'userId')) }}
	{{ Form::hidden('houseId', $request->houseId , array('id' => 'houseId')) }}
	<div class="modal-content">
		<div class="modal-header popH_color" style="height: 60px;">
			<button type="button" onclick="divpopupclose();" class="close mt7" 
				style="color: red !important;" aria-hidden="true">&#10006;</button>
			<span class="modal-title custom_align">
				<h3 class="pull-left pl5 mt5">
					{{ trans('messages.lbl_image') }}
				</h3>
			</span>
		</div>
		<div class="form-group mt10 mb10" style="min-height: 100px;">
			<div class="mt20 mb20 tac">
				@foreach($houseImgdetails as $key => $image)
					<?php
						$housePath = "public/uploads/".$request->userId."/House/".$request->houseId."/".$image->MainImgName."/".$image->SubImgName."/".$image->fileName;
						$dwnldPath = "../../../public/uploads/".$request->userId."/House/".$request->houseId."/".$image->MainImgName."/".$image->SubImgName."/";
					?>
					@php $ImageName = $image->mainCategory.$image->subCategory.$image->id;
						$imageId = $image->id;
					@endphp
					@if($housePrevId == $imageId) 
						{{--*/ $previmg = "/previousdisab.png" /*--}}
						{{--*/ $disableprev = "disabled" /*--}}
						{{--*/ $cursorprev = "cursor:default;vertical-align:middle;" /*--}}
					@else
						{{--*/ $previmg = "/previousenab.png" /*--}}
						{{--*/ $disableprev = "" /*--}}
						{{--*/ $cursorprev = "cursor:pointer;" /*--}}
					@endif
					@if($houseNextId == $imageId)
						{{--*/ $nextimg = "/nextdisab.png" /*--}}
						{{--*/ $disablenext = "disabled" /*--}}
						{{--*/ $cursornext = "cursor:default;vertical-align:middle;" /*--}}
					@else
						{{--*/ $nextimg = "/nextenab.png" /*--}}
						{{--*/ $disablenext = "" /*--}}
						{{--*/ $cursornext = "cursor:pointer;" /*--}}
					@endif
					@if($ImageName == $request->fileImage)
						<div id="image<?php echo $ImageName; ?>">
					@else
						<div id="image<?php echo $ImageName; ?>" style="display: none;">
					@endif
						<div class="mt10">
							<img src="{{ URL::asset('public/images'.$previmg) }}"
								width='17' height='17' class="vam" id = "prev<?php echo $ImageName; ?>"
								@if ($housePrevId != $imageId)  
									onclick = "fnprevnext('{{ $ImageName }}','{{ $image->id }}',1);"
								@endif {{ $disableprev }} style="{{ $cursorprev }}">
							<span class="ml10 mr10">{{ $image->MainImgName }} -> {{ $image->SubImgName }} -> {{ $image->fileName }}</span>
							<img src="{{ URL::asset('public/images'.$nextimg) }}" 
								width='17' height='17' class=" vam"  id = "next<?php echo $ImageName; ?>"
								@if ($houseNextId != $imageId)
									onclick = "fnprevnext('{{ $ImageName }}','{{ $image->id }}',2);" 
								@endif {{ $disablenext }} style="{{ $cursornext }}">
						</div>
						<div class="mt10">
							<a style="text-decoration:none !important;" 
								href="{{ URL::asset($housePath) }}" data-lightbox="img">
								<img src="{{ URL::asset($housePath) }}" class="box200 mt10 mb10 houImage">
							</a>
						</div>
					</div>
					@if($ImageName == $request->fileImage)
						<div id="dwnld<?php echo $ImageName; ?>" class="mt20">
					@else
						<div id="dwnld<?php echo $ImageName; ?>" class="mt20" style="display: none;">
					@endif
						<a class="glyphicon glyphicon-save" style="text-decoration:none !important;"
							href="javascript:download('{{ $image->fileName }}','{{ $dwnldPath }}');">
						</a>
					</div>
				@endforeach
			</div>
		</div>
	</div>
{{ Form::close() }}