
<?php
/**
 * TT Kohost Addon - Advanced Features for WHMCS
 * Copyright (c) 2024 ThemeTags
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

// Hook for creating additional database tables
add_hook('AfterModuleCreate', 1, function($vars) {
    tt_kohost_create_tables();
});

// Hook for user registration to show business type selection
add_hook('ClientAreaPageRegister', 1, function($vars) {
    if ($_POST['submit']) {
        $business_type = $_POST['business_type'] ?? 'website';
        $referral_code = $_POST['referral_code'] ?? '';
        
        // Store business type and referral info
        tt_kohost_store_user_data($vars['clientid'], $business_type, $referral_code);
    }
    
    return array(
        'business_types' => tt_kohost_get_business_types(),
        'referral_code' => $_GET['ref'] ?? ''
    );
});

// Hook for client area home page
add_hook('ClientAreaPage', 1, function($vars) {
    if ($vars['templatefile'] == 'clientareahome') {
        $client_id = $_SESSION['uid'];
        
        return array(
            'tt_user_data' => tt_kohost_get_user_data($client_id),
            'tt_referral_stats' => tt_kohost_get_referral_stats($client_id),
            'tt_notifications' => tt_kohost_get_notifications($client_id),
            'tt_services' => tt_kohost_get_available_services($client_id)
        );
    }
});

// Create database tables
function tt_kohost_create_tables() {
    $pdo = Capsule::connection()->getPdo();
    
    // Business types table
    $pdo->exec("CREATE TABLE IF NOT EXISTS tt_user_business (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        business_type VARCHAR(50) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES tblclients(id) ON DELETE CASCADE
    )");
    
    // Referral system table
    $pdo->exec("CREATE TABLE IF NOT EXISTS tt_referrals (
        id INT AUTO_INCREMENT PRIMARY KEY,
        referrer_id INT NOT NULL,
        referred_id INT NOT NULL,
        commission_amount DECIMAL(10,2) DEFAULT 0,
        status ENUM('pending', 'active', 'paid') DEFAULT 'pending',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (referrer_id) REFERENCES tblclients(id) ON DELETE CASCADE,
        FOREIGN KEY (referred_id) REFERENCES tblclients(id) ON DELETE CASCADE
    )");
    
    // Custom forms table
    $pdo->exec("CREATE TABLE IF NOT EXISTS tt_custom_forms (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        form_type VARCHAR(50) NOT NULL,
        form_data TEXT NOT NULL,
        status ENUM('pending', 'processing', 'completed') DEFAULT 'pending',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES tblclients(id) ON DELETE CASCADE
    )");
    
    // Notifications table
    $pdo->exec("CREATE TABLE IF NOT EXISTS tt_notifications (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        title VARCHAR(255) NOT NULL,
        message TEXT NOT NULL,
        type VARCHAR(50) DEFAULT 'info',
        is_read TINYINT DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES tblclients(id) ON DELETE CASCADE
    )");
    
    // Services pricing table
    $pdo->exec("CREATE TABLE IF NOT EXISTS tt_services_pricing (
        id INT AUTO_INCREMENT PRIMARY KEY,
        service_name VARCHAR(100) NOT NULL,
        service_type VARCHAR(50) NOT NULL,
        price DECIMAL(10,2) NOT NULL,
        is_free TINYINT DEFAULT 0,
        business_types TEXT,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )");
}

// Helper functions
function tt_kohost_get_business_types() {
    return [
        'website' => 'ایجاد سایت',
        'advertising' => 'تبلیغات',
        'marketing' => 'بازاریابی',
        'referral' => 'زیرمجموعه‌گیری',
        'writing' => 'نویسندگی',
        'ecommerce' => 'فروشگاه آنلاین'
    ];
}

function tt_kohost_store_user_data($user_id, $business_type, $referral_code) {
    if (!$user_id) return;
    
    // Store business type
    Capsule::table('tt_user_business')->insert([
        'user_id' => $user_id,
        'business_type' => $business_type
    ]);
    
    // Handle referral
    if ($referral_code) {
        $referrer = Capsule::table('tblclients')->where('id', $referral_code)->first();
        if ($referrer) {
            Capsule::table('tt_referrals')->insert([
                'referrer_id' => $referrer->id,
                'referred_id' => $user_id
            ]);
        }
    }
    
    // Generate referral code for new user
    tt_kohost_generate_referral_code($user_id);
}

function tt_kohost_generate_referral_code($user_id) {
    // Update user with referral code (using user ID as simple referral code)
    Capsule::table('tblclients')->where('id', $user_id)->update([
        'notes' => 'Referral Code: REF' . $user_id
    ]);
}

function tt_kohost_get_user_data($user_id) {
    $business = Capsule::table('tt_user_business')->where('user_id', $user_id)->first();
    $user = Capsule::table('tblclients')->where('id', $user_id)->first();
    
    return [
        'business_type' => $business ? $business->business_type : null,
        'referral_code' => 'REF' . $user_id,
        'referral_link' => $_SERVER['HTTP_HOST'] . '/register.php?ref=' . $user_id
    ];
}

function tt_kohost_get_referral_stats($user_id) {
    $referrals = Capsule::table('tt_referrals')->where('referrer_id', $user_id)->get();
    $total_commission = Capsule::table('tt_referrals')->where('referrer_id', $user_id)->sum('commission_amount');
    
    return [
        'total_referrals' => count($referrals),
        'total_commission' => $total_commission,
        'referrals' => $referrals
    ];
}

function tt_kohost_get_notifications($user_id) {
    return Capsule::table('tt_notifications')
        ->where('user_id', $user_id)
        ->where('is_read', 0)
        ->orderBy('created_at', 'desc')
        ->limit(5)
        ->get();
}

function tt_kohost_get_available_services($user_id) {
    $user_business = Capsule::table('tt_user_business')->where('user_id', $user_id)->first();
    $business_type = $user_business ? $user_business->business_type : 'website';
    
    return Capsule::table('tt_services_pricing')
        ->where('business_types', 'LIKE', '%' . $business_type . '%')
        ->orWhere('business_types', 'all')
        ->get();
}
?>
