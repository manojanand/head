/*
 * Copyright (c) 2005-2010 Grameen Foundation USA
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

package org.mifos.customers.client.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.mifos.application.util.helpers.ActionForwards;
import org.mifos.customers.business.service.CustomerBusinessService;
import org.mifos.customers.client.business.ClientBO;
import org.mifos.customers.client.business.service.ClientBusinessService;
import org.mifos.customers.client.struts.actionforms.ClientTransferActionForm;
import org.mifos.customers.client.util.helpers.ClientConstants;
import org.mifos.customers.group.business.GroupBO;
import org.mifos.customers.office.business.OfficeBO;
import org.mifos.customers.office.business.service.OfficeBusinessService;
import org.mifos.customers.util.helpers.CustomerConstants;
import org.mifos.customers.util.helpers.CustomerSearchInputDto;
import org.mifos.framework.business.service.BusinessService;
import org.mifos.framework.exceptions.ServiceException;
import org.mifos.framework.struts.action.BaseAction;
import org.mifos.framework.util.helpers.BusinessServiceName;
import org.mifos.framework.util.helpers.CloseSession;
import org.mifos.framework.util.helpers.Constants;
import org.mifos.framework.util.helpers.SessionUtils;
import org.mifos.framework.util.helpers.TransactionDemarcate;
import org.mifos.security.util.ActionSecurity;
import org.mifos.security.util.SecurityConstants;

public class ClientTransferAction extends BaseAction {

    @Override
    protected BusinessService getService() throws ServiceException {
        return getCustomerBusinessService();
    }

    @Override
    protected boolean skipActionFormToBusinessObjectConversion(@SuppressWarnings("unused") String method) {
        return true;
    }

    public static ActionSecurity getSecurity() {
        ActionSecurity security = new ActionSecurity("clientTransferAction");
        security.allow("loadParents", SecurityConstants.CIENT_CHANGE_GROUP_MEMBERSHIP);
        security.allow("loadBranches", SecurityConstants.CIENT_TRANSFER_THE_CLIENT);
        security.allow("previewBranchTransfer", SecurityConstants.VIEW);
        security.allow("previewParentTransfer", SecurityConstants.VIEW);
        security.allow("updateParent", SecurityConstants.CIENT_CHANGE_GROUP_MEMBERSHIP);
        security.allow("transferToBranch", SecurityConstants.CIENT_TRANSFER_THE_CLIENT);
        return security;
    }

    @TransactionDemarcate(joinToken = true)
    public ActionForward loadBranches(ActionMapping mapping, @SuppressWarnings("unused") ActionForm form, @SuppressWarnings("unused") HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        return mapping.findForward(ActionForwards.loadBranches_success.toString());
    }

    @TransactionDemarcate(joinToken = true)
    public ActionForward previewBranchTransfer(ActionMapping mapping, @SuppressWarnings("unused") ActionForm form, @SuppressWarnings("unused") HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        return mapping.findForward(ActionForwards.previewBranchTransfer_success.toString());
    }

    @TransactionDemarcate(validateAndResetToken = true)
    @CloseSession
    public ActionForward transferToBranch(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        ClientTransferActionForm actionForm = (ClientTransferActionForm) form;
        OfficeBO officeToTransfer = getOfficelBusinessService().getOffice(actionForm.getOfficeIdValue());

        ClientBO clientInSession = (ClientBO) SessionUtils.getAttribute(Constants.BUSINESS_KEY, request);
        ClientBO client = (ClientBO) getCustomerBusinessService().getCustomer(clientInSession.getCustomerId());
        checkVersionMismatch(clientInSession.getVersionNo(), client.getVersionNo());
        client.setVersionNo(clientInSession.getVersionNo());
        client.setUserContext(getUserContext(request));
        setInitialObjectForAuditLogging(client);
        client.transferToBranch(officeToTransfer);
        clientInSession = null;
        officeToTransfer = null;
        SessionUtils.setAttribute(Constants.BUSINESS_KEY, client, request);
        return mapping.findForward(ActionForwards.update_success.toString());
    }

    @TransactionDemarcate(validateAndResetToken = true)
    public ActionForward cancel(ActionMapping mapping, @SuppressWarnings("unused") ActionForm form, @SuppressWarnings("unused") HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        return mapping.findForward(ActionForwards.cancel_success.toString());
    }

    @TransactionDemarcate(joinToken = true)
    public ActionForward loadParents(ActionMapping mapping, @SuppressWarnings("unused") ActionForm form, HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        CustomerSearchInputDto clientSearchInput = new CustomerSearchInputDto();
        clientSearchInput.setOfficeId(getUserContext(request).getBranchId());
        clientSearchInput.setCustomerInputPage(ClientConstants.INPUT_GROUP_TRANSFER);
        SessionUtils.setAttribute(CustomerConstants.CUSTOMER_SEARCH_INPUT, clientSearchInput, request.getSession());
        return mapping.findForward(ActionForwards.loadParents_success.toString());
    }

    @TransactionDemarcate(joinToken = true)
    public ActionForward previewParentTransfer(ActionMapping mapping, @SuppressWarnings("unused") ActionForm form, @SuppressWarnings("unused") HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {
        return mapping.findForward(ActionForwards.previewParentTransfer_success.toString());
    }

    @CloseSession
    @TransactionDemarcate(validateAndResetToken = true)
    public ActionForward updateParent(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            @SuppressWarnings("unused") HttpServletResponse response) throws Exception {

        ClientTransferActionForm actionForm = (ClientTransferActionForm) form;

        GroupBO transferToGroup = (GroupBO) getCustomerBusinessService().getCustomer(actionForm.getParentGroupIdValue());

        transferToGroup.setUserContext(getUserContext(request));

        ClientBO clientInSession = (ClientBO) SessionUtils.getAttribute(Constants.BUSINESS_KEY, request);
        ClientBO client = getClientBusinessService().getClient(clientInSession.getCustomerId());
        checkVersionMismatch(clientInSession.getVersionNo(), client.getVersionNo());

        client.setVersionNo(clientInSession.getVersionNo());
        client.setUserContext(getUserContext(request));
        setInitialObjectForAuditLogging(client);

        client.transferToGroup(transferToGroup);
        clientInSession = null;
        transferToGroup = null;

        SessionUtils.setAttribute(Constants.BUSINESS_KEY, client, request);
        return mapping.findForward(ActionForwards.update_success.toString());
    }

    private CustomerBusinessService getCustomerBusinessService() {
        return new CustomerBusinessService();
    }

    private ClientBusinessService getClientBusinessService() {
        return new ClientBusinessService();
    }

    private OfficeBusinessService getOfficelBusinessService() {
        return new OfficeBusinessService();
    }
}