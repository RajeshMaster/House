<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use App\Model\Common;
use App\Model\SendingMail;
use Auth;
use Redirect;
use Session;
use Config;
use Cookie;
class LoginController extends Controller
{
	public function index(Request $request) {
		if (!empty(Auth::user())) {
			Session::put('userId',Auth::user()->userId);
			Session::put('langFlg',Auth::user()->langFlg);
			$userName = Common::fnGetDataFromOtherTable(Auth::user()->userId,Auth::user()->userType);
			if (isset($userName[0])) {
				Session::put('FirstName',$userName[0]->userName);
			}
			if (\Auth::user()->userType == 1) {
				return Redirect::to('BalSheet/index?mainmenu=menu_balsheet&time='.date('Ymdhis'));
			} else {
				return Redirect::to('BalSheet/index?mainmenu=menu_balsheet&time='.date('Ymdhis'));
			}
		}
		return view('login.login',compact('request'));
	}
	/**
	 * Handle an authentication attempt.
	 *
	 * @return Response
	 */
	public function authenticate(Request $request)
	{
		$username = Input::get('userId');
		if (!filter_var($username, FILTER_VALIDATE_EMAIL)) {
			$rules = array(
				'userId' => 'required',
				'password' => 'required',
			 );
			$userdata = array(
				'userId' => Input::get('userId'),
				'password' => Input::get('password'),
				'delFlg' => 0,
			);
		} else {
			$rules = array(
				'userId' => 'required',
				'password' => 'required',
			 );
			$userdata = array(
				'email' => Input::get('userId'),
				'password' => Input::get('password'),
				'delFlg' => 0,
			);
		}
		$customizedNames = array(
			'userId' =>"Login ID",
			'password' => "Password"
		);
		$remember_me = $request->has('remember') ? true : false; 
		$validator = Validator::make($request->all(), $rules);
		$validator->setAttributeNames($customizedNames);
		if ($validator->fails()){
		  // If validation fails redirect back to login.
		  return Redirect::to('/')->withInput(Input::except('password'))->withErrors($validator);
		} else {
			if (Auth::validate($userdata)) {
				$logindtls = Common::fnGetLogin($userdata);
				if ($logindtls[0]->verifyFlg == 1 || $logindtls[0]->userType == 1) {
					if (Auth::attempt($userdata,$remember_me)) {
						Session::put('userId',Auth::user()->userId);
						Session::put('langFlg',Auth::user()->langFlg);
						$userName = Common::fnGetDataFromOtherTable(Auth::user()->userId,Auth::user()->userType);
						// $checkUserLog = Common::fnCheckUserLog();
						$updateLoginLog = Common::fnUpdateLoginLog($request);
						// FOR SESSION VALUES
						if(Session::get('langFlg') == 0){
							Session::put('languages','jp');
							Session::put('languageval', 'jp');
							Session::put('setlanguageval', 'en');
						} else {
							Session::put('languages','en');
							Session::put('languageval', 'en');
							Session::put('setlanguageval', 'jp');
						}
						if (isset($userName[0])) {
							Session::put('FirstName',$userName[0]->userName);
						}
						if (\Auth::user()->userType == 1) {
							return Redirect::to('BalSheet/index?mainmenu=menu_balsheet&time='.date('Ymdhis'));
						} else {
							return Redirect::to('BalSheet/index?mainmenu=menu_balsheet&time='.date('Ymdhis'));
						}
					}
				} else {
					// if any error send back with message.
					Session::flash('error', 'Please Verify Email'); 
					return Redirect::to('/');
				}
			} else {
				// if any error send back with message.
				Session::flash('error', 'This Credential Does Not Match'); 
				return Redirect::to('/');
			}
		}
	}
	// For Logout Process
	public static function logout(Request $request) {
		Auth::logout();
		Session::flush();
		Cookie::queue(Cookie::forget('cookieArrayList'));
		return Redirect::to('/');
	}
	/**  
	 *  Redirect to Password Change
	 *  @author Sastha.C
	 *  @param $request
	 *  Created At 2020/08/19
	 **/
	public function showChangePasswordForm(Request $request){
		return view('auth.changepassword',compact('request'));
	}
	/**  
	 *  Password Change process
	 *  @author Sastha.C
	 *  @param $request
	 *  Created At 2020/08/19
	 **/
	public function changePassword(Request $request){
		if (!(Common::checkpassword($request->get('current-password'), Auth::user()->password))) {
			// The passwords matches
			return redirect()->back()->with("error","Your current password does not matches with the password you provided. Please try again.");
		}
		if(strcmp($request->get('current-password'), $request->get('new-password')) == 0){
			//Current password and new password are same
			return redirect()->back()->with("error","New Password cannot be same as your current password. Please choose a different password.");
		}
		$rulesforpassword = array(
			'current-password' => 'required',
			'new-password' => 'required|string|min:6|confirmed',
		);
		$validator = Validator::make($request->all(), $rulesforpassword);
		if ($validator->fails()) {
			return Redirect::to('Auth/changepassword?menuid=menu_user&time='.date("YmdHis"))->withErrors($validator);
		}
		//Change Password
		$user = Auth::user();
		$user->password = md5($request->get('new-password'));
		$user->save();
		Auth::logout();
		Session::flush();
		Session::flash('message', 'Password Changed Sucessfully!'); 
		Session::flash('type', 'alert-success'); 
		return Redirect::to('/');
	}
}