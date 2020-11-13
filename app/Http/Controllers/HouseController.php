<?php
namespace App\Http\Controllers;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Model\House;
use App\Model\Loan;
use App\Model\Common;
use Session;
use Redirect;
use Auth;
use PHPExcel_Worksheet_Drawing;
use PHPExcel_Style_Border;
use PHPExcel_Style_Alignment;
use PHPExcel_Style_Fill;
use Excel;
use Illuminate\Support\Facades\Validator;

class HouseController extends Controller
{
	/**  
	*  House Index Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public function index(Request $request){

		// PAGINATION
		if ($request->plimit=="") {
			$request->plimit = 50;
		}
		// SORTING PROCESS
		if ($request->houseSort == "") {
			$request->houseSort = "purchaseDate";
		}
		if (empty($request->sortOrder)) {
			$request->sortOrder = "desc";
		}
		if ($request->sortOrder == "asc") {
			$request->sortstyle = "sort_asc";
		} else {
			$request->sortstyle = "sort_desc";
		}
		$sortarray = array("purchaseDate" => trans('messages.lbl_purch_date'),
							"houseName" => trans('messages.lbl_housename'),
							"belongsTo" => trans('messages.lbl_belongsTo'),
							"bankId" => trans('messages.lbl_bankId'));

		if ($request->userId == "") {
			$request->userId = Auth::user()->userId;
		}

		$houseDetails = House::fnGetHouseDetails($request,0);

		// Used for display
		$houseArrVal = array();
		$totArrVal = array();
		$loanIdArr = array();
		$remainLoanTotal  = "";
		$date = date("Y-m-d");
		$yrMnth = date("Y-m");
		
		foreach ($houseDetails as $key => $value) {
			$loanBalance = 0;
			if ($value->loanFlg == 1) {
				$loanDetails = House::fnGetLoanDetails($value->houseId);
				if (!empty($loanDetails)) {
					// to avoid same loan repeatation
					if (!in_array($loanDetails[0]->loanId, $loanIdArr)) {
						array_push($loanIdArr, $loanDetails[0]->loanId);
						$currEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,"","",$yrMnth);
						// print_r($currEmiData);exit();
						$nextEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,$date,"next");
						// For active Loan
						if (!empty($currEmiData)) {		
							$loanBalance = $currEmiData[0]->loanBalance/10000;
						} 
						// For future Loan
						else if(!empty($nextEmiData)){		
							$loanBalance = $loanDetails[0]->loanAmount;
						} 
						// for expired loan
						else { 	
							$prevEmiData = Loan::fnGetEMIData($loanDetails[0]->loanId,$date,"prev");
							if (!empty($prevEmiData)) {
								end($prevEmiData); // for lask key of array
								$loanBalance = $prevEmiData[key($prevEmiData)]->loanBalance;
							} 
						}
					}
				}
				$houseArrVal[$value->houseId]['loanBalance'] = $loanBalance;
				$remainLoanTotal += $loanBalance;
				$assetAmt = "";
				
			}
			$houseArrVal[$value->houseId]['loanBalance'] = $loanBalance;
			if ($value->currentValue != "") {
				$assetAmt = $value->currentValue - $loanBalance; 
			}
			$houseArrVal[$value->houseId]['assetAmt'] = $assetAmt;
			$getCntHouseImg = House::getCntHouseImg($request,$value->houseId);
			$houseArrVal[$value->houseId]['countImg'] = count($getCntHouseImg);
			
		}
		return view('house.index', ['houseDetails' => $houseDetails,
									'sortarray' => $sortarray,
									'houseArrVal' => $houseArrVal,
									'request' => $request]);

	}
	
	/**  
	*  House View Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/24
	**/
	public function view(Request $request) {

		if(Session::get('houseId') != "" && Session::get('houseUserId') != "" && $request->houseId == "") {
			$request->houseId =  Session::get('houseId');
			$request->userId =  Session::get('houseUserId');
		}
		if ($request->houseId == "" || $request->userId == "") {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}

		$userDetails = House::fnGetUserDetails($request->userId);
		if (empty($userDetails)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}
		$houseImgdetails = House::fnGetHouseImgDtls($request);
		$mainCatdetails = House::fnGetMainImageName();
		$subCatdetails = array();
		foreach ($mainCatdetails as $key => $main) {
			$subCatdetails[$main->id]['subCat'] = House::fnGetSubImageName($main->id);
			$subCatDtls = $subCatdetails[$main->id]['subCat'];
			$subCatdetails[$main->id]['mainCount'] = count($subCatDtls);
			$subCatdetails[$main->id]['mainCat'] = House::fnGetMainImgCount($request,$main->id);
			$subCatdetails[$main->id]['mainCountDtls'] = count($subCatdetails[$main->id]['mainCat']);
			foreach ($subCatDtls as $subkey => $subvalue) {
				$subCatdetails[$main->id][$subvalue->id]['fileCat'] = House::fnGetSubImgCount($request,$main->id,$subvalue->id);
				$fileCatDtls = $subCatdetails[$main->id][$subvalue->id]['fileCat'];
				$subCatdetails[$main->id][$subvalue->id]['subCount'] = count($fileCatDtls);
			}
		}
		// echo "<pre>";print_r($subCatdetails);echo "</pre>";exit();
		$details = House::fnGetHouseDetails($request,1);
		if (empty($details)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		} else {
			$details[0]->buildingName = House::fnGetBuildingName($details[0]->buildingName);
		}

		return view('house.view', ['details' => $details[0],
									'houseImgdetails' => $houseImgdetails,
									'mainCatdetails' => $mainCatdetails,
									'subCatdetails' => $subCatdetails,
									'request' => $request]);

	}

	/**  
	*  House addEdit Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public function addEdit(Request $request) {

		if ($request->userId == "") {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		} 

		$userDetails = House::fnGetUserDetails($request->userId);
		if (empty($userDetails)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}

		$houseAddress =  Common::fnGetBuildingName();
		$houseAddressarray = array();
		foreach ($houseAddress as $key => $house) {
			$houseAddressarray[$house->id] = $house->buildingName;
		}
		$familyMembers =  Common::fnGetFamilyMembers();
		$familyMembersarray = array();
		foreach ($familyMembers as $key => $family) {
			$familyMembersarray[$family->id] = $family->familyName;
		}
		if ($request->editChk == 1) {
			$detedit = House::fnGetHouseDetails($request,1);
			if (!empty($detedit[0])) {
				$detedit['belongsTo'] = $detedit[0]->belongsTo;
				$detedit['purchaseDate'] = $detedit[0]->purchaseDate;
				$detedit['purchaseAmount'] = number_format($detedit[0]->purchaseAmount);
				$detedit['pincode'] = $detedit[0]->pincode;
				$detedit['address'] = $detedit[0]->address;
				$detedit['buildingName'] = $detedit[0]->buildingName;
				$detedit['houseName'] = $detedit[0]->houseName;
				$detedit['houseNo'] = $detedit[0]->houseNo;
				$detedit['image1'] = $detedit[0]->image1;
				$detedit['houseType'] = $detedit[0]->houseType;
				$detedit['houseSize'] = $detedit[0]->houseSize;
				$detedit['balaconySize'] = $detedit[0]->balaconySize;
				$detedit['houseBuildOn'] = $detedit[0]->houseBuildOn;
				$detedit['maintFees'] = ($detedit[0]->maintFees) ? number_format($detedit[0]->maintFees) : "";
				$detedit['tax'] = ($detedit[0]->tax) ? number_format($detedit[0]->tax) : "";
				$detedit['currentValue'] = ($detedit[0]->currentValue) ? number_format($detedit[0]->currentValue) : "";
			}
		}

		return view('house.addedit', ['detedit' => (isset($detedit)) ? $detedit : "",
										'houseAddressarray' => $houseAddressarray,
										'familyMembersarray' => $familyMembersarray,
										'request' => $request]);
	}

	/**  
	*  House Insert,Update Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public function addeditprocess(Request $request) {

		if (!isset($request->userId)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}

		$houseCode = "";
		if (!isset($request->editpage)) {
			$houseCode = "HOUSE001";
			$generateHouseId = House::getcount();
			if (!empty($generateHouseId)) {
				$houseCode = $generateHouseId[0]->houseId;
			}
		} else {
			$details = House::fnGetHouseDetails($request,1);
			$houseCode = $details[0]->houseId;
		}
		if ($request->hasFile('image1')) {
			// $filename = $request->image1->getClientOriginalName();
			$ifile = $_FILES["image1"]["name"];
			$fileType = explode(".",$ifile);
			$fileName = $houseCode.".".end($fileType);
			$path = base_path() . "/public/uploads/".$request->userId."/House/".$houseCode;
			if(!is_dir($path)) {
				mkdir($path, 0777,true);
			}

			$path = $path."/";
			if ($request->file_name_temp != '') {
				unlink($path."/".$request->file_name_temp);
			}

			$request->image1->move($path, $fileName);
		} else if (isset($request->file_name_temp)) {
			$fileName = $request->file_name_temp;
		} else {
			$fileName = "";
		}

		if(isset($request->editpage)) {
			$update = House::updateHouseDetails($request,$fileName,$houseCode);
			if($update) {
				Session::flash('message', 'Updated Sucessfully!');
				Session::flash('type', 'alert-success'); 
			} else {
				Session::flash('danger', 'Updated Unsucessfully!'); 
				Session::flash('type', 'alert-danger'); 
			}
		} else {
			$insert = House::insertHouseDetails($request,$fileName,$houseCode);
			if($insert) {
				$request->houseId = House::getlatestHouseDetails();

				Session::flash('message', 'Inserted Sucessfully!'); 
				Session::flash('type', 'alert-success'); 
			} else {
				Session::flash('danger', 'Inserted Unsucessfully!'); 
				Session::flash('type', 'alert-danger'); 
			}
		}

		// to addEdit address master table
		$insOrUpAddr = House::updateOrInsertAddr($request,$houseCode);

		Session::put('houseId', $request->houseId); 
		Session::put('houseUserId', $request->userId); 

		return Redirect::to('House/view?mainmenu=menu_house&time='.date('YmdHis'));
	}

	/**  
	* Get Building Name
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/09/09
	**/
	public function getBuildingName(Request $request) {

		if(isset($request->orderId) && $request->orderId != ""){
			$buildingName = House::fnGetBuildingName($request->orderId);
			$buildingName = json_encode($buildingName);
			echo $buildingName;exit;
		}
	}

	/**  
	*  Upload Image Popup
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/10
	**/
	public function uploadImgPopup(Request $request){
		$mainImageNamearray = array();
		$mainImageName =  House::fnGetMainImageName();
		foreach ($mainImageName as $key => $mainImg) {
			$mainImageNamearray[$mainImg->id] = $mainImg->imageName;
		}
		return view('house.uploadpopup',['request' => $request,
											'mainImageNamearray' => $mainImageNamearray]);
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/10
	**/
	public function subImageId_ajax(Request $request){
		$mainImageId = $request->mainImageId;
		$getSubImgName = House::fnGetSubImageName($mainImageId);
		$subImgNameArray = json_encode($getSubImgName);
		echo $subImgNameArray;
		exit();
	}

	/**  
	*  Upload Image Popup Process
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/10
	**/
	public function uploadImgProcess(Request $request){
		$mainImgName = House::getMainImgName($request->mainImageId);
		if (isset($mainImgName[0]->imageName)) {
			$mainName = mb_convert_encoding($mainImgName[0]->imageName,'SJIS','AUTO');
		} else {
			$mainName =  "";
		}
		$subImgName = House::getSubImgName($request->subImageId);
		if (isset($subImgName[0]->imageName)) {
			$subName = mb_convert_encoding($subImgName[0]->imageName,'SJIS','AUTO');
		} else {
			$subName =  "";
		}
		if ($request->hasFile('imgfile')) {
			// $filename = $request->image1->getClientOriginalName();
			$ifile = $_FILES["imgfile"]["name"];
			$fileType = explode(".",$ifile);
			$path = base_path() . "/public/uploads/".$request->userId."/House/".$request->houseId."/".$mainName."/".$subName;
			if(!is_dir($path)) {
				mkdir($path, 0777,true);
			}
			$path = $path."/";
			$fileCount = House::getlatestHouseImagesDtls();
			$fileCount = $fileCount + 1;
			$fileName = $subName."_".$fileCount.".".end($fileType);
			$request->imgfile->move($path,$fileName);
			// print_r($fileName);exit();
			// $fileName = $subImgName[0]->imageName."_".$fileCount.".".end($fileType);
		} else {
			$fileName = "";
		}
		$uploadImg = House::insertHouseImages($request,$fileName);
		if($uploadImg) {
			Session::flash('message', 'Uploaded Sucessfully!'); 
			Session::flash('type', 'alert-success'); 
		} else {
			Session::flash('danger', 'Uploaded Unsucessfully!'); 
			Session::flash('type', 'alert-danger'); 
		}
		Session::flash('houseId', $request->houseId); 
		Session::flash('houseUserId', $request->userId); 
		return Redirect::to('House/view?mainmenu=menu_house&time='.date('YmdHis'));
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/11
	**/
	public function subMainImageName_ajax(Request $request){
		$getMainSubImageName = House::getMainSubImageName($request);
		$MainSubImageNameArray = json_encode($getMainSubImageName);
		echo $MainSubImageNameArray;
		exit();
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/11
	**/
	public function AllImageName_ajax(Request $request){
		$getAllImageName = House::fnGetHouseImgDtls($request);
		$AllImageNameArray = json_encode($getAllImageName);
		echo $AllImageNameArray;
		exit();
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/14
	**/
	public function prevNxtImg_ajax(Request $request){
		$prevNxtImg = House::getPrevNxtImg($request);
		$prevNxtImgArray = json_encode($prevNxtImg);
		echo $prevNxtImgArray;
		exit();
	}

	/**  
	*  Image View Popup
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/14
	**/
	public function imgViewPopup(Request $request){
		$housePrevId = House::getHouseMinId($request);
		$houseNextId = House::getHouseMaxId($request);
		$houseImgdetails = House::fnGetHouseImgDtls($request);
		if ($request->fileImage == "index") {
			if(isset($houseImgdetails[0])) {
				$request->fileImage = $houseImgdetails[0]->mainCategory.$houseImgdetails[0]->subCategory.$houseImgdetails[0]->id;
			} 
		} 
		return view('house.imgViewPopup',['request' => $request,
											'houseImgdetails' => $houseImgdetails,
											'housePrevId' => $housePrevId,
											'houseNextId' => $houseNextId
										]);
	}

	/**  
	* To Get Building Address and Date
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/08/27
	**/
	public function buildingId_ajax(Request $request){
		$buildingId = $request->buildingId;
		$getBuildingAdd = Common::fnGetBuildingAdd($buildingId);
		$buildingAddArray = json_encode($getBuildingAdd);
		echo $buildingAddArray;
		exit();
	}

	/**  
	*  Memo Register Page
	*  @author Sastha 
	*  @param $request
	*  Created At 13/10/2020
	**/
	public function memoReg(Request $request) {
		if (!isset($request->userId)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}
		$houseDtls = House::fnGetHouseDetails($request,1);
		return view('house.memoReg',['request' => $request,
										'houseDtls' => $houseDtls
									]);
	}

	/**
	*
	* To validate Momo content register 
	* @author Sastha
	* @return object to particular view page
	* Created At 13/10/2020
	*/
	/*public function memoRegValidation(Request $request) {
		$commonrules = array();
		$commonrules = array(
			'memoContent' => 'required',
		);
		$rules = $commonrules;
		$validator = Validator::make($request->all(), $rules);
		if ($validator->fails()) {
			return response()->json($validator->messages(), 200);exit;
		} else {
			$success = true;
			echo json_encode($success);
		}
	}*/

	/**  
	*  House Memo Insert Details
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/10/13
	**/
	public function memoRegprocess(Request $request) {

		if (!isset($request->userId)) {
			return Redirect::to('House/index?mainmenu=menu_house&time='.date('YmdHis'));
		}
		// to addEdit address master table
		$updateMemo = House::updateMemo($request);
		if($updateMemo) {
			Session::flash('message', 'Memo Updated Sucessfully!'); 
			Session::flash('type', 'alert-success'); 
		} else {
			Session::flash('danger', 'Memo Updated Unsucessfully!'); 
			Session::flash('type', 'alert-danger'); 
		}
		Session::flash('houseId', $request->houseId); 
		Session::flash('houseUserId', $request->userId); 

		return Redirect::to('House/view?mainmenu=menu_house&time='.date('YmdHis'));
	}
}
