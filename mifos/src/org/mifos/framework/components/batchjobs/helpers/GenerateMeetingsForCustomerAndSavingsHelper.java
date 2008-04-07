package org.mifos.framework.components.batchjobs.helpers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mifos.application.accounts.business.AccountActionDateEntity;
import org.mifos.application.accounts.business.AccountBO;
import org.mifos.application.accounts.persistence.AccountPersistence;
import org.mifos.application.accounts.savings.business.SavingsBO;
import org.mifos.application.customer.business.CustomerAccountBO;
import org.mifos.framework.components.batchjobs.MifosTask;
import org.mifos.framework.components.batchjobs.SchedulerConstants;
import org.mifos.framework.components.batchjobs.TaskHelper;
import org.mifos.framework.components.batchjobs.exceptions.BatchJobException;
import org.mifos.framework.exceptions.PersistenceException;
import org.mifos.framework.hibernate.helper.HibernateUtil;
import org.mifos.framework.util.helpers.DateUtils;

public class GenerateMeetingsForCustomerAndSavingsHelper extends TaskHelper {

	public GenerateMeetingsForCustomerAndSavingsHelper(MifosTask mifosTask) {
		super(mifosTask);
	}

	@Override
	public void execute(long timeInMillis) throws BatchJobException {
		AccountPersistence accountPersistence = new AccountPersistence();
		List<Integer> customerAccountIds;
		try {
			customerAccountIds = accountPersistence
					.getActiveCustomerAndSavingsAccounts();
		} catch (PersistenceException e) {
			throw new BatchJobException(e);
		}
		List<String> errorList = new ArrayList<String>();
		for (Integer accountId : customerAccountIds) {
			try {
				HibernateUtil.getSessionTL();
				HibernateUtil.startTransaction();
				AccountBO accountBO = accountPersistence.getAccount(accountId);
				if (isScheduleToBeGenerated(accountBO.getLastInstallmentId(),
						accountBO.getDetailsOfNextInstallment())) {
					if (accountBO instanceof CustomerAccountBO) {
						((CustomerAccountBO) accountBO)
								.generateNextSetOfMeetingDates();
					}
					else if (accountBO instanceof SavingsBO) {
						((SavingsBO) accountBO).generateNextSetOfMeetingDates();
					}
				}
				HibernateUtil.commitTransaction();
			} catch (Exception e) {
				HibernateUtil.rollbackTransaction();
				errorList.add(accountId.toString());
				getLogger().error(
					"Unable to generate schedules for account with ID" + 
					accountId, false, null, e);
			} finally {
				HibernateUtil.closeSession();
			}
		}
		if (errorList.size() > 0)
			throw new BatchJobException(SchedulerConstants.FAILURE, errorList);
	}

	private boolean isScheduleToBeGenerated(int installmentSize,
			AccountActionDateEntity nextInstallment) {
		Date currentDate = DateUtils.getCurrentDateWithoutTimeStamp();
		short nextInstallmentId = (short) installmentSize;
		if (nextInstallment != null) {
			if (nextInstallment.getActionDate().compareTo(currentDate) == 0) {
				nextInstallmentId = (short) (nextInstallment.getInstallmentId()
						.intValue() + 1);
			} else {
				nextInstallmentId = (short) (nextInstallment.getInstallmentId()
						.intValue());
			}
		}
		int totalInstallmentDatesToBeChanged = installmentSize
				- nextInstallmentId + 1;
		return totalInstallmentDatesToBeChanged <= 5;
	}
	
	@Override
	public boolean isTaskAllowedToRun() {
		return true;
	}

}
