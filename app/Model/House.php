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
		$query = $db->table('hms_house_details as house')
					->select('house.*','familyMst.id as familyId','familyMst.familyName')
					->LEFTJOIN('hms_family_master AS familyMst','house.belongsTo','=','familyMst.id')
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
	*  User Details
	*  @author Madasamy 
	*  @param $userId
	*  Created At 2020/08/19
	**/
	public static function fnGetUserDetails($userId){
		$db = DB::connection('mysql');
		$query = $db->table('hms_users')
					->select('*')
					->where('userId', '=', $userId)
					->get();
		return $query;
	}

	/**  
	*  House Insert
	*  @author Sastha 
	*  @param $request,$housevalue
	*  Created At 2020/12/14
	**/
	public static function insHouseData($request,$housevalue){
		$sql = 	DB::table('hms_house_details')
					->updateOrInsert([
							'houseId' => $housevalue->houseId
						],
						[ 
							'userId' => Auth::user()->userId,
							'houseId' => $housevalue->houseId,
							'belongsTo' => $housevalue->belongsTo,
							'purchaseDate' => $housevalue->purchaseDate,
							'purchaseAmount' => str_replace(",", "", $housevalue->purchaseAmount),
							'pincode' => $housevalue->pincode,
							'buildingName' => $housevalue->buildingName,
							'houseName' => $housevalue->houseName,
							'houseNo' => $housevalue->houseNo,
							'address' => $housevalue->address,
							'houseType' => $housevalue->houseType,
							'houseSize' => $housevalue->houseSize,
							'balaconySize' => $housevalue->balaconySize,
							'houseBuildOn' => $housevalue->houseBuildOn,
							'maintFees' => str_replace(",", "", $housevalue->maintFees),
							'tax' => str_replace(",", "", $housevalue->tax),
							'currentValue' => str_replace(",", "", $housevalue->currentValue),
							'createdBy'	=> 	Session::get('FirstName'),
							'updatedBy' => 	Session::get('FirstName')
						]);
		return $sql;
	}
	
	/**  
	*  Get Building Name
	*  @author Madasamy 
	*  @param $orderId
	*  Created At 2020/09/09
	**/
	public static function fnGetBuildingName($orderId) {
		$db = DB::connection('mysql');
		$query = $db->table('hms_master_buildingname')
						->select('orderId','buildingName')
						->where('orderId','=',$orderId)
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
		$query = DB::TABLE('hms_master_houseimg_main')
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
		$result = $db->TABLE('hms_master_houseimg_sub')
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
		$result = $db->TABLE('hms_master_houseimg_main')
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
		$result = $db->TABLE('hms_master_houseimg_sub')
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
					->LEFTJOIN('hms_master_houseimg_main AS mainImg','images.mainCategory','=','mainImg.id')
					->LEFTJOIN('hms_master_houseimg_sub AS subImg','images.subCategory','=','subImg.id')
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
		$update = $db->table('hms_house_details')
					->where('houseId', $request->houseId)
					->update(['memoContent' => $request->memoContent,
								'updatedBy' => Session::get("FirstName"),
								'updatedDateTime' => date('Y-m-d H:i:s')
							]);
		return $update;

	}

}
