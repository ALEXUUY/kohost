
<div class="tt-notifications">
    {if $tt_notifications}
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        <strong><i class="fas fa-bell me-2"></i>اعلان‌های جدید:</strong>
        <button type="button" class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
        <div class="mt-2">
            {foreach $tt_notifications as $notification}
            <div class="notification-item border-bottom py-2">
                <div class="d-flex justify-content-between">
                    <div>
                        <strong>{$notification->title}</strong>
                        <p class="mb-0 text-muted small">{$notification->message}</p>
                    </div>
                    <small class="text-muted">{$notification->created_at|date_format:"%H:%M"}</small>
                </div>
            </div>
            {/foreach}
        </div>
        <div class="mt-2">
            <a href="clientarea.php?action=tt_notifications" class="btn btn-sm btn-outline-primary">
                مشاهده همه اعلان‌ها
            </a>
        </div>
    </div>
    {/if}
</div>
