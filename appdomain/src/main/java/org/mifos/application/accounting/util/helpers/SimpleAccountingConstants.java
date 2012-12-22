/*
 * Copyright (c) 2005-2011 Grameen Foundation USA
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 * explanation of the license and how it is applied.
 */

package org.mifos.application.accounting.util.helpers;

public interface SimpleAccountingConstants {

	String LOADOFFICES = "loadOffices";
	String LOADMAINACCOUNTS = "loadMainAccounts";
	String LOADACCOUNTHEADS = "loadAccountHeads";
	String SUBMIT = "submit";
	String PREVIEW = "preview";
	String PROCESS = "process";
	String INACTIVE ="I";
	String ACTIVE ="A";
	String UPLOADXLSDATA="uploadXLSData";

	// FIXME: add underbars for readability
	String LOADSUCCESS = "load_success";
	String SUBMITSUCCESS = "submit_success";
	String SUBMIT_FAILURE = "submit_failure";

	String METHOD = "method";
	String LOADMETHOD = "load";
	String CANCELMETHOD = "cancel";
	String SUBMITMETHOD = "submit";
	String VALIDATEMETHOD = "validate";

	String INVALID_TRXN_DATE = "errors.invaliddate";
	String MANDATORYFIELDS = "errors.mandatoryselect";
	String MANDATORYENTER = "errors.mandatoryenter";
	String ENTER_GRETERTHAN="errors.greterthan";
	String INVALIDDATE = "errors.invaliddate";
	String INVALID_FUTURE = "errors.invaliddatefuture";
	String INVALID_PAST = "errors.invaliddatepast";

	String TRXNDATE = "simpleAccounting.trxnDate";
	String TO_TRXNDATE = "simpleAccounting.toTrxnDate";
	String FROM_TRXNDATE = "simpleAccounting.fromTrxnDate";
	String VOUCHERDATE = "simpleAccounting.voucherDate";
	String LASTPROCESSDATE = "simpleAccounting.lastProcessDate";
	String PROCESSTILLDATE = "simpleAccounting.processTillDate";
	String GROUPBY = "simpleAccounting.groupBy";
	String FINANCIALYEAR = "simpleAccounting.financialYear";
	String COANAME = "simpleAccounting.coaName";
	String OPENBALANCE = "simpleAccounting.openBalance";
	String TRXNTYPE = "simpleAccounting.trxnType";
	String CASHDATE = "simpleAccounting.chequeDate";
	String OFFICE_HIERARCHY = "simpleAccounting.officeHeirarchy";
	String OFFICE = "simpleAccounting.office";
	String MAIN_ACCOUNT = "simpleAccounting.mainAccount";
	String DEBIT_ACCOUNT = "simpleAccounting.debitAccount";
	String ACCOUNT_HEAD = "simpleAccounting.accountHead";
	String CREDIT_ACCOUNT = "simpleAccounting.creditAccount";

	String AMOUNT = "simpleAccounting.amount";
	String CHEQUE_NO = "simpleAccounting.chequeNo";
	String CHEQUE_DATE = "simpleAccounting.chequeDate";
	String BANK_NAME = "simpleAccounting.bankName";
	String BANK_BRANCH = "simpleAccounting.bankBranch";
	String TRXN_NOTES = "simpleAccounting.trxnNotes";
	String VOUCHER_NOTES = "simpleAccounting.voucherNotes";
	String ERRORS_MUST_BE_GREATER_THAN_ZERO = "errors.mustBeGreaterThanZero";
	String TRANSACTION_DATE_CELL="errors.celltransactiondate";
	String TRANSACTION_TYPE_CELL="errors.cellTransactionType";
	String OFFICE_LEVEL_CELL="errors.cellofficeLevel";
	String OFFICE_NAME_CELL="errors.cellofficeName";
	String MAIN_ACCOUNT_CELL="errors.cellmainAccount";
	String ACCOUNT_HEAD_CELL="errors.cellccountHead";
	String NARRATION_CELL="errors.cellnarration";
	String CHEQUE_NO_CELL="errors.cellchequeNo";
	String CHEQUE_DATE_CELL="errors.cellchequeDate";
	String BANK_NAME_CELL="errors.cellbankName";
	String AMOUNT_CELL="errors.cellamount";
	String BANK_BRANCH_CELL="errors.cellbankBranch";
	String BROWSE_XLSHEET="errors.browsexlsheet";
	String VALID_XLSHEET="errors.validxlsheet";
	String INVALID_CHEQUE_DATE = "error.invaliddate";
	String AUDIT = "simpleAccounting.audit";
	String AUDIT_COMMENTS = "simpleAccounting.auditComments";
	String PICKDATE = "pickDate";


}
