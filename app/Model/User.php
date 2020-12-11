<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
use DB;
use Session;
use Input;
use Auth;
class User extends Model {

	/** Userdetails view,Search,Filter,Sorting process in userindex page
	*  @author sarath 
	*  @param $request
	*  Created At 2020/08/20
	*/
	public static function fnGetUserDetails($request) {
		$result = DB::table('hms_users As users')
					->SELECT('users.userId','users.firstName','users.lastName','users.dob','users.mobileNo','users.email','users.gender')
					->LEFTJOIN('hms_login AS login','login.userId','=','users.userId')
					->where('users.userType', '=', 2);
					if($request->filterval == 1){
						$result = $result->where(function($joincont) use ($request) {
										$joincont->where('login.verifyFlg', '=', 1)
												->orwhere('login.verifyFlg', '=', 0);
										});
					} else if($request->filterval == 2){
						$result = $result->where(function($joincont) use ($request) {
										$joincont->where('login.verifyFlg', '=', 1);
												
										});
					} else if($request->filterval == 3){
						$result = $result->where(function($joincont) use ($request) {
										$joincont->where('login.verifyFlg', '=', 0);
												
										});
					}
					$result = $result->where(function($joincont) use ($request) {
									$joincont->where('users.userId', 'LIKE', '%' . $request->singlesearch . '%')
												->orwhere('users.firstName', 'LIKE', '%' . $request->singlesearch . '%')
												->orwhere('users.lastName', 'LIKE', '%' . $request->singlesearch . '%');
												
									});
		$result= $result->orderBy($request->usersort, $request->sortOrder)
						->paginate($request->plimit);
					  	
		return $result;
	}


	/** User profile view process
	*  @author sarath 
	*  @param $userId
	*  Created At 2020/08/21
	sastha
	*/
	public static function viewprofiledetails($userId) {
		$result= DB::table('hms_users')
						->SELECT('*')
						->WHERE('userId', '=', $userId)
						->get();
		return $result;
	}


	/** Verify login check process
	*  @author sastha 
	*  @param $request
	*  Created At 2020/08/24
	sastha
	*/
	public static function updVerifyFlg($request) {
		$update = DB::table('hms_login')
					->where('userId', $request->userId)
					->update([
					'verifyFlg' => 1,
					'updatedBy' => $request->name,
					]);
		return $update;
	}

	// sastha
	public static function insUserData($request,$jsonvalue,$mailcontent,$contentsCandidate) {
		
		$db = DB::connection('mysql');
		$insert = $db->table('hms_users')
					->updateOrInsert([
							'userId' => $jsonvalue->userId
						],
						[
							'userId' => $jsonvalue->userId,
							'firstName' => $jsonvalue->firstName,
							'lastName' => $jsonvalue->lastName,
							'dob' => $jsonvalue->dob,
							'gender' => $jsonvalue->gender,
							'mobileNo' => $jsonvalue->mobileNo,
							'email' => $jsonvalue->email,
							'userType' => 2,
							'createdBy' => $jsonvalue->lastName,
							'updatedBy' => $jsonvalue->lastName
						]);	
		$insert = $db->table('hms_login')
					->updateOrInsert([
							'userId' => $jsonvalue->userId
						],
						[
							'userId' => $jsonvalue->userId,
							'email' => $jsonvalue->email,
							'password' => md5($jsonvalue->password),
							'userType' => 2,
							'createdBy' => $jsonvalue->lastName,
							'updatedBy' => $jsonvalue->lastName
						]);
		$insert = DB::table('hms_mailstatus')
					->insert([
							'userId' => $jsonvalue->userId,
							'toMail' => $jsonvalue->email,
							'subject' => $mailcontent['subject'],
							'content' => $contentsCandidate,
							'sendFlg' => 0,
							'createdBy' => $jsonvalue->lastName,
							'updatedBy' => $jsonvalue->lastName
						]);
		return $insert;
	}


}
?>