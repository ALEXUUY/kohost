
<div class="tt-services-grid">
    <div class="row">
        {foreach $tt_services as $service}
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card service-card {if !$service->is_free && !$service->user_has_access}locked{/if}">
                <div class="card-body text-center">
                    <div class="service-icon mb-3">
                        <i class="fas fa-{if $service->service_type == 'website'}globe{elseif $service->service_type == 'hosting'}server{elseif $service->service_type == 'domain'}link{else}cog{/if} fa-2x text-primary"></i>
                        {if !$service->is_free && !$service->user_has_access}
                        <div class="lock-overlay">
                            <i class="fas fa-lock fa-lg text-warning"></i>
                        </div>
                        {/if}
                    </div>
                    
                    <h5 class="card-title">{$service->service_name}</h5>
                    <p class="card-text text-muted">{$service->description}</p>
                    
                    <div class="service-price mb-3">
                        {if $service->is_free}
                        <span class="badge badge-success">رایگان</span>
                        {else}
                        <span class="h5 text-primary">{$service->price|number_format} تومان</span>
                        {/if}
                    </div>
                    
                    <div class="service-actions">
                        {if $service->is_free || $service->user_has_access}
                        <a href="clientarea.php?action=tt_service&type={$service->service_type}" class="btn btn-primary">
                            <i class="fas fa-play me-2"></i>استفاده
                        </a>
                        {else}
                        <button class="btn btn-warning" onclick="unlockService('{$service->id}')">
                            <i class="fas fa-unlock me-2"></i>خرید و فعال‌سازی
                        </button>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        {/foreach}
    </div>
</div>

<style>
.service-card {
    transition: all 0.3s ease;
    border: 2px solid #e9ecef;
}

.service-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.service-card.locked {
    opacity: 0.7;
    position: relative;
}

.service-card.locked .card-body {
    position: relative;
}

.lock-overlay {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 10;
}

.service-icon {
    position: relative;
}
</style>

<script>
function unlockService(serviceId) {
    if (confirm('آیا می‌خواهید این سرویس را خریداری کنید؟')) {
        window.location.href = 'cart.php?a=add&pid=' + serviceId;
    }
}
</script>
