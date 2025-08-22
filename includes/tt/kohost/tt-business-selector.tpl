
<div class="tt-business-selector mb-4">
    <h5 class="text-center mb-3">نوع کسب‌وکار خود را انتخاب کنید</h5>
    <div class="row">
        {foreach $business_types as $key => $type}
        <div class="col-md-4 col-sm-6 mb-3">
            <div class="business-type-card" data-type="{$key}">
                <input type="radio" name="business_type" value="{$key}" id="business_{$key}" 
                       {if $smarty.post.business_type == $key || (!$smarty.post.business_type && $key == 'website')}checked{/if}>
                <label for="business_{$key}" class="card h-100 text-center p-3">
                    <div class="card-body">
                        <i class="fas fa-{if $key == 'website'}globe{elseif $key == 'advertising'}bullhorn{elseif $key == 'marketing'}chart-line{elseif $key == 'referral'}users{else}pen{/if} fa-2x mb-2 text-primary"></i>
                        <h6 class="card-title">{$type}</h6>
                    </div>
                </label>
            </div>
        </div>
        {/foreach}
    </div>
</div>

<style>
.business-type-card input[type="radio"] {
    display: none;
}

.business-type-card label {
    cursor: pointer;
    transition: all 0.3s ease;
    border: 2px solid #e9ecef;
}

.business-type-card input[type="radio"]:checked + label {
    border-color: var(--primary);
    background-color: var(--primary-light);
}

.business-type-card label:hover {
    border-color: var(--primary);
    transform: translateY(-2px);
}
</style>
