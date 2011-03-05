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

package org.mifos.clientportfolio.newloan.domain;

import java.util.List;

import org.joda.time.DateTime;
import org.mifos.accounts.business.AccountFeesEntity;
import org.mifos.accounts.productdefinition.business.LoanOfferingBO;
import org.mifos.customers.business.CustomerBO;
import org.mifos.framework.util.helpers.Money;

public interface LoanScheduleFactory {

    LoanSchedule create(List<DateTime> loanScheduleDates, LoanOfferingBO loanProduct, CustomerBO customer,
            Money loanAmountDisbursed, Double interestRate, Integer interestDays, Integer graceDuration,
            List<AccountFeesEntity> accountFees);

}