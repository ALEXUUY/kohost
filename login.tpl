<div class="providerLinkingFeedback"></div>

<div class="tt-form-wrap">
    <form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
        <div class="tt-form-container">
            <div class="tt-form-content">
                <div class="mb-4 text-center">
                    <div class="bg-primary-light d-inline-flex align-items-center justify-content-center rounded-circle mb-3" style="width: 80px; height: 80px;">
                        <i class="fas fa-user-tie fa-2x text-primary"></i>
                    </div>
                    <h3 class="h3 mt-2 text-primary">ورود به پنل مدیریت</h3>
                    <p class="text-muted mb-0">به پنل مدیریت کسب‌وکار خود وارد شوید</p>
                    <div class="d-flex justify-content-center mt-3">
                        <span class="badge bg-primary-light text-primary px-3 py-1">مدیریت حرفه‌ای</span>
                    </div>
                </div>
                {include file="$template/includes/flashmessage.tpl"}
                <div class="form-group mb-4">
                    <label for="inputEmail" class="form-control-label">آدرس ایمیل یا نام کاربری</label>
                    <div class="input-group input-group-merge">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-primary-light border-primary"><i class="fas fa-envelope text-primary"></i></span>
                        </div>
                        <input type="email" class="form-control border-primary" name="username" id="inputEmail" placeholder="email@example.com" autofocus>
                    </div>
                </div>
                <div class="form-group mb-4">
                    <div class="d-flex align-items-center justify-content-between">
                        <label for="inputPassword" class="form-control-label">کلمه عبور</label>
                        <div class="mb-2">
                            <a href="{routePath('password-reset-begin')}" class="small text-primary" tabindex="-1">فراموشی رمز؟</a>
                        </div>
                    </div>
                    <div class="input-group input-group-merge">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-primary-light border-primary"><i class="fas fa-lock text-primary"></i></span>
                        </div>
                        <input type="password" class="form-control pw-input border-primary" name="password" id="inputPassword" placeholder="کلمه عبور خود را وارد کنید" autocomplete="off">
                        <div class="input-group-append">
                            <button class="btn-reveal-pw bg-primary-light border-primary" type="button" tabindex="-1">
                                <i class="fas fa-eye text-primary"></i>
                            </button>
                        </div>
                    </div>
                </div>
                {if $captcha->isEnabled()}
                    {include file="$template/includes/tt/kohost/tt-captcha.tpl"}
                {/if}
                <div class="mb-4">
                    <button id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)} btn-lg w-100">
                        <i class="fas fa-sign-in-alt me-2"></i>
                        ورود به پنل مدیریت
                    </button>
                </div>
                <div class="d-flex align-items-center justify-content-center mb-3">
                    <label class="mb-0 d-flex align-items-center">
                        <input type="checkbox" class="form-check-input me-2" name="rememberme" />
                        <span class="small text-muted">مرا به خاطر بسپار</span>
                    </label>
                </div>

                {if $linkableProviders}
                    <div class="tt-or-text tt-login-or mt-4">
                        {$LANG.orText}
                    </div>
                {/if}

                {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}

                <div class="text-center border-top pt-4">
                    <p class="mb-0 text-muted">حساب کاربری ندارید؟</p>
                    <a href="{$WEB_ROOT}/register.php" class="btn btn-outline-primary mt-2">
                        <i class="fas fa-user-plus me-2"></i>
                        ایجاد کسب‌وکار جدید
                    </a>
                    <p class="mt-3 mb-0">
                    <ul class="list-inline mb-0">
                        {if $languagechangeenabled && count($locales) > 1 || $currencies}
                            <li class="list-inline-item">
                                <button type="button" class="btn p-0" data-toggle="modal" data-target="#modalChooseLanguage">
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
            </div>
            <div class="tt-login-registration-testimonial" style="background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); position: relative;">
                <div class="position-absolute top-0 start-0 w-100 h-100" style="background: rgba(28, 64, 242, 0.1); backdrop-filter: blur(10px);"></div>
                <div class="tt-testimonial-slider position-relative">
                    <div class="text-center text-white p-5">
                        <div class="mb-4">
                            <i class="fas fa-chart-line fa-3x mb-3 opacity-75"></i>
                            <h4 class="h5 mb-3">مدیریت حرفه‌ای کسب‌وکار</h4>
                            <p class="opacity-75">با ابزارهای حرفه‌ای ما، کسب‌وکار خود را به سطح جدیدی برسانید</p>
                        </div>
                        <div class="row text-center">
                            <div class="col-4">
                                <i class="fas fa-globe fa-2x mb-2"></i>
                                <small class="d-block">وبسایت</small>
                            </div>
                            <div class="col-4">
                                <i class="fas fa-bullhorn fa-2x mb-2"></i>
                                <small class="d-block">تبلیغات</small>
                            </div>
                            <div class="col-4">
                                <i class="fas fa-coins fa-2x mb-2"></i>
                                <small class="d-block">درآمد</small>
                            </div>
                        </div>
                    </div>
                    {include file="$template/includes/tt/kohost/tt-login-register-testimonial.tpl"}
                </div>
            </div>
        </div>
    </form>
</div>


