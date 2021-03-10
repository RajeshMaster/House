<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
use DB;
use Session;
use Input;
use Auth;
use Carbon\Carbon ;
use Config;

class House extends Model {

	/**  
	*  House Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public static function fnGetHouseDetails($request,$flg){

		$db = DB::connection('mysql');
		$query = $db->table('ams_house_details as house')
					->select('house.*','familyMst.id as familyId','familyMst.familyName','bankMst.nickName')
					->LEFTJOIN('ams_family_master AS familyMst','house.belongsTo','=','familyMst.id')
					->LEFTJOIN('ams_bankname_master AS bankMst','house.bankId','=','bankMst.id')
					->where('house.userId', '=', $request->userId)
					->where('house.soldFlg', '=', 0)
					->where('house.delFlg', '=', 0);
			if (isset($request->houseId) && $request->houseId != "") {
				$query = $query->where('house.houseId', '=', $request->houseId);
			}
			if ($flg == 0) {
				$query = $query	->orderBy('house.'.$request->houseSort, $request->sortOrder)
								->paginate($request->plimit);
			} else {
				$query = $query ->orderBy('house.belongsTo')
								->get();
			}
		
		return $query;
	}

	/**  
	*  New House Id
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/27
	**/
	public static function getcount() {
		$query = DB::table('ams_house_details')
				->select('houseId',DB::RAW("IF(houseId=(SELECT houseId FROM ams_house_details
						ORDER BY id DESC LIMIT 1), CONCAT('HOUSE', LPAD(SUBSTRING(houseId, 6)+1, 3, 0)),houseId) AS houseId"))
				->orderby('houseId','DESC')
				->limit(1)
				->get();
		return $query;
	}

	/**  
	*  User Details
	*  @author Madasamy 
	*  @param $userId
	*  Created At 2020/08/19
	**/
	public static function fnGetUserDetails($userId){
		$db = DB::connection('mysql');
		$query = $db->table('ams_users')
					->select('*')
					->where('userId', '=', $userId)
					->get();
		return $query;
	}

	/**  
	*  House Insert
	*  @author Madasamy 
	*  @param $request,$filename,$houseCode
	*  Created At 2020/08/19
	**/
	public static function insertHouseDetails($request,$filename,$houseCode){

		$db = DB::connection('mysql');
		$insert = $db->table('ams_house_details')
					->insert(['userId' => $request->userId,
								'houseId' => $houseCode,
								'belongsTo' => $request->belongsTo,
								'purchaseDate' => $request->purchaseDate,
								'purchaseAmount' => str_replace(",", "", $request->purchaseAmount),
								'pincode' => $request->pincode,
								'buildingName' => $request->buildingName,
								'houseName' => $request->houseName,
								'houseNo' => $request->houseNo,
								'address' => $request->address,
								'image1' => $filename,
								'houseType' => $request->houseType,
								'houseSize' => $request->houseSize,
								'balaconySize' => $request->balaconySize,
								'houseBuildOn' => $request->houseBuildOn,
								'maintFees' => str_replace(",", "", $request->maintFees),
								'tax' => str_replace(",", "", $request->tax),
								'currentValue' => str_replace(",", "", $request->currentValue),
								'createdBy' => Session::get("FirstName"),
								'createdDateTime' => date('Y-m-d H:i:s')
							]);
		return $insert;
	}

	/**  
	*  House Update
	*  @author Madasamy 
	*  @param $request,$filename,$houseCode
	*  Created At 2020/08/19
	**/
	public static function updateHouseDetails($request,$filename,$houseCode) {
		$db = DB::connection('mysql');
		$update = $db->table('ams_house_details')
					->where('houseId', $request->houseId)
					->update(['userId' => $request->userId,
								'houseId' => $houseCode,
								'belongsTo' => $request->belongsTo,
								'purchaseDate' => $request->purchaseDate,
								'purchaseAmount' => str_replace(",", "", $request->purchaseAmount),
								'pincode' => $request->pincode,
								'buildingName' => $request->buildingName,
								'houseName' => $request->houseName,
								'houseNo' => $request->houseNo,
								'address' => $request->address,
								'image1' => $filename,
								'houseType' => $request->houseType,
								'houseSize' => $request->houseSize,
								'balaconySize' => $request->balaconySize,
								'houseBuildOn' => $request->houseBuildOn,
								'maintFees' => str_replace(",", "", $request->maintFees),
								'tax' => str_replace(",", "", $request->tax),
								'currentValue' => str_replace(",", "", $request->currentValue),
								'updatedBy' => Session::get("FirstName"),
								'updatedDateTime' => date('Y-m-d H:i:s')
							]);
		return $update;

	}

	/**  
	*  Latest House Details
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/19
	**/
	public static function getlatestHouseDetails() {
		$db = DB::connection('mysql');
		$latDetails = $db->table('ams_house_details')->max('id');
		return $latDetails;
	}

	/**  
	*  Update or insert address Details
	*  @author Madasamy 
	*  @param $request,$houseCode
	*  Created At 2020/08/25
	**/
	public static function updateOrInsertAddr($request,$houseCode){
		$db = DB::connection('mysql');
		$insert=$db->table('ams_address')
							->updateOrInsert([
								'houseId' => $houseCode
							],
							[
								'userId' => $request->userId,
								'pincode' => $request->pincode,
								'address' => $request->address,
								'buildingName' => $request->buildingName,
								'houseName' => $request->houseName,
								'houseNo' => $request->houseNo,
								'createdBy' => Session::get("FirstName"),
								'createdDateTime' => date('Y-m-d H:i:s'),
								'updatedBy' => Session::get("FirstName"),
								'updatedDateTime' => date('Y-m-d H:i:s')
							]);
		return $insert;
	}

	/**  
	*  Get Building Name
	*  @author Madasamy 
	*  @param $orderId
	*  Created At 2020/09/09
	**/
	public static function fnGetBuildingName($orderId) {
		$db = DB::connection('mysql');
		$query = $db->table('ams_master_buildingname')
						->select('id','buildingName')
						->where('id','=',$orderId)
						->get();

		if (isset($query[0]->buildingName)) {
			return $query[0]->buildingName;
		} else {
			return $orderId;
		}
	}

	/**
	* To Get Main Image Name
	* @author Sastha
	* Created At 2020/09/10
	**/
	public static function fnGetMainImageName(){
		$query = DB::TABLE('ams_master_houseimg_main')
					->SELECT('*')
					->WHERE('delFlg',0)
					->ORDERBY('OrderId', 'ASC')
					->get();
		return $query;
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $mainImageId
	*  Created At 2020/09/10
	**/
	public static function fnGetSubImageName($mainImageId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_master_houseimg_sub')
					->select('*')
					->WHERE('imageId', '=', $mainImageId)
					->ORDERBY('OrderId', 'ASC')
					->get();
		return $result;
	}

	/**  
	*  Latest House Details
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/19
	**/
	public static function getlatestHouseImagesDtls() {
		$db = DB::connection('mysql');
		$latDetails = $db->table('ams_house_images')->max('id');
		return $latDetails;
	}

	/**  
	* To Get Single Main Image Name
	*  @author Sastha 
	*  @param $mainImageId
	*  Created At 2020/09/10
	**/
	public static function getMainImgName($mainImageId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_master_houseimg_main')
					->select('*')
					->WHERE('id', '=', $mainImageId)
					->get();
		return $result;
	}

	/**  
	* To Get Single Sub Image Name
	*  @author Sastha 
	*  @param $mainImageId
	*  Created At 2020/09/10
	**/
	public static function getSubImgName($subImageId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_master_houseimg_sub')
					->select('*')
					->WHERE('id', '=', $subImageId)
					->get();
		return $result;
	}

	/**  
	*  House Image Insert
	*  @author Sastha 
	*  @param $request,$fileName
	*  Created At 2020/09/10
	**/
	public static function insertHouseImages($request,$fileName){
		$db = DB::connection('mysql');
		$insert = $db->table('ams_house_images')
					->insert(['userId' => $request->userId,
								'houseId' => $request->houseId,
								'mainCategory' => $request->mainImageId,
								'subCategory' => $request->subImageId,
								'fileName' => $fileName,
								'createdBy' => Session::get("FirstName")
							]);
		return $insert;
	}

	/**  
	* To Get House Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/10
	**/
	public static function fnGetHouseImgDtls($request) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_house_images as images')
					->SELECT('images.*','mainImg.imageName as MainImgName','subImg.imageName as SubImgName')
					->WHERE('images.userId', '=' , $request->userId)
					->WHERE('images.houseId', '=', $request->houseId)
					->LEFTJOIN('ams_master_houseimg_main AS mainImg','images.mainCategory','=','mainImg.id')
					->LEFTJOIN('ams_master_houseimg_sub AS subImg','images.subCategory','=','subImg.id')
					->ORDERBY('images.mainCategory', 'ASC')
					->ORDERBY('images.subCategory', 'ASC')
					->GET();
		return $result;
	}

	/**  
	* To Get Sub Image Name
	*  @author Sastha 
	*  @param $mainImageId
	*  Created At 2020/09/10
	**/
	public static function getMainSubImageName($request) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_house_images')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('houseId', '=', $request->houseId)
					->WHERE('mainCategory', '=' , $request->maincategory)
					->WHERE('subCategory', '=', $request->subcategory)
					->ORDERBY('mainCategory', 'ASC')
					->ORDERBY('subCategory', 'ASC')
					->get();
		return $result;
	}

	/**  
	* To Get House Loan details
	*  @author Madasamy 
	*  @param $houseId
	*  Created At 2020/09/10
	**/
	public static function fnGetLoanDetails($houseId) {
		$db = DB::connection('mysql');
		$result = $db->table('ams_loan_details')
					->select('*')
					->where('houseAddress', 'LIKE' , '%'.$houseId.'%')
					->where('activeFlg','=',0)
					->ORDERBY('loanId', 'ASC')
					->get();
		return $result;
	}

	/**  
	* To Get Main Image Count
	*  @author Sastha 
	*  @param $request,$mainId,$subId
	*  Created At 2020/09/14
	**/
	public static function fnGetMainImgCount($request,$mainId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_house_images')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('houseId', '=', $request->houseId)
					->WHERE('mainCategory', '=' , $mainId)
					->ORDERBY('mainCategory', 'ASC')
					->get();
					// ->tosql();
					// dd($result);
		return $result;
	}

	/**  
	* To Get Sub Image Count
	*  @author Sastha 
	*  @param $request,$mainId,$subId
	*  Created At 2020/09/14
	**/
	public static function fnGetSubImgCount($request,$mainId,$subId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_house_images')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('houseId', '=', $request->houseId)
					->WHERE('mainCategory', '=' , $mainId)
					->WHERE('subCategory', '=' , $subId)
					->ORDERBY('subCategory', 'ASC')
					->get();
					// ->tosql();
					// dd($result);
		return $result;
	}

	/**  
	* To Get Previous Next Image Name
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/09/14
	**/
	public static function getPrevNxtImg($request) {
		$db = DB::connection('mysql');
		if ($request->imageFlg == 1) {
			$request->imageId = $request->imageId - 1;
		} else {
			$request->imageId = $request->imageId + 1;
		}
		$result = $db->TABLE('ams_house_images')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('houseId', '=', $request->houseId)
					->WHERE('id', '=' , $request->imageId)
					->ORDERBY('subCategory', 'ASC')
					->get();
		return $result;
	}

	/**  
	*  Latest Minimum Id Image Details
	*  @author Sastha 
	*  @param 
	*  Created At 2020/10/14
	**/
	public static function getHouseMinId($request) {
		$db = DB::connection('mysql');
		$latDetails = $db->table('ams_house_images')
						->WHERE('userId', '=' , $request->userId)
						->WHERE('houseId', '=', $request->houseId)
						->min('id');
		return $latDetails;
	}

	/**  
	*  Latest Maximum Id Image Details
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/10/14
	**/
	public static function getHouseMaxId($request) {
		$db = DB::connection('mysql');
		$latDetails = $db->table('ams_house_images')
						->WHERE('userId', '=' , $request->userId)
						->WHERE('houseId', '=', $request->houseId)
						->max('id');
		return $latDetails;
	}

	/**  
	* To Count House Images
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/10/01
	**/
	public static function getCntHouseImg($request,$houseId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_house_images as images')
					->SELECT('images.*')
					->WHERE('images.userId', '=' , $request->userId)
					->WHERE('images.houseId', '=', $houseId)
					->ORDERBY('images.mainCategory', 'ASC')
					->ORDERBY('images.subCategory', 'ASC')
					->GET();
		return $result;
	}

	/**  
	*  Memo Update
	*  @author Sastha 
	*  @param $request
	*  Created At 2020/08/19
	**/
	public static function updateMemo($request) {
		$db = DB::connection('mysql');
		$update = $db->table('ams_house_details')
					->where('houseId', $request->houseId)
					->update(['memoContent' => $request->memoContent,
								'updatedBy' => Session::get("FirstName"),
								'updatedDateTime' => date('Y-m-d H:i:s')
							]);
		return $update;

	}

}
