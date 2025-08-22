
{include file="$template/header.tpl"}

<div class="container">
    <div class="row">
        <div class="col-md-12">
            {include file="$template/includes/tt/kohost/tt-page-header.tpl" title="سرویس اختصاصی" subtitle="استفاده از سرویس‌های ویژه"}
            
            <div class="card">
                <div class="card-body">
                    {if $smarty.get.type == 'website'}
                        {include file="$template/includes/tt/kohost/tt-custom-forms.tpl" service_type="website"}
                    {elseif $smarty.get.type == 'advertising'}
                        {include file="$template/includes/tt/kohost/tt-custom-forms.tpl" service_type="advertising"}
                    {else}
                        <div class="alert alert-warning">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            نوع سرویس انتخاب شده معتبر نیست.
                        </div>
                        <a href="clientarea.php" class="btn btn-primary">
                            <i class="fas fa-arrow-right me-2"></i>بازگشت به پنل کاربری
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
