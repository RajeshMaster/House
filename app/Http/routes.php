<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
Route::group(['prefix'=>'/'], function() {
	Route::get('/', 'LoginController@index');
});

// LOGIN PAGE
Route::get('login', 'LoginController@index');


// LOGIN PROCESS
Route::post('login', 'LoginController@authenticate');
Route::get('Login/forgetpassword', 'Auth\PasswordController@showLinkRequestForm');
Route::post('Login/forgetprocess', 'Auth\PasswordController@sendResetLinkEmail');

Route::get('User/changelanguage','AjaxController@index');

// Login Verify
Route::any('User/verifyLogin', 'UserController@verifyLoginCheck');

//User Index
Route::any('User/index', 'UserController@userindex');

// User Register
Route::get('User/register', 'UserController@register');
Route::any('User/addeditprocess', 'UserController@addeditprocess');
Route::any('User/getEmailExists', 'UserController@mailexistcheck');

// Forgot Password
Route::get('password/reset/{token?}', 'Auth\PasswordController@showResetForm');
Route::post('password/reset', 'Auth\PasswordController@reset');

//User Profile
Route::any('User/profile', 'UserController@userprofile');
Route::any('User/edit', 'UserController@useredit');

// Password Change 
Route::group(['prefix'=>'Auth', 'middleware' => 'auth'], function() {
	Route::get('changelanguage', 'AjaxController@index');
	Route::any('changepassword', 'LoginController@showChangePasswordForm');
	Route::any('changePasswordprocess','LoginController@changePassword');
});

// House - ADDED By Sastha --2020/08/20
Route::group(['prefix'=>'House', 'middleware' => 'auth'], function() {
	Route::get('changelanguage','AjaxController@index');
	Route::any('index', 'HouseController@index');
	Route::any('view', 'HouseController@view');
	Route::any('addEdit', 'HouseController@addEdit');
	Route::any('addeditprocess', 'HouseController@addeditprocess');
	Route::any('getBuildingName', 'HouseController@getBuildingName');
	Route::any('uploadImgPopup', 'HouseController@uploadImgPopup');
	Route::any('subImageId_ajax', 'HouseController@subImageId_ajax');
	Route::any('subMainImageName_ajax', 'HouseController@subMainImageName_ajax');
	Route::any('AllImageName_ajax', 'HouseController@AllImageName_ajax');
	Route::any('uploadImgProcess', 'HouseController@uploadImgProcess');
	Route::any('prevNxtImg_ajax', 'HouseController@prevNxtImg_ajax');
	Route::any('imgViewPopup', 'HouseController@imgViewPopup');
	Route::any('buildingId_ajax', 'HouseController@buildingId_ajax');
	Route::any('memoReg', 'HouseController@memoReg');
	// Route::any('memoRegValidation', 'HouseController@memoRegValidation');
	Route::any('memoRegprocess', 'HouseController@memoRegprocess');
	// For Settings Belongs To
	Route::get('twotextpopup', 'SettingController@twotextpopup');
	Route::get('twoFieldaddedit', 'SettingController@twoFieldaddedit');
	Route::get('getdataexisttwotextpopup', 'SettingController@getdataexisttwotextpopup');
	// For Settings Buliding Name
	Route::get('threetextpopup', 'SettingController@threetextpopup');
	Route::get('ThreeFieldaddedit', 'SettingController@ThreeFieldaddedit');
	Route::get('getdataexistthreetextpopup', 'SettingController@getdataexistthreetextpopup');
	// Common Process
	Route::any('useNotuse', 'SettingController@useNotuse');
	Route::any('commitProcess', 'SettingController@commitProcess');
});

//Mail Process -- ADDED By Sastha --2020/08/25
Route::group(['prefix'=>'Mail', 'middleware' => 'auth'], function() {
	Route::get('changelanguage','AjaxController@index');
	Route::any('index', 'MailController@index');
	Route::any('mailview', 'MailController@mailview');
	Route::any('mailcontent', 'MailController@mailcontent');
	Route::any('mailcontentflg', 'MailController@mailcontentflg');
	Route::get('mailregister', 'MailController@mailregister');
	Route::any('mailcontentview', 'MailController@mailcontentview');
});

// Settings - ADDED By Sarath --2020/08/25
Route::group(['prefix'=>'Setting', 'middleware' => 'auth'], function() {
	Route::any('index', 'SettingController@index');
	Route::get('changelanguage','AjaxController@index');
	// Single Text Popup
	Route::any('singletextpopup', 'SettingController@singletextpopup');
	Route::any('SingleFieldaddedit', 'SettingController@SingleFieldaddedit');
	Route::any('Already_Exists', 'SettingController@Already_Exists');
	// Two Text Popup
	Route::get('twotextpopup', 'SettingController@twotextpopup');
	Route::get('twoFieldaddedit', 'SettingController@twoFieldaddedit');
	Route::get('getdataexisttwotextpopup', 'SettingController@getdataexisttwotextpopup');
	// Select Text Popup
	Route::get('selecttextpopup', 'SettingController@selecttextpopup');
	Route::any('existforselecttext', 'SettingController@existforselecttext');
	Route::get('SelecttextFieldaddedit', 'SettingController@SelecttextFieldaddedit');
	Route::get('formValidationforsingletext', 'SettingController@formValidationforsingletext');
	// Three Text Popup
	Route::get('threetextpopup', 'SettingController@threetextpopup');
	Route::get('ThreeFieldaddedit', 'SettingController@ThreeFieldaddedit');
	Route::get('getdataexistthreetextpopup', 'SettingController@getdataexistthreetextpopup');
	// Select Text Popup
	Route::any('useNotuse', 'SettingController@useNotuse');
	Route::any('commitProcess', 'SettingController@commitProcess');
	// Added by Madasamy - 2020/10/02
	Route::any('soldHousePopup', 'SettingController@soldHousePopup');
	Route::any('soldHouseProcess', 'SettingController@soldHouseProcess');
});

// LOGOUT PROCESS
Route::get('logout', 'Auth\AuthController@logout');

?>