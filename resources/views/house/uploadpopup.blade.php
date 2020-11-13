{{ HTML::script(asset('public/js/house.js')) }}
<script type="text/javascript">
	$('.uploadImgProcess').click(function () {
		$("#uploadImgPopup").validate({
			showErrors: function(errorMap, errorList) {
			// Clean up any tooltips for valid elements
				$.each(this.validElements(), function (index, element) {
						var $element = $(element);
						$element.data("title", "") // Clear the title - there is no error associated anymore
								.removeClass("error")
								.tooltip("destroy");
				});
				// Create new tooltips for invalid elements
				$.each(errorList, function (index, error) {
					var $element = $(error.element);
					$element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
							.data("title", error.message)
							.addClass("error")
							.tooltip(); // Create a new tooltip based on the error messsage we just set in the title
				});
			},
			rules: {
				mainImageId : { required: true },
				subImageId : { required: true },
				imgfile: { required: true}
			},
			submitHandler: function(form) { // for demo
				swal({
					title: msg_upload,
					type: "info",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					closeOnConfirm: true,
					closeOnCancel: true
				},
				function(isConfirm) {
					if(isConfirm) {    
						pageload();
						form.submit();
						return true;
					} else {
						return false;
					}
				});
			}
		});
		$.validator.messages.required = function (param, input) {
			var article = document.getElementById(input.id);
			return article.dataset.label + ' field is required';
		}
	});
	function divpopupclose() {
		if (cancel_check == true) {
			$("body div" ).removeClass( "modalOverlay" );
			$('#uploadPopup' ).empty();
			$('#uploadPopup').modal('toggle');
		} else {
			if (confirm(cancel_msg)) {
				cancel_check = true;
				$("body div" ).removeClass( "modalOverlay" );
				$('#uploadPopup' ).empty();
				$('#uploadPopup').modal('toggle');
			} else {
				return false;
			}
		}
	}
</script>
<style type="text/css">
	@media all and (min-width:770px) {
		.modal {
			width: 40%;
			position: absolute;
			top: 5%;
			left: 20%;
		}
	}
	@media all and (max-width: 768px) {
		.modal {
			width: 85%;
			position: absolute;
			top: 5%;
			left: 10%;
		}
		.regdes{
			width:130px !important;
		}
	}
</style>
{{ Form::open(array('name'=>'uploadImgPopup', 'id'=>'uploadImgPopup',
							'files'=>true, 
							'class' => 'form-horizontal',
							'url' => 'House/uploadImgProcess?time='.date('YmdHis'), 
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
					{{ trans('messages.lbl_upload_image') }}
				</h3>
			</span>
		</div>
		<div>
			<div class="form-group" style="min-height: 130px;">
				<div class="col-md-12 mt25" style="margin-bottom:-6px;">
					<div class="col-md-6 text-right">
						<label class="clr_blue mt2">
							{{ trans('messages.lbl_main_category') }}
							<span class="fr ml2"> * </span>
						</label>
					</div>
					<div class="col-md-5 form-group">
						{{ Form::select('mainImageId', [null=>''] + $mainImageNamearray,null,
							array('class' => 'form-control regdes',
									'id' => 'mainImageId',
									'name' => 'mainImageId',
									'onchange'=>'fnGetSubImgName();',
									'style'=> 'width:170px;',
									'data-label' => trans('messages.lbl_main_category'))) }}
					</div>
				</div>
				<div class="col-md-12 mt15" style="margin-bottom:-6px;">
					<div class="col-md-6 text-right">
						<label class="clr_blue mt2">
							{{ trans('messages.lbl_sub_category') }}
							<span class="fr ml2"> * </span></label>
					</div>
					<div class="col-md-5 form-group">
						{{ Form::select('subImageId', [null=>''],null,
							array('class' => 'form-control regdes',
									'id' => 'subImageId',
									'name' => 'subImageId',
									'style'=> 'width:170px;',
									'onchange'=>'fnGetSubExpName();checkmonth();',
									'data-label' => trans('messages.lbl_sub_category'))) }}
					</div>
				</div>
				<div class="col-md-12 mt15">
					<div class="col-md-6 text-right">
						<label class="clr_blue mt2">
							{{ trans('messages.lbl_upload_image') }}
							<span class="fr ml2"> * </span></label>
					</div>
					<div class="col-md-5 form-group">
						{{ Form::file('imgfile',
								array('id'=>'imgfile',
										'class' => 'regdes',
										'name' => 'imgfile',
										'style'=> 'width:170px;',
										'accept' => '.jpg, .jpeg , .png ',
										'onchange' => 'javascript:validate(this.value);',
										'data-label' => trans('messages.lbl_upload_image'))) }}
					</div>
				</div>
			</div>
			<div class="modal-footer popF_color">
				<center>
					<button type="submit" id="uploadImgProcess" 
					class="btn btn-info CMN_display_block uploadImgProcess">
					<i class="fa fa-upload"></i>
					&nbsp;{{ trans('messages.lbl_upload') }}</button>
					<button type="button" onclick="divpopupclose();" class="btn btn-danger CMN_display_block box100 button" >{{ trans('messages.lbl_cancel') }}</button>
				</center>
			</div>
		</div>
	</div>
{{ Form::close() }}