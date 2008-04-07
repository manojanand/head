package org.mifos.application.accounts.financial.business.service.activity.accountingentry;

import org.mifos.application.accounts.financial.business.FinancialActionBO;
import org.mifos.application.accounts.financial.business.GLCodeEntity;
import org.mifos.application.accounts.financial.exceptions.FinancialException;
import org.mifos.application.accounts.financial.util.helpers.FinancialActionCache;
import org.mifos.application.accounts.financial.util.helpers.FinancialActionConstants;
import org.mifos.application.accounts.financial.util.helpers.FinancialConstants;
import org.mifos.application.accounts.loan.business.LoanBO;
import org.mifos.application.accounts.loan.business.LoanTrxnDetailEntity;

public class DisbursalAmountReversalAccountingEntry extends BaseAccountingEntry {

	@Override
	protected void getSpecificAccountActionEntry() throws FinancialException {
		LoanTrxnDetailEntity loanTrxn = (LoanTrxnDetailEntity) financialActivity
				.getAccountTrxn();
		FinancialActionBO finloanDibursal = FinancialActionCache
				.getFinancialAction(FinancialActionConstants.DISBURSAL);
		// debit take form the prd offering

		GLCodeEntity glcodeDebit = ((LoanBO) loanTrxn.getAccount())
				.getLoanOffering().getPrincipalGLcode();
		addAccountEntryDetails(removeSign(loanTrxn.getAmount()),
				finloanDibursal, glcodeDebit, FinancialConstants.CREDIT);

		addAccountEntryDetails(removeSign(loanTrxn.getAmount()),
				finloanDibursal, getGLcode(finloanDibursal
						.getApplicableCreditCharts()), FinancialConstants.DEBIT);

	}

}
