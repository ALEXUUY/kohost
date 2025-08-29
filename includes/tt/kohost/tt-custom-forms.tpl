
<div class="tt-custom-forms">
    {if $service_type == 'website'}
    <div class="card">
        <div class="card-header">
            <h5><i class="fas fa-globe me-2"></i>فرم درخواست ایجاد سایت</h5>
        </div>
        <div class="card-body">
            <form method="post" action="clientarea.php?action=tt_submit_form" enctype="multipart/form-data">
                <input type="hidden" name="form_type" value="website">
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>نوع سایت *</label>
                            <select name="website_type" class="form-control" required>
                                <option value="">انتخاب کنید</option>
                                <option value="corporate">شرکتی</option>
                                <option value="ecommerce">فروشگاهی</option>
                                <option value="blog">وبلاگ</option>
                                <option value="portfolio">نمونه کار</option>
                                <option value="news">خبری</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>نام سایت *</label>
                            <input type="text" name="website_name" class="form-control" required>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>توضیحات سایت *</label>
                    <textarea name="website_description" class="form-control" rows="4" required></textarea>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>قالب مورد نظر</label>
                            <select name="website_template" class="form-control">
                                <option value="">قالب پیش‌فرض</option>
                                <option value="modern">مدرن</option>
                                <option value="classic">کلاسیک</option>
                                <option value="minimal">مینیمال</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>آپلود لوگو</label>
                            <input type="file" name="website_logo" class="form-control" accept="image/*">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" name="accept_terms" class="form-check-input" required>
                        <label class="form-check-label">قوانین و مقررات را می‌پذیرم</label>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-paper-plane me-2"></i>ارسال درخواست
                </button>
            </form>
        </div>
    </div>
    
    {elseif $service_type == 'advertising'}
    <div class="card">
        <div class="card-header">
            <h5><i class="fas fa-bullhorn me-2"></i>فرم درخواست تبلیغات</h5>
        </div>
        <div class="card-body">
            <form method="post" action="clientarea.php?action=tt_submit_form" enctype="multipart/form-data">
                <input type="hidden" name="form_type" value="advertising">
                
                <div class="form-group">
                    <label>عنوان تبلیغ *</label>
                    <input type="text" name="ad_title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label>توضیحات تبلیغ *</label>
                    <textarea name="ad_description" class="form-control" rows="4" required></textarea>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>لینک هدف</label>
                            <input type="url" name="ad_link" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>نوع تبلیغ</label>
                            <select name="ad_type" class="form-control">
                                <option value="banner">بنر</option>
                                <option value="video">ویدیو</option>
                                <option value="text">متنی</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>آپلود فایل تبلیغ</label>
                    <input type="file" name="ad_file" class="form-control" accept="image/*,video/*">
                </div>
                
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-paper-plane me-2"></i>ارسال درخواست
                </button>
            </form>
        </div>
    </div>
    {/if}
</div>
