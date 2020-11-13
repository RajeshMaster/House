<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
use DB;
use Session;
use Input;
use Auth;
use Carbon\Carbon ;
use Config;

class Loan extends Model {
	/**  
	*  Loan Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/25
	**/
	public static function fnGetLoanDetails($request){

		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_details')
					->select('*')
					->where('userId', '=', $request->userId)
					->where('activeFlg', '=', $request->loanStatus)
					->orderBy('belongsTo');

			if ($request->loanSort == "emiDate") {
				$query = $query ->orderBy(DB::raw("SUBSTRING(emiDate,9,2)"),$request->sortOrder);
			} else {
				$query = $query ->orderBy($request->loanSort, $request->sortOrder);
			}

			$query = $query ->paginate($request->plimit);				
		
		return $query;
	}

	/**  
	*  New Loan Id
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/27
	**/
	public static function getcount() {
		$query = DB::table('ams_loan_details')
				->select('loanId',DB::RAW("IF(loanId=(SELECT loanId FROM ams_loan_details
						ORDER BY id DESC LIMIT 1), CONCAT('LOAN', LPAD(SUBSTRING(loanId, 6)+1, 3, 0)),loanId) AS loanId"))
				->orderby('loanId','DESC')
				->limit(1)
				->get();
		return $query;
	}

	/**  
	*  User Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/25
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
	*  Insert Loan Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/25
	**/
	public static function insertLoanDetails($request,$loanCode){

		$db = DB::connection('mysql');
		$insert = $db->table('ams_loan_details')
					->insert(['userId' => $request->userId,
								'loanId' => $loanCode,
								'loanName' => $request->loanName,
								'houseAddress' => $request->selhouseIds,
								'loanAmount' => str_replace(",", "", $request->loanAmount),
								'interestRate' => $request->interestRate,
								'loanTerm' => $request->loanTerm,
								'paymentCount' => $request->paymentCount,
								'perMonthTotal' => $request->perMonthTotal,
								'perMonthAmount' => str_replace(",", "", $request->perMonthAmount),
								'startDate' => $request->startDate,
								'emiDate' => $request->emiDate,
								'belongsTo' => $request->belongsTo,
								'bank' => $request->bank,
								'createdBy' => Session::get("FirstName"),
								'createdDateTime' => date('Y-m-d H:i:s')
							]);
		return $insert;
	}

	/**  
	*  Update Loan Details
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/25
	**/
	public static function updateLoanDetails($request,$loanCode) {
		$db = DB::connection('mysql');
		$update = $db->table('ams_loan_details')
					->where('loanId', $request->loanId)
					->update(['userId' => $request->userId,
								'loanId' => $loanCode,
								'loanName' => $request->loanName,
								'houseAddress' => $request->newSelhouseIds,
								'loanAmount' => str_replace(",", "", $request->loanAmount),
								'interestRate' => $request->interestRate,
								'loanTerm' => $request->loanTerm,
								'paymentCount' => $request->paymentCount,
								'perMonthTotal' => $request->perMonthTotal,
								'perMonthAmount' => str_replace(",", "", $request->perMonthAmount),
								'startDate' => $request->startDate,
								'emiDate' => $request->emiDate,
								'belongsTo' => $request->belongsTo,
								'bank' => $request->bank,
								'updatedBy' => Session::get("FirstName"),
								'updatedDateTime' => date('Y-m-d H:i:s'),
								'activeFlg' => 0
							]);
		return $update;

	}

	/**  
	*  Address Details
	*  @author Madasamy 
	*  @param $request,$flg,$loanHouseIds = ""
	*  Created At 2020/08/25
	**/
	public static function fnGetAddressDetails($request,$flg,$loanHouseIds = ""){
		$db = DB::connection('mysql');
		$query = $db->table('ams_address')
					->select('*')
					->where('userId', '=', $request->userId);
				if ($flg == 1) {
					$query = $query ->where('houseId', '=', $request->houseId);
				} else if ($flg == 0 && $loanHouseIds != "") {
					$query = $query ->whereIn('houseId', $loanHouseIds);
				}

			$query = $query ->orderBy('houseId')
							->get();
		return $query;
	}

	/**  
	*  Latest Loan Details
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/19
	**/
	public static function getlatestLoanDetails() {
		$db = DB::connection('mysql');
		$latDetails = $db->table('ams_loan_details')->max('id');
		return $latDetails;
	}

	/**  
	*  Single Address Details
	*  @author Madasamy 
	*  @param $address
	*  Created At 2020/08/25
	**/
	public static function fnGetAddress($address){
		$db = DB::connection('mysql');
		$query = $db->table('ams_address')
					->select('buildingName')
					->where('houseId', '=', $address)
					->get();
			if (isset($query[0])) {
				$address = $query[0]->buildingName;
			} else {
				$address = trans('messages.lbl_others');
			}
		return $address;
	}

	/**  
	*  Family Member Details
	*  @author Madasamy 
	*  @param $orderId=""
	*  Created At 2020/08/25
	**/
	public static function fnGetFamilyMaster($id=""){
		$db = DB::connection('mysql');
		$query = $db->table('ams_family_master')
					->select('id','familyName','nickName')
					->where('delFlg', '=', 0);

				if ($id !="") {
					$query = $query ->where('id', '=', $id);
				}
				$query = $query->get();

			$members = array();
			foreach ($query as $key => $value) {
				if ($id !="") {
					return $value->familyName;
				} else {
					$members[$value->id] = $value->familyName;
				}
			}

		return $members;
	}

	/**  
	*  Bank Details
	*  @author Madasamy 
	*  @param 
	*  Created At 2020/08/25
	**/
	public static function fnGetBankMaster($id=""){
		$db = DB::connection('mysql');
		$query = $db->table('ams_bankname_master')
					->select('id','bankName')
					->where('delFlg', '=', 0);

				if ($id !="") {
					$query = $query ->where('id', '=', $id);
				}
				$query = $query->get();
			$bank = array();
			foreach ($query as $key => $value) {
				if ($id !="") {
					return $value->bankName;
				} else {
					$bank[$value->id] = $value->bankName;
				}
			}

		return $bank;
	}

	/**  
	*  Bank Details
	*  @author Madasamy 
	*  @param $loanId,$date="",$type="",$yrMnth=""
	*  Created At 2020/08/25
	**/
	public static function fnGetEMIData($loanId,$date="",$type="",$yrMnth=""){
		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_emidetails')
					->select("*")
					->where('loanId', '=', $loanId);

			if ($date != "" && $type != "") {
				if ($type == "next") {
					$query = $query ->where('emiDate', '>=', $date);
				} else if ($type == "prev") {
					$query = $query ->where('emiDate', '<=', $date);
				}
			} elseif ($yrMnth != "") {
				$query = $query ->where('emiDate', 'LIKE', $yrMnth."%");
			}

			$query = $query->get();
		return $query;
	}

	/**  
	*  Insert EMI Details
	*  @author Madasamy 
	*  @param $loanEMIArr
	*  Created At 2020/08/27
	**/
	public static function insertEMIDetails($loanEMIArr){
		
		$db = DB::connection('mysql');
		foreach ($loanEMIArr as $key => $value) {
			if (is_numeric($key)) {
				$insert = $db->table('ams_loan_emidetails')
							->insert(['userId' => $value['userId'],
									'loanId' => $value['loanId'],
									'belongsTo' => $value['belongsTo'],
									'bank' => $value['bank'],
									'emiDate' => $value['emiDate'],
									'year' => date("Y", strtotime($value['emiDate'])),
									'month' => date("m", strtotime($value['emiDate'])),
									'monthPrinciple' => str_replace(",", "", $value['monthPrinciple']),
									'monthInterest' => str_replace(",", "", $value['monthInterest']),
									'monthPayment' => str_replace(",", "", $value['monthPayment']),
									'monthAmount' => str_replace(",", "", $value['monthAmount']),
									'loanBalance' => str_replace(",", "", $value['loanBalance']),
									'createdBy' => Session::get("FirstName"),
									'editFlg' => $value['editFlg']
								]);
			}
		}

		return $insert;
	}

	/**  
	*  Delete EMI Details
	*  @author Madasamy 
	*  @param $loanId
	*  Created At 2020/08/27
	**/
	public static function deleteEMIDetails($loanId){
		$db = DB::connection('mysql');

		$delete = $db->TABLE('ams_loan_emidetails')
						->WHERE('loanId', '=', $loanId)
						->DELETE();
		
		return $delete;
	}

	/**  
	*  House Id's of user
	*  @author Madasamy 
	*  @param $request
	*  Created At 2020/08/28
	**/
	public static function fnGetLoanHouseId($request){
		$db = DB::connection('mysql');
		$query = $db->table('ams_house_details')
					->select("houseId")
					->where('userId', '=', $request->userId)
					->where('loanFlg','=',0)
					->where('soldFlg','=',0)
					->get();

			$loanArr = array();
			foreach ($query as $key => $value) {
				$loanArr[$key] = $value->houseId;
			}
		return $loanArr;
	}

	/**  
	*  Loan Details
	*  @author Madasamy 
	*  @param $loanId
	*  Created At 2020/09/02
	**/
	public static function fnGetLoan($loanId){
		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_details')
					->select("*")
					->where('loanId', '=', $loanId)
					->get();
		return $query;
	}

	/**  
	*  EMI Details
	*  @author Madasamy 
	*  @param $loanId,$emiDate
	*  Created At 2020/09/02
	**/
	public static function getEMI($loanId,$emiDate){
		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_emidetails')
					->select("*")
					->where('loanId', '=', $loanId)
					->where('emiDate', '=', $emiDate)
					->get();
		return $query;
	}

	/**  
	*  EMI Details
	*  @author Madasamy 
	*  @param $loanId,$date
	*  Created At 2020/09/02
	**/
	public static function fnGetExpiredEMI($loanId,$date){
		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_emidetails')
					->select("*")
					->where('loanId', '=', $loanId)
					->where('emiDate', '>', $date)
					->get();
		return $query;
	}

	/**  
	*  End Loan with Active Flg
	*  @author Madasamy 
	*  @param $loanId,$date
	*  Created At 2020/09/02
	**/
	public static function fnUpdateActiveFlg($loanId,$date){
		$db = DB::connection('mysql');
		$update = $db->table('ams_loan_details')
					->where('loanId', $loanId)
					->update(['endDate' => $date,
								'activeFlg' => 1 ]);
		return $update;
	}

	/**  
	*  Paid Interest of expired Loan
	*  @author Madasamy 
	*  @param $loanId
	*  Created At 2020/09/08
	**/
	public static function fnGetPaidInterest($loanId){
		$db = DB::connection('mysql');
		$query = $db->table('ams_loan_emidetails')
					->select(DB::raw('SUM(monthInterest) AS monthInterest'))
					->where('loanId', $loanId)
					->get();

		if (isset($query[0])) {
			return $query[0]->monthInterest/10000; // 円 to 万
		} else {
			return 0;
		}
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
	*  Update House loanFlg
	*  @author Madasamy 
	*  @param $idArr,$bank,$userId,$flg
	*  Created At 2020/09/09
	**/
	public static function fnUpdateLoanFlg($idArr,$bank,$userId,$flg) {

		$db = DB::connection('mysql');
		foreach ($idArr as $key => $value) {
			$update = $db->table('ams_house_details')
						 ->where('houseId', $value)
						 ->where('userId', $userId)
						 ->update(['bankId' => $bank,
									'loanFlg' => $flg ]);
		}

	}

	/**  
	*  House Details
	*  @author Sastha 
	*  @param $request
	*  Created At 25/09/2020
	**/
	public static function gethouseDtls($request){
		$db = DB::connection('mysql');
		$query = $db->table('ams_house_details as house')
					->select('loan.belongsTo',
								'loan.loanId',
								'loan.activeFlg',
								'house.belongsTo as Family',
								'house.houseId',
								'house.loanFlg',
								'house.address',
								'house.houseNo',
								'house.houseSize',
								'house.maintFees',
								'house.tax',
								'familyMst.id as familyId',
								'familyMst.familyName',
								'familyMst.nickName as familyNick',
								'bankMst.nickName')
					->LEFTJOIN('ams_loan_details AS loan','loan.houseAddress', 'LIKE', DB::raw("CONCAT('%', house.houseId, '%')"))
					->LEFTJOIN('ams_family_master AS familyMst','house.belongsTo','=','familyMst.id')
					->LEFTJOIN('ams_bankname_master AS bankMst','house.bankId','=','bankMst.id')
					->where('house.userId', '=', $request->userId)
					->where('house.soldFlg', '=', 0)
					->orderBy('house.loanFlg','DESC')
					->orderBy('loan.belongsTo')
					->orderBy('loan.loanId')
					->orderBy('house.belongsTo')
					->orderBy('house.houseId')
					->get();
		return $query;
	}

	/**  
	* To Get Family Count
	*  @author Sastha 
	*  @param $request,$belongsTo
	*  Created At 25/09/2020
	**/
	public static function countBelongsTo($request,$belongsTo) {
		$others = "Others";
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_loan_details')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('belongsTo', '=' , $belongsTo)
					->where('houseAddress', '!=', $others)
					->where('activeFlg', '=', 0)
					->ORDERBY('loanId')
					->get();
		return $result;
	}

	/**  
	* To Get Family Count
	*  @author Sastha 
	*  @param $request,$belongsTo
	*  Created At 25/09/2020
	**/
	public static function loanOthDtls($request,$belongsTo) {
		$others = "Others";
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_loan_details as loan')
					->select('loan.*','bankMst.nickName','familyMst.familyName','familyMst.nickName as familyNick')
					->LEFTJOIN('ams_bankname_master AS bankMst','loan.bank','=','bankMst.id')
					->LEFTJOIN('ams_family_master AS familyMst','loan.belongsTo','=','familyMst.id')
					->WHERE('loan.userId', '=' , $request->userId)
					->WHERE('loan.houseAddress', '=' , $others)
					->WHERE('loan.belongsTo', '=' , $belongsTo)
					->where('activeFlg', '=', 0)
					->ORDERBY('loan.loanId')
					->get();
		return $result;
	}

	/**  
	* To Get Income Data
	*  @author Sastha 
	*  @param $request,$houseId
	*  Created At 25/09/2020
	**/
	public static function fnGetIncomeData($request,$houseId) {
		$db = DB::connection('mysql');
		$result = $db->TABLE('ams_income_details')
					->select('*')
					->WHERE('userId', '=' , $request->userId)
					->WHERE('houseId', '=', $houseId)
					->WHERE('Year', '=' , date('Y'))
					->WHERE('Month', '=' , round(date('m')))
					->get();
		return $result;
	}

	/**  
	* To Get House Loan details
	*  @author Sastha 
	*  @param $houseId
	*  Created At 2020/09/30
	**/
	public static function fnGetHouLoanDetails($houseId) {
		$db = DB::connection('mysql');
		$result = $db->table('ams_loan_details')
					->select('*','familyMst.familyName','familyMst.nickName as familyNick')
					->LEFTJOIN('ams_family_master AS familyMst','belongsTo','=','familyMst.id')
					->where('houseAddress', 'LIKE' , '%'.$houseId.'%')
					->where('activeFlg','=',0)
					->ORDERBY('loanId', 'ASC')
					->get();
		return $result;
	}

}
