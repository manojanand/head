[#ftl]
[#import "spring.ftl" as spring]
[#import "blueprintmacros.ftl" as mifos]
[@mifos.header "title" /]
[@mifos.topNavigationNoSecurity currentTab="Admin" /]
<!--  Main Content Begins-->
<span id="page.id" title="SavingsProductPreview"/>

<div class="content definePageMargin">
    <div class="borders margin20lefttop width90prc">
        <div class="borderbtm width100prc height25px">
            <p class="span-17 completeIMG silverheading  padding20left"
               style="width:50%">[@spring.message "manageSavngsProducts.previewSavingsProducts.savingsproductinformation" /]</p>

            <p class="span-3 timelineboldorange arrowIMG last padding20left10right"
               style="float:right">[@spring.message "reviewAndSubmit" /]</p>
        </div>
        <div class="margin20lefttop">
            <form method="post" action="previewSavingsProducts.ftl" name="previewsavingsproduct">
                <p class="font15 margin5bottom"><span
                        class="fontBold">${savingsProduct.generalDetails.name}</span>&nbsp;-&nbsp;<span
                        class="orangeheading">[@spring.message "manageProducts.defineSavingsProducts.previewSavingsProductInformation" /]</span></p>

                <p>[@spring.message "reviewtheinformationbelow.ClickSubmit" /]</p>
            [@mifos.showAllErrors "savingsProduct.*"/]
                <p class="fontBold margin10topbottom">[@spring.message "manageSavngsProducts.previewSavingsProducts.savingsproductdetails" /] </p>

                <div class="span-21 last">
                    <div class="span-20">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.productinstancename" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.generalDetails.name}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.shortname" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.generalDetails.shortName}</span>
                    </div>
                    <div class="span-20 margin10topbottom">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.description" /]
                                        :&nbsp;</span><br/>
                        <span class="span-4">${savingsProduct.generalDetails.description}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.productcategory" /]
                                        :&nbsp;</span>
                        <span class="span-4">${categoryName}</span>
                    </div>
                    <div class="span-20 last">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.startdate" /]
                                        :</span>
                        <span class="span-4">${startDateFormatted}</span>
                    </div>
                    <div class="span-20 last">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.enddate" /]
                                        :</span>
                        <span class="span-4">${endDateFormatted}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.applicablefor" /]
                                        :&nbsp;</span>
                        <span class="span-4">${applicableTo}</span>
                    </div>
                </div>
                <div class="clear">&nbsp;</div>
                <p class="fontBold margin10topbottom">[@spring.message "manageSavngsProducts.previewSavingsProducts.targetedDepositsandWithdrawalRestrictions" /] </p>

                <div class="span-21 last">
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.typeofdeposits" /]
                                        :&nbsp;</span>
                        <span class="span-4">${depositType}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.mandatoryamountfordeposit" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.amountForDeposit}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.amountAppliesto" /]
                                        :&nbsp;</span>
                        <span class="span-4">${appliesTo}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.maxamountperwithdrawal" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.maxWithdrawalAmount}</span>
                    </div>
                </div>
                <div class="clear">&nbsp;</div>
                <p class="fontBold margin10topbottom">[@spring.message "manageSavngsProducts.previewSavingsProducts.interestrate" /] </p>

                <div class="span-21 last">
                    <div class="span-20">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.interestrate" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.interestRate}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.balanceusedforInterestcalculation" /]
                                        :&nbsp;</span>
                        <span class="span-4">${interestCalculationUsed}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.timeperiodforInterestcalculation" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.interestCalculationFrequency} ${interestCalculationTimePeriod}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.frequencyofInterestpostingtoaccounts" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.interestPostingMonthlyFrequency} [@spring.message "manageProducts.defineSavingsProducts.month(s)" /]</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.minimumbalancerequiredforInterestcalculation" /]
                                        :&nbsp;</span>
                        <span class="span-4">${savingsProduct.minBalanceRequiredForInterestCalculation}</span>
                    </div>
                </div>
                <div class="clear">&nbsp;</div>
                <p class="fontBold margin10topbottom">[@spring.message "manageSavngsProducts.previewSavingsProducts.accounting" /] </p>

                <div class="span-21 last">
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.gLcodefordeposits" /]
                                        :&nbsp;</span>
                        <span class="span-4">${depositGlCode}</span>
                    </div>
                    <div class="span-20 ">
                                    <span class="span-8 fontBold">[@spring.message "manageSavngsProducts.previewSavingsProducts.gLcodeforInterest" /]
                                        :&nbsp;</span>
                        <span class="span-4">${interestGlCode}</span>
                    </div>
                    <div class="clear">&nbsp;</div>
                    <div class="span-20">
                        <input type="hidden" name="editFormview" value="${editFormview}"/>
                        <input class="insidebuttn margin30top" type="submit" name="EDIT"
                               value="[@spring.message "manageSavngsProducts.editsavingsproduct.editSavingsproductinformation"/]"/>
                    </div>
                </div>
                <div class="clear">&nbsp;</div>
                <div class="buttonsSubmitCancel margin20right">
                    <input class="buttn" type="submit" id="CreateSavingsProductPreview.button.submit"
                           name="submit" value="[@spring.message "submit"/]"/>
                    <input class="buttn2" type="submit" name="CANCEL" value="[@spring.message "cancel"/]"/>
                </div>
                <div class="clear">&nbsp;</div>
            </form>
        </div>
        <!--Subcontent Ends-->
    </div>
</div>
<!--Main Content Ends-->
[@mifos.footer/]