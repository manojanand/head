/*
 * Copyright (c) 2005-2010 Grameen Foundation USA
 *  All rights reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 *  implied. See the License for the specific language governing
 *  permissions and limitations under the License.
 *
 *  See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 *  explanation of the license and how it is applied.
 */

package org.mifos.ui.core.controller;

import org.mifos.platform.questionnaire.contract.SectionQuestionDetail;

public class SectionQuestionDetailForm {
    private SectionQuestionDetail sectionQuestionDetail;

    public SectionQuestionDetailForm(SectionQuestionDetail sectionQuestionDetail) {
        this.sectionQuestionDetail = sectionQuestionDetail;
    }

    public int getQuestionId() {
        return sectionQuestionDetail.getQuestionId();
    }

    public String getTitle() {
        return sectionQuestionDetail.getTitle();
    }

    public boolean isMandatory() {
        return sectionQuestionDetail.isMandatory();
    }

    public void setMandatory(boolean mandatory) {
        sectionQuestionDetail.setMandatory(mandatory);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SectionQuestionDetailForm that = (SectionQuestionDetailForm) o;
        return getQuestionId() == that.getQuestionId();
    }

    @Override
    public int hashCode() {
        return getQuestionId();
    }
}