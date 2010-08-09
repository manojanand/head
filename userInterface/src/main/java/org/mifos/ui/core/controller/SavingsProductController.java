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

package org.mifos.ui.core.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mifos.application.admin.servicefacade.AdminServiceFacade;
import org.mifos.dto.screen.ProductDisplayDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/viewSavingsProducts")
@SessionAttributes("formBean")
public class SavingsProductController {

//    private static final String REDIRECT_TO_ADMIN_SCREEN = "redirect:/AdminAction.do?method=load";
//    private static final String CANCEL_PARAM = "CANCEL";
//    private static final String CANCEL_PARAM_VALUE = "Cancel";

    @Autowired
    private AdminServiceFacade adminServiceFacade;

    protected SavingsProductController() {
        // default contructor for spring autowiring
    }

    public SavingsProductController(final AdminServiceFacade adminServiceFacade) {
        this.adminServiceFacade = adminServiceFacade;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handleRequestInternal(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView("viewSavingsProducts");
        List<ProductDisplayDto> productDto = adminServiceFacade.retrieveSavingsProducts();
        modelAndView.addObject("products", productDto);
        modelAndView.addObject("breadcrumbs", new AdminBreadcrumbBuilder().withLink("admin.viewSavingsproducts",
                "viewSavingsProducts.ftl").build());

        return modelAndView;
    }
}