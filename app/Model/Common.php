<?php
namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;
use Session;
use Input;
use Auth;
use Cookie;
use Carbon\Carbon ;
use File;
class Common extends Model {

	/**
	*
	* Get Details for employee count
	* @author Sastha
	* @return Object to particular selected value
	* Created At 2020/08/19
	*
	*/
	public static function fnGetDataFromOtherTable($userId,$userType) {
			$userName = DB::TABLE('ams_users')
						->SELECT('lastName AS userName')
						->WHERE('userId',$userId)
						->WHERE('userType',$userType)
						->GET();
			return $userName;
	}

	/**  
	 *  To Employer Register
	 *  @author Sastha 
	 *  @param $request
	 *  Created At 2020/08/19
	 **/
	public static function get_mail_content($mailId) {
		$get_query = DB::TABLE('ams_mailcontent')
					->SELECT('subject',
							 'header',
							 'content')
					->WHERE('mailId',$mailId)
					->get();
		return $get_query;
	}

	/**  
	 *  For Check current and auth password check
	 *  @author Sastha
	 *  @param $request
	 *  Created At 2020/08/19
	 **/
	public static function checkpassword($password,$authpassword) {
		$password = md5($password);
		if ($password == $authpassword) {
			return true;
		} else {
			return false;
		}
	}

	/**
	*
	* Get details from Cookies
	* @author Sastha
	* @return Object to particular selected value
	* Created At 2020/08/19
	*
	*/
	public static function setCookieValue() {
		if(Session::get('userId') == "") {
			// cookie array to foreach & set into the session. modified by sabari
			$cookieArrayList = Cookie::get('cookieArrayList');
			if (is_array($cookieArrayList)) {
				foreach ($cookieArrayList as $key => $value) {
		  			//set cookie key and value here 
					Session::put($key,$value);
				}
			}
		}
	}

	/**  
	*  Update User  Log
	*  @author Sastha.
	*  Created At 2020/08/24
	**/
	public static function fnUpdateLoginLog($request) {
		DB::beginTransaction();
		try {
			$updUserlog = DB::TABLE('ams_login')
					->WHERE('userId', '=', Auth::user()->userId)
					->update(['loginStatus' => 1]);
			DB::commit();       
			return $updUserlog;
		} catch (\Exception $e) {
			DB::rollback();
		} 
	}

	/**  
	*  Change User Log Status Updated by Sastha.
	*  @author Sastha  
	*  Created At 2020/08/24
	**/
	public static function fnUpdateLogoutLog() {
		 // dd(Session::all());
		DB::beginTransaction();
		try {
			$updUserlog = DB::TABLE('ams_login')
					->WHERE('userId', '=', Auth::user()->userId)
					->update(['loginStatus' => 0 ]);
			DB::commit();       
			return $updUserlog;
		} catch (\Exception $e) {
			DB::rollback();
		} 
	}

	/**
	* To Login Details
	* @author Sastha
	* @param $userData
	* Created At 2020/08/24
	**/
	public static function fnGetLogin($userData){
		if (isset($userData['userId'])) {
			$userId = $userData['userId'];
		} else if (isset($userData['email'])) {
			$userId = $userData['email'];
		} else {
			$userId = "";
		}
		
		$get_query = DB::TABLE('ams_login')
					->SELECT('verifyFlg','email','userType')
					->WHERE('userId',$userId)
					->ORWHERE('email',$userId)
					->get();
		return $get_query;
	}

	/**
	* To Get Bank Name
	* @author Sastha
	* Created At 2020/08/27
	**/
	public static function fnGetBankName(){
		$query = DB::TABLE('ams_bankname_master')
					->SELECT('*')
					->WHERE('delFlg',0)
					->get();
		return $query;
	}

	/**  
	* To Get Bank Nick Name
	*  @author Sastha 
	*  @param $bankId
	*  Created At 2020/08/27
	**/
	public static function fnGetBankNickName($bankId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_bankname_master')
					->select('*')
					->WHERE('id', '=', $bankId)
					->get();
		return $result;
	}

	/**
	* To Get Family Member Name
	* @author Sastha
	* Created At 2020/08/27
	**/
	public static function fnGetFamilyMembers(){
		$query = DB::TABLE('ams_family_master')
					->SELECT('*')
					->WHERE('delFlg',0)
					->get();
		return $query;
	}

	/**
	* To Get House Address
	* @author Sastha
	* Created At 2020/08/27
	**/
	public static function fnGetBuildingName(){
		$query = DB::TABLE('ams_master_buildingname')
					->SELECT('*')
					->WHERE('delFlg',0)
					->get();
		return $query;
	}

	/**
	* To Get Assets Types
	* @author Sastha
	* Created At 2020/09/15
	**/
	public static function fnGetAssetsTypes(){
		$query = DB::TABLE('ams_master_assetstypes')
					->SELECT('*')
					->WHERE('delFlg',0)
					->get();
		return $query;
	}

	/**
	* To Get House Address
	* @author Sastha
	* Created At 2020/08/27
	**/
	public static function fnGetBuildingAdd($buildingId){
		$query = DB::TABLE('ams_master_buildingname')
					->SELECT('*')
					->WHERE('id', '=', $buildingId)
					->WHERE('delFlg',0)
					->get();
		return $query;
	}

}
