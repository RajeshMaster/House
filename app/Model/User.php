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
		$result = DB::table('ams_users As users')
					->SELECT('users.userId','users.firstName','users.lastName','users.dob','users.mobileNo','users.email','users.gender')
					->LEFTJOIN('ams_login AS login','login.userId','=','users.userId')
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

	/** Userid count get process
	*  @author sarath 
	*  Created At 2020/08/20
	*/
	public static function getcount() {
		$query = DB::table('ams_users')
				->select('userId',DB::RAW("IF(userId=(SELECT userId FROM ams_users
						ORDER BY id DESC LIMIT 1), CONCAT('AMS', LPAD(SUBSTRING(userId, 4)+1, 4, 0)),userId) AS Usercode"))
				->orderby('userId','DESC')
				->limit(1)
				->get();
		return $query;
	}

	/** User details Register process
	*  @author sarath 
	*  @param $request,$Usercode,$mailcontent,$contentsCandidate
	*  Created At 2020/08/20
	*/
	public static function insertRec($request,$Usercode,$mailcontent,$contentsCandidate) {
		$insert=DB::table('ams_users')->insert(
			[
				'userId' => $Usercode,
				'firstName' => $request->firstname,
				'lastName' => $request->lastname,
				'dob' => $request->dob,
				'gender' => $request->gender,
				'mobileNo' => $request->mobileno,
				'email' => $request->emailid,
				'userType' => 2,
				'createdBy' => $request->lastname,
				'updatedBy' => $request->lastname
			]
		);
		$insert=DB::table('ams_login')->insert(
			[
				'userId' => $Usercode,
				'email' => $request->emailid,
				'password' => md5($request->password),
				'userType' => 2,
				'createdBy' => $request->lastname,
				'updatedBy' => $request->lastname
			]
		);
		$insert = DB::table('ams_mailstatus')->insert(
			[
				'userId' =>$Usercode,
				'toMail' =>$request->emailid,
				'subject' => $mailcontent['subject'],
				'content' => $contentsCandidate,
				'sendFlg' => 0,
				'createdBy' => $request->lastname,
				'updatedBy' => $request->lastname,
			]);
		return $insert;
	}

	/** Exists mail check process register page
	*  @author sarath 
	*  @param $request
	*  Created At 2020/08/20
	*/
	public static function fnGetEmailExistsCheck($request){
		$result = DB::table('ams_users')
					->select('id')
					->WHERE('email', $request->mailId);
					if($request->editId != ""){
						$result	= $result->WHERE('id','!=', $request->editId)->get();
					} else {
						$result = $result->get();
					}
		return $result;
	}

	/** User profile view process
	*  @author sarath 
	*  @param $userId
	*  Created At 2020/08/21
	*/
	public static function viewprofiledetails($userId) {
		$result= DB::table('ams_users')
						->SELECT('*')
						->WHERE('userId', '=', $userId)
						->get();
		return $result;
	}

	/** User details view process in Edit page  
	*  @author sarath 
	*  @param $id
	*  Created At 2020/08/21
	*/
	public static function editview($id) {
		$result= DB::table('ams_users')
						->SELECT('*')
						->WHERE('id', '=', $id)
						->where('userId', Auth::user()->userId)
						->get();
		return $result;
	}

	/** Update User details process
	*  @author sarath 
	*  @param $request
	*  Created At 2020/08/21
	*/
	public static function Updateuserdetails($request) {
		$update = DB::table('ams_login')
				->where('userId', Auth::user()->userId)
				->update(
			[
				'email' =>$request->emailid,
				'updatedBy' => $request->lastname,
			]);
		$update = DB::table('ams_users')
				->where('id', $request->editid)
				->where('userId', Auth::user()->userId)
				->update(
				[
				'firstName' => $request->firstname,
				'lastName' => $request->lastname,
				'dob' => $request->dob,
				'gender' => $request->gender,
				'mobileNo' => $request->mobileno,
				'email' => $request->emailid,
				'updatedBy' => $request->lastname
				]);
	return $update;
	}

	/** Verify login check process
	*  @author sastha 
	*  @param $request
	*  Created At 2020/08/24
	*/
	public static function updVerifyFlg($request) {
		$update = DB::table('ams_login')
					->where('userId', $request->userId)
					->update([
					'verifyFlg' => 1,
					'updatedBy' => $request->name,
					]);
		return $update;
	}

}
?>