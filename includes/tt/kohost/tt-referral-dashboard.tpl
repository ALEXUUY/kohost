
<div class="tt-referral-dashboard">
    <div class="card">
        <div class="card-header">
            <h5><i class="fas fa-users me-2"></i>سیستم زیرمجموعه‌گیری</h5>
        </div>
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="alert alert-info">
                        <strong>لینک معرفی شما:</strong>
                        <div class="input-group mt-2">
                            <input type="text" class="form-control" value="{$tt_user_data.referral_link}" id="referralLink" readonly>
                            <div class="input-group-append">
                                <button class="btn btn-primary" onclick="copyReferralLink()">
                                    <i class="fas fa-copy"></i> کپی
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="alert alert-success">
                        <strong>کد معرفی شما:</strong>
                        <div class="h4 text-center mt-2">{$tt_user_data.referral_code}</div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card bg-primary text-white">
                        <div class="card-body text-center">
                            <h3>{$tt_referral_stats.total_referrals}</h3>
                            <p>تعداد کل زیرمجموعه‌ها</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white">
                        <div class="card-body text-center">
                            <h3>{$tt_referral_stats.total_commission|number_format} تومان</h3>
                            <p>کل پورسانت دریافتی</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center">
                            <h3>REF{$smarty.session.uid}</h3>
                            <p>کد QR معرفی</p>
                        </div>
                    </div>
                </div>
            </div>
            
            {if $tt_referral_stats.referrals}
            <div class="mt-4">
                <h6>لیست زیرمجموعه‌های شما:</h6>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>تاریخ عضویت</th>
                                <th>وضعیت</th>
                                <th>پورسانت</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $tt_referral_stats.referrals as $referral}
                            <tr>
                                <td>{$referral->created_at|date_format:"%Y/%m/%d"}</td>
                                <td>
                                    <span class="badge badge-{if $referral->status == 'active'}success{elseif $referral->status == 'paid'}primary{else}warning{/if}">
                                        {if $referral->status == 'active'}فعال{elseif $referral->status == 'paid'}پرداخت شده{else}در انتظار{/if}
                                    </span>
                                </td>
                                <td>{$referral->commission_amount|number_format} تومان</td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>

<script>
function copyReferralLink() {
    var copyText = document.getElementById("referralLink");
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    document.execCommand("copy");
    
    alert("لینک کپی شد!");
}
</script>
