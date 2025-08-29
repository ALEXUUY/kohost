{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10,
            stateNotRequired = true;
    </script>
{/if}

<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{lang key='pwstrength'}";
    window.langPasswordWeak = "{lang key='pwstrengthweak'}";
    window.langPasswordModerate = "{lang key='pwstrengthmoderate'}";
    window.langPasswordStrong = "{lang key='pwstrengthstrong'}";
    jQuery(document).ready(function() {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='registerCreateAccount'}"|cat:' <strong><a href="'|cat:"$WEB_ROOT"|cat:'/cart.php" class="alert-link">'|cat:"{lang key='registerCreateAccountOrder'}"|cat:'</a></strong>'}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$registrationDisabled}
    <div id="registration" class="tt-registration-form tt-custom-radius p-4 p-lg-5 bg-white">
        
        <!-- Business Management Header -->
        <div class="text-center mb-5">
            <h1 class="h3 mb-2 text-primary">مدیریت کسب و کار آنلاین</h1>
            <p class="text-muted lead">کسب‌وکار خود را ایجاد کنید، توسعه دهید و درآمد کسب کنید</p>
            <div class="d-flex justify-content-center align-items-center mb-3">
                <div class="bg-primary-light text-primary px-3 py-1 rounded-pill small">
                    <i class="fas fa-chart-line me-1"></i> رشد و توسعه
                </div>
                <div class="bg-success-light text-success px-3 py-1 rounded-pill small mx-2">
                    <i class="fas fa-coins me-1"></i> کسب درآمد
                </div>
                <div class="bg-info text-white px-3 py-1 rounded-pill small">
                    <i class="fas fa-bullhorn me-1"></i> تبلیغات
                </div>
            </div>
        </div>

        <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
            <input type="hidden" name="register" value="true"/>

            <div id="containerNewUserSignup">

                <!-- Business Type Selection -->
                <div class="card border-0 mb-4 bg-gradient">
                    <div class="card-body p-4">
                        <h3 class="h5 text-white mb-3 text-center">نوع کسب‌وکار خود را انتخاب کنید</h3>
                        <div class="row g-3">
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="website" id="business_website" checked>
                                    <label for="business_website" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-globe fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">ایجاد سایت</h6>
                                        <small class="text-muted">وبسایت حرفه‌ای بسازید</small>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="advertising" id="business_advertising">
                                    <label for="business_advertising" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-bullhorn fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">تبلیغات</h6>
                                        <small class="text-muted">کمپین‌های موثر</small>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="marketing" id="business_marketing">
                                    <label for="business_marketing" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-chart-line fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">بازاریابی</h6>
                                        <small class="text-muted">استراتژی فروش</small>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="referral" id="business_referral">
                                    <label for="business_referral" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-users fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">زیرمجموعه‌گیری</h6>
                                        <small class="text-muted">شبکه فروش بسازید</small>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="writing" id="business_writing">
                                    <label for="business_writing" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-pen fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">نویسندگی</h6>
                                        <small class="text-muted">محتوای کیفیت</small>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="business-type-card">
                                    <input type="radio" name="business_type" value="ecommerce" id="business_ecommerce">
                                    <label for="business_ecommerce" class="card h-100 text-center p-3 bg-white">
                                        <i class="fas fa-shopping-cart fa-2x mb-2 text-primary"></i>
                                        <h6 class="card-title mb-1">فروشگاه آنلاین</h6>
                                        <small class="text-muted">تجارت الکترونیک</small>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
                {if $linkableProviders}
                    <div class="tt-or-text">
                        {$LANG.orText}
                    </div>
                {/if}

                <div class="card border-0 mb-4 tt-custom-radius shadow-sm">
                    <div class="card-body p-4" id="personalInformation">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-user-circle fa-2x text-primary me-3"></i>
                            <div>
                                <h3 class="h5 mb-0">اطلاعات شخصی</h3>
                                <p class="text-muted small mb-0">اطلاعات کاربری خود را وارد کنید</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputFirstName" class="field-icon">
                                        <i class="fad fa-user"></i>
                                    </label>
                                    <input type="text" name="firstname" id="inputFirstName" class="field form-control" placeholder="{lang key='orderForm.firstName'}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputLastName" class="field-icon">
                                        <i class="fad fa-user"></i>
                                    </label>
                                    <input type="text" name="lastname" id="inputLastName" class="field form-control" placeholder="{lang key='orderForm.lastName'}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputEmail" class="field-icon">
                                        <i class="fad fa-envelope"></i>
                                    </label>
                                    <input type="email" name="email" id="inputEmail" class="field form-control" placeholder="{lang key='orderForm.emailAddress'}" value="{$clientemail}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputPhone" class="field-icon">
                                        <i class="fad fa-phone"></i>
                                    </label>
                                    <input type="tel" name="phonenumber" id="inputPhone" class="field" placeholder="{lang key='orderForm.phoneNumber'}" value="{$clientphonenumber}">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="card border-0 mb-4 tt-custom-radius shadow-sm">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-map-marker-alt fa-2x text-primary me-3"></i>
                            <div>
                                <h3 class="h5 mb-0">آدرس و اطلاعات تماس</h3>
                                <p class="text-muted small mb-0">آدرس و اطلاعات کسب‌وکار خود را وارد کنید</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputCompanyName" class="field-icon">
                                        <i class="far fa-building"></i>
                                    </label>
                                    <input type="text" name="companyname" id="inputCompanyName" class="field" placeholder="{lang key='orderForm.companyName'} ({lang key='orderForm.optional'})" value="{$clientcompanyname}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputAddress1" class="field-icon">
                                        <i class="far fa-building"></i>
                                    </label>
                                    <input type="text" name="address1" id="inputAddress1" class="field form-control" placeholder="{lang key='orderForm.streetAddress'}" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputAddress2" class="field-icon">
                                        <i class="fad fa-map-marker-alt"></i>
                                    </label>
                                    <input type="text" name="address2" id="inputAddress2" class="field" placeholder="{lang key='orderForm.streetAddress2'}" value="{$clientaddress2}">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group prepend-icon">
                                    <label for="inputCity" class="field-icon">
                                        <i class="far fa-building"></i>
                                    </label>
                                    <input type="text" name="city" id="inputCity" class="field form-control" placeholder="{lang key='orderForm.city'}" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group prepend-icon">
                                    <label for="state" class="field-icon" id="inputStateIcon">
                                        <i class="fad fa-map-signs"></i>
                                    </label>
                                    <label for="stateinput" class="field-icon" id="inputStateIcon">
                                        <i class="fad fa-map-signs"></i>
                                    </label>
                                    <input type="text" name="state" id="state" class="field form-control" placeholder="{lang key='orderForm.state'}" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group prepend-icon">
                                    <label for="inputPostcode" class="field-icon">
                                        <i class="fad fa-certificate"></i>
                                    </label>
                                    <input type="text" name="postcode" id="inputPostcode" class="field form-control" placeholder="{lang key='orderForm.postcode'}" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputCountry" class="field-icon" id="inputCountryIcon">
                                        <i class="fad fa-globe-americas"></i>
                                    </label>
                                    <select name="country" id="inputCountry" class="field form-control">
                                        {foreach $clientcountries as $countryCode => $countryName}
                                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                {$countryName}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            {if $showTaxIdField}
                                <div class="col-sm-12">
                                    <div class="form-group prepend-icon">
                                        <label for="inputTaxId" class="field-icon">
                                            <i class="fad fa-building"></i>
                                        </label>
                                        <input type="text" name="tax_id" id="inputTaxId" class="field" placeholder="{$taxLabel} ({lang key='orderForm.optional'})" value="{$clientTaxId}">
                                    </div>
                                </div>
                            {/if}
                        </div>

                    </div>
                </div>

                {if $customfields || $currencies}

                    <div class="card border-0 mb-4">
                        <div class="card-body p-0">
                            <h3 class="h6">{lang key='orderadditionalrequiredinfo'}<br><i><small>{lang key='orderForm.requiredField'}</small></i></h3>

                            <div class="row">
                                {if $customfields}
                                    {foreach $customfields as $customfield}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                                                <div class="control">
                                                    {$customfield.input}
                                                {if $customfield.description}
                                                    <span class="field-help-text">{$customfield.description}</span>
                                                {/if}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}
                                {if $customfields && count($customfields)%2 > 0 }
                                    <div class="clearfix"></div>
                                {/if}
                                {if $currencies}
                                    <div class="col-sm-6">
                                        <div class="form-group prepend-icon">
                                            <label for="inputCurrency" class="field-icon">
                                                <i class="far fa-money-bill-alt"></i>
                                            </label>
                                            <select id="inputCurrency" name="currency" class="field form-control">
                                                {foreach $currencies as $curr}
                                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                {/if}
                            </div>

                        </div>
                    </div>
                {/if}
            </div>

            <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="w-hidden"{/if}>

                <div class="card border-0 mb-4 tt-custom-radius shadow-sm">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-shield-alt fa-2x text-success me-3"></i>
                            <div>
                                <h3 class="h5 mb-0">امنیت حساب کاربری</h3>
                                <p class="text-muted small mb-0">کلمه عبور قوی برای حساب خود انتخاب کنید</p>
                            </div>
                        </div>

                        <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                            <div id="passwdFeedback" class="alert alert-info text-center col-sm-12 w-hidden"></div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputNewPassword1" class="field-icon">
                                        <i class="fad fa-lock"></i>
                                    </label>
                                    <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field" placeholder="{lang key='clientareapassword'}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputNewPassword2" class="field-icon">
                                        <i class="fad fa-lock"></i>
                                    </label>
                                    <input type="password" name="password2" id="inputNewPassword2" class="field" placeholder="{lang key='clientareaconfirmpassword'}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <button type="button" class="btn btn-default btn-sm btn-sm-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                        {lang key='generatePassword.btnLabel'}
                                    </button>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="password-strength-meter">
                                    <div class="progress">
                                        <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                        </div>
                                    </div>
                                    <p class="small text-muted" id="passwordStrengthTextLabel">{lang key='pwstrength'}: {lang key='pwstrengthenter'}</p>
                                </div>
                            </div>
                        </div>
                        {if $securityquestions}
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <select name="securityqid" id="inputSecurityQId" class="field form-control">
                                        <option value="">{lang key='clientareasecurityquestion'}</option>
                                        {foreach $securityquestions as $question}
                                            <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                {$question.question}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group prepend-icon">
                                        <label for="inputSecurityQAns" class="field-icon">
                                            <i class="fad fa-lock"></i>
                                        </label>
                                        <input type="password" name="securityqans" id="inputSecurityQAns" class="field form-control" placeholder="{lang key='clientareasecurityanswer'}" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>

                </div>
            </div>

            {if $showMarketingEmailOptIn}
                <div class="card border-0 mb-4">
                    <div class="card-body p-0">
                        <h3 class="h6">{lang key='emailMarketing.joinOurMailingList'}</h3>
                        <p>{$marketingEmailOptInMessage}</p>
                        <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                    </div>
                </div>
            {/if}

            {include file="$template/includes/captcha.tpl"}

            {if $accepttos}
                <label class="form-check mb-4">
                    <input type="checkbox" name="accepttos" class="form-check-input accepttos">
                    {lang key='ordertosagreement'} <a href="{$tosurl}" target="_blank">{lang key='ordertos'}</a>
                </label>
            {/if}

            <!-- Success Promise -->
            <div class="card border-0 mb-4 bg-success-light">
                <div class="card-body p-3">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-check-circle fa-2x text-success me-3"></i>
                        <div>
                            <h6 class="mb-1 text-success">آماده شروع کسب‌وکار آنلاین؟</h6>
                            <small class="text-muted">امکانات حرفه‌ای، پشتیبانی ۲۴ ساعته و ابزارهای پیشرفته در انتظار شماست</small>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="d-flex justify-content-between align-items-center">
                <button class="btn btn-lg btn-primary{$captcha->getButtonClass($captchaForm)} px-5" type="submit">
                    <i class="fas fa-rocket me-2"></i>
                    شروع کسب‌وکار آنلاین
                </button>
                <ul class="list-inline mb-0 float-lg-right">
                    {if $languagechangeenabled && count($locales) > 1 || $currencies}
                        <li class="list-inline-item">
                            <button type="button" class="btn" data-toggle="modal" data-target="#modalChooseLanguage">
                                <div class="d-inline-block align-middle">
                                    <div class="iti-flag {if $activeLocale.countryCode === 'GB'}us{else}{$activeLocale.countryCode|lower}{/if}"></div>
                                </div>
                                {$activeLocale.localisedName}
                                /
                                {$activeCurrency.prefix}
                                {$activeCurrency.code}
                            </button>
                        </li>
                    {/if}
                </ul>
            </div>
        </form>
        <div class="auth-footer mt-4">{$LANG.allReadyRegister} <a href="{$WEB_ROOT}/clientarea.php"> {$LANG.login} </a> <span class="text-lowercase">{$LANG.orText}</span> <a href="{routePath('password-reset-begin')}">{$LANG.forgotpw}</a></div>
    </div>
{/if}