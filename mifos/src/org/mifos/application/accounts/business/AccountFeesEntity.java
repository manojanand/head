/**
 
 * AccountFeesEntity.java    version: xxx
 
 
 
 * Copyright (c) 2005-2006 Grameen Foundation USA
 
 * 1029 Vermont Avenue, NW, Suite 400, Washington DC 20005
 
 * All rights reserved.
 
 
 
 * Apache License 
 * Copyright (c) 2005-2006 Grameen Foundation USA 
 * 
 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
 *
 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the 
 
 * License. 
 * 
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an explanation of the license 
 
 * and how it is applied. 
 
 *
 
 */

package org.mifos.application.accounts.business;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.mifos.application.accounts.exceptions.AccountException;
import org.mifos.application.fees.business.FeeBO;
import org.mifos.application.fees.util.helpers.FeeStatus;
import org.mifos.application.meeting.business.MeetingBO;
import org.mifos.framework.business.PersistentObject;
import org.mifos.framework.components.repaymentschedule.MeetingScheduleHelper;
import org.mifos.framework.components.scheduler.SchedulerIntf;
import org.mifos.framework.exceptions.ApplicationException;
import org.mifos.framework.util.helpers.DateUtils;
import org.mifos.framework.util.helpers.Money;

public class AccountFeesEntity extends PersistentObject {

	private final Integer accountFeeId;

	private final AccountBO account;

	private final FeeBO fees;

	private Money accountFeeAmount;

	private Double feeAmount;

	private Short feeStatus;

	private Date statusChangeDate;

	private Date lastAppliedDate;
	
	protected AccountFeesEntity() {
		super();
		accountFeeId=null;
		account=null;
		fees=null;

	}

	public AccountFeesEntity(AccountBO account, FeeBO fee, Double feeAmount){
		accountFeeId=null;
		this.account = account;
		this.fees = fee;
		this.feeAmount = feeAmount;
		this.accountFeeAmount = new Money(String.valueOf(feeAmount));
	}
	
	public AccountFeesEntity(AccountBO account, FeeBO fees, Double feeAmount,
			Short feeStatus, Date statusChangeDate, Date lastAppliedDate) {
		accountFeeId=null;
		this.account = account;
		this.fees = fees;
		this.accountFeeAmount = new Money(String.valueOf(feeAmount));
		this.feeAmount = feeAmount;
		this.feeStatus = feeStatus;
		this.statusChangeDate = statusChangeDate;
		this.lastAppliedDate = lastAppliedDate;
	}
	
	public AccountBO getAccount() {
		return account;
	}

	public Integer getAccountFeeId() {
		return accountFeeId;
	}

	public Money getAccountFeeAmount() {
		return accountFeeAmount;
	}

	public void setAccountFeeAmount(Money accountFeeAmount) {
		this.accountFeeAmount = accountFeeAmount;
	}

	public Double getFeeAmount() {
		return feeAmount;
	}

	public void setFeeAmount(Double feeAmount) {
		this.feeAmount = feeAmount;
	}

	public FeeBO getFees() {
		return fees;
	}

	public Short getFeeStatus() {
		return feeStatus;
	}

	public void setFeeStatus(Short feeStatus) {
		this.feeStatus = feeStatus;
	}

	public Date getStatusChangeDate() {
		return statusChangeDate;
	}

	public void setStatusChangeDate(Date statusChangeDate) {
		this.statusChangeDate = statusChangeDate;
	}

	public Date getLastAppliedDate() {
		return lastAppliedDate;
	}

	public void setLastAppliedDate(Date lastAppliedDate) {
		this.lastAppliedDate = lastAppliedDate;
	}

	public void changeFeesStatus(Short status, Date changeDate) {
		this.setFeeStatus(status);
		this.setStatusChangeDate(changeDate);
	}

	public boolean isTimeOfDisbursement() {
		return getFees().isTimeOfDisbursement();
	}
	
	public boolean isPeriodic() {
		return getFees().isPeriodic();
	}
	
	public boolean isActive() {
		if(feeStatus==null || feeStatus.equals(FeeStatus.ACTIVE.getValue()))
			return true;
		return false;
	}

	public Integer getApplicableDatesCount(Date date) throws AccountException  {
		Integer applicableDatesCount = 0 ;
		SchedulerIntf schedulerIntf;
		if (getLastAppliedDate() != null) {
			MeetingBO meetingBO = getAccount().getCustomer()
					.getCustomerMeeting().getMeeting();
			Calendar meetingStartDate = new GregorianCalendar();
			meetingStartDate.setTime(getLastAppliedDate());
			Calendar customerMeetingStartDate = meetingBO.getMeetingStartDate();
			Short recurAfter = meetingBO.getMeetingDetails().getRecurAfter();
			meetingBO.setMeetingStartDate(meetingStartDate);
			meetingBO.getMeetingDetails().setRecurAfter(
					getFees().getFeeFrequency().getFeeMeetingFrequency()
							.getMeetingDetails().getRecurAfter());
			List<Date> applDates =null;
			try {
				schedulerIntf = MeetingScheduleHelper.getSchedulerObject(meetingBO);
				applDates = schedulerIntf.getAllDates(date);
			} catch (ApplicationException e) {
				throw new AccountException(e);
			}
			if (applDates != null && !applDates.isEmpty()) {
				Iterator<Date> itr = applDates.iterator();
				while (itr.hasNext()) {
					Date appliedDate = itr.next();
					if (DateUtils
							.getDateWithoutTimeStamp(appliedDate.getTime())
							.compareTo(
									DateUtils
											.getDateWithoutTimeStamp(getLastAppliedDate()
													.getTime())) == 0) {
						itr.remove();
					}
				}
				applicableDatesCount = applDates.size();
			}
			meetingBO.setMeetingStartDate(customerMeetingStartDate);
			meetingBO.getMeetingDetails().setRecurAfter(recurAfter);
		}
		return applicableDatesCount;
	}

}
