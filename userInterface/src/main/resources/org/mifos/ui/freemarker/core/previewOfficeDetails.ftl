[#ftl]
[#--
* Copyright (c) 2005-2011 Grameen Foundation USA
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
--]
[@layout.header "title" /]
  [@widget.topNavigationNoSecurity currentTab="Admin" /]
    <!--  Main Content Begins-->
  <div class="content definePageMargin">
    <div class="borders span-22">
      <div class="borderbtm span-22">
        <p class="span-17 completeIMG silverheading">[@spring.message "offices.previewNewOffice.officeinformation"/]</p>
        <p class="span-3 arrowIMG orangeheading last width130px">[@spring.message "reviewAndSubmit"/]</p>
      </div>
      <div class="subcontent">
      <form method="POST" action="previewOfficeDetails.ftl" name="previewOfficeDetails">
        <p class="font15"><span class="fontBold">[@spring.message "offices.previewNewOffice.addanewoffice"/]</span>&nbsp;-&nbsp;<span class="orangeheading">[@spring.message "reviewAndSubmit"/]</span></p>
        <p>&nbsp;&nbsp;</p>
        <div class="orangeheading">[@spring.message "offices.previewNewOffice.officeinformation"/]</div>
        <div class="prepend-1  span-21 last">
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.officeName"/]&nbsp;:</span>
                    <span>${officeFormBean.name}&nbsp;<input type="hidden" value="${officeFormBean.name}" name="name"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.officeshortname"/]&nbsp;:</span>
                    <span>${officeFormBean.officeShortName}&nbsp;<input type="hidden" name="officeShortName" value="${officeFormBean.officeShortName}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.officetype"/]&nbsp;:</span>
                    <span>${officeFormBean.officeLevelName}&nbsp;<input type="hidden" name="officeLevelName" value="${officeFormBean.officeLevelName}"/><input type="hidden" name="levelId" value="${officeFormBean.levelId}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.parentOffice"/]&nbsp;:</span>
                    <span>${officeFormBean.parentOfficeName?default("")}&nbsp;<input type="hidden" name="parentOfficeName" value="${officeFormBean.parentOfficeName?default("")}"/><input type="hidden" name="parentId" value="${officeFormBean.parentId?default("")}"/></span>
              </div>
        </div>
        <p>&nbsp;</p>
        <div class="prepend-1  span-21 last">
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.viewOfficeDetails.address"/] &nbsp;:</span><br />
                    <span>${officeFormBean.line1?default("")}<input type="hidden" name="line1" value="${officeFormBean.line1?default("")}"/></span>,&nbsp;<span>${officeFormBean.line2?default("")}<input type="hidden" name="line2" value="${officeFormBean.line2?default("")}"/></span>,&nbsp;<span>${officeFormBean.line3?default("")}<input type="hidden" name="line3" value="${officeFormBean.line3?default("")}"/></span>
              </div>

            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.cityorDistrict"/]&nbsp;:</span>
                    <span>&nbsp;${officeFormBean.city?default("")}<input type="hidden" name="city" value="${officeFormBean.city?default("")}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.state"/]&nbsp;:</span>
                    <span>&nbsp;${officeFormBean.state?default("")}<input type="hidden" name="state" value="${officeFormBean.state?default("")}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.country"/]&nbsp;:</span>
                    <span>&nbsp;${officeFormBean.country?default("")}<input type="hidden" name="country" value="${officeFormBean.country?default("")}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.postalCode"/]&nbsp;:</span>
                    <span>&nbsp;${officeFormBean.zip?default("")}<input type="hidden" name="zip" value="${officeFormBean.zip?default("")}"/></span>
              </div>
            <div class="span-20 "><span class="span-3 fontBold">[@spring.message "offices.previewNewOffice.telephone"/]&nbsp;:</span>
                    <span>&nbsp;${officeFormBean.phoneNumber?default("")}<input type="hidden" name="phoneNumber" value="${officeFormBean.phoneNumber?default("")}"/></span>
              </div>
            <div class="clear">&nbsp;</div>
            <div> <input class="buttn2" type="submit" name="EDIT" value="[@spring.message "offices.viewOfficeDetails.editofficeinformation"/]"/>
            </div>
        </div>

        <div class="clear">&nbsp;</div>
        <hr />
        <div class="prepend-8">
          <input class="buttn" type="submit" name="SUBMIT" value="[@spring.message "submit"/]"/>
          <input class="buttn2" type="submit" name="CANCEL" value="[@spring.message "cancel"/]"/>
        </div>
        <div class="clear">&nbsp;</div>
        </form>
      </div><!--Subcontent Ends-->
    </div>
  </div>
  <!--Main Content Ends-->
   [@layout.footer/]