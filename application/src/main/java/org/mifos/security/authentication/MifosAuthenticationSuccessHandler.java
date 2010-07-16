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

package org.mifos.security.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mifos.application.servicefacade.LoginActivityDto;
import org.mifos.security.login.util.helpers.LoginConstants;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 *
 */
public class MifosAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {

        String targetUrl = super.determineTargetUrl(request, response);

        LoginActivityDto loginActivity = (LoginActivityDto) request.getAttribute("activityDto");

        Short passwordChanged = loginActivity.getPasswordChangedFlag();
        if (null != passwordChanged && LoginConstants.FIRSTTIMEUSER.equals(passwordChanged)) {
            targetUrl = "/changePassword.ftl?username=" + request.getAttribute("username");
        }

        return targetUrl;
    }
}