<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
use DB;
use Auth;
use Session;
use Config;
class Mail extends Model {	

	/**
	*
	* To view MailStatus index
	* @author Mayandi
	* Created At 26/08/2020
	* 
	* 
	*/
	public static function getMailstatus($request) {
		$sql = DB::TABLE('hms_mailstatus')
						->SELECT('hms_mailstatus.id', 'hms_mailstatus.userId',
								'hms_mailstatus.toMail', 'hms_mailstatus.subject',
								'hms_mailstatus.createdDateTime','hms_users.lastName',
								'hms_mailstatus.createdBy')
						->LEFTJOIN('hms_users','hms_mailstatus.userId','=','hms_users.userId')
						->WHERE('hms_mailstatus.delFlg',0)
						->orderBy('hms_mailstatus.createdDateTime','DESC')
						->paginate($request->plimit);
		return $sql;
	}

	/**
	*
	* To view MailStatus view
	* @author Sastha
	* Created At 26/08/2020
	* 
	*/
	public static function getMailview($request){
		$sql = DB::TABLE('hms_mailstatus AS mailstatus')
						->SELECT('mailstatus.userId','mailstatus.toMail',
								'mailstatus.subject','mailstatus.createdDateTime',
								'mailstatus.content','hms_users.lastName')
						->LEFTJOIN('hms_users','mailstatus.userId','=','hms_users.userId')
						->WHERE('mailstatus.delFlg',0)
						->WHERE('mailstatus.id',$request->mailid)
						->orderBy('mailstatus.createdDateTime','DESC')
						->get();
		return $sql;
	}

	/**
	*
	* To view MailContent index
	* @author Sastha
	* Created At 26/08/2020
	* 
	*/
	public static function getMailcontent($request) {
		$sql = DB::TABLE('hms_mailcontent')
				->SELECT('mailId', 'mailName','subject','delFlg');
				if ($request->filvalhdn == 2) {
						$sql = $sql->where(function($joincont) use ($request) {
									$joincont->where('delflg', '=', '0');
									});
				} else if ($request->filvalhdn == 3) {
						$sql = $sql->where(function($joincont) use ($request) {
									$joincont->where('delflg', '=', '1');
									});
				}
				if($request->searchmethod == 1) {
					// SINGLE SEARCH
					$sql = $sql->where(function($joincont) use ($request) {
						$joincont->where('mailId', 'LIKE', '%'.$request->singlesearch.'%')
								->orWhere('mailName', 'LIKE', '%'.$request->singlesearch.'%')
								->orWhere('subject', 'LIKE', '%'.$request->singlesearch.'%');
					});
				}
				$sql = $sql->orderBy($request->mailcontentsort, $request->sortOrder)
							->paginate($request->plimit);
		return $sql;
	}

	/**
	*
	* To Update delflg in MailContent
	* @author Sastha
	* Created At 26/08/2020
	* 
	*/
	public static function fnupdatedelflg($request) {
		$sql = DB::TABLE('hms_mailcontent')
				->WHERE('hms_mailcontent.mailId', $request->mailid)
				->UPDATE(['hms_mailcontent.delFlg' => $request->delflg]);
		return $sql;
	}

	/**
	*
	* To Get Count of MailId in MailContent
	* @author Sastha
	* Created At 26/03/2020
	* 
	*/
	public static function getcount(){
		   $query = DB::table('hms_mailcontent')
				->select('mailId',DB::RAW("IF(mailId=(SELECT mailId FROM hms_mailcontent
						ORDER BY id DESC LIMIT 1), CONCAT('MAIL', LPAD(SUBSTRING(mailId,5, 8)+1, 4, 0)),mailId) AS newmailId"))
				->orderby('mailId','DESC')
				->limit(1)
				->get();
				// ->toSql();dd($query);
			  return $query;
	}
	
	/**
	*
	* To Insert Mail content
	* @author Sastha
	* Created At 11/12/2020
	* 
	*/
	public static function insMailconData($request,$mailvalue){
		$sql = 	DB::table('hms_mailcontent')
					->updateOrInsert([
							'mailId' => $mailvalue->mailId
						],
						[ 
							'mailId' => $mailvalue->mailId,
							'mailName' => $mailvalue->mailName,
							'mailType' => 	1,		
							'subject' => 	$mailvalue->subject,	
							'header' =>  $mailvalue->header,
							'content' => 	$mailvalue->content,
							'defaultMail' =>  0,
							'createdBy'	=> 	Auth::user()->userName,
							'updatedBy' => 	Auth::user()->userName,
							'delFlg' =>  0
						]);
		return $sql;
	}

	
	/**
	*
	* To Get mailcontent for edit
	* @author Sastha
	* Created At 26/08/2020
	* 
	*/
	public static function getMailcontentindb($request,$mailid) {
		DB::setFetchMode(\PDO::FETCH_ASSOC);
		$mailDetails = DB::TABLE('hms_mailcontent')
						->SELECT('hms_mailcontent.id',
								'hms_mailcontent.mailId As mailId',
								'hms_mailcontent.mailName AS mailname',
								'hms_mailcontent.subject AS mailSubject',
								'hms_mailcontent.header AS mailheader',
								'hms_mailcontent.content AS mailContent')
						->WHERE('hms_mailcontent.mailId',$mailid)
						->WHERE('hms_mailcontent.delFlg',0)
						->GET();
		return $mailDetails[0];
	}

	/**
	*
	* To Update the mailcontent information
	* @author Sastha
	* Created At 25/08/2020
	* 
	*/
	public static function updMailcontent($request,$mailid) {
		$mailupdate = DB::TABLE('hms_mailcontent')
							->WHERE('mailId',$request->mailid)
							->update(['mailName' => $request->mailname,
								'subject' => $request->mailSubject,
								'header' => $request->mailheader,
								'content' => $request->mailContent,
								'updatedDate' => date('Y-m-d H:i:s')]);
						  return $mailupdate;
	}

	/**
	*
	* To view MailContent view
	* @author Sastha
	* Created At 25/08/2020
	* 
	*/
	public static function getMailcontentview($request) {
		$sql = DB::TABLE('hms_mailcontent AS mailcontent')
				->SELECT('mailcontent.mailId', 'mailcontent.mailName',
						'mailcontent.mailType','mailcontent.subject',
						'mailcontent.header','mailcontent.content','mailcontent.delFlg')
				->WHERE('mailcontent.mailId', $request->mailid)
				->GET();
		return $sql;
	}

	
}