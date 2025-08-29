# Overview

Kohost is a Persian/RTL web hosting management system built on top of WHMCS (Web Host Manager Complete Solution). It provides an enhanced hosting provider interface with custom business type selection, referral systems, and specialized forms for different service types. The system focuses on providing a localized experience for Persian-speaking users with comprehensive RTL support and custom styling.

# Recent Changes

**August 29, 2025:**
- **Enhanced Authentication Pages**: Completely redesigned login and registration pages with modern business management theme
- **Business Type Selection**: Added 6 interactive business type cards (Website Creation, Advertising, Marketing, Referrals, Writing, E-commerce)
- **Full Responsive Design**: Implemented comprehensive responsive design optimized for mobile, tablet, and desktop screens
- **Persian RTL Optimization**: Enhanced Persian font support (Vazir, Tahoma, IRANSans) and improved RTL layout
- **Modern UI Components**: Added gradient backgrounds, interactive animations, hover effects, and professional styling
- **Mobile-First Design**: Optimized touch targets, typography scaling, and mobile-specific layouts with proper iOS support

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Frontend Architecture
- **Framework**: Built on Bootstrap 4.5.3 with extensive RTL customization
- **CSS Architecture**: Modular CSS structure with separate files for different components (theme, store, invoice, OAuth)
- **RTL Support**: Comprehensive right-to-left language support through custom CSS overrides (`tt-rtl-custom.css`, `bootstrap-rtl.min.css`)
- **Custom Styling**: Utilizes CSS custom properties (variables) for consistent theming with primary color scheme based on blue variants
- **Typography**: Uses Google Fonts (Open Sans, Rubik) with Persian font fallbacks (Vazir, Tahoma)

## Component Structure
- **Landing Pages**: Specialized landing page components for different services (SSL, SiteBuilder, CodeGuard, etc.)
- **Forms**: Custom form styling with enhanced input controls and validation feedback
- **Navigation**: Responsive navbar with offcanvas mobile menu and custom dropdown behaviors
- **Cards**: Business type selection cards with interactive hover and selection states
- **Modals**: Localization and notification modals with custom popover implementations

## JavaScript Architecture
- **jQuery-based**: Primary JavaScript framework using jQuery for DOM manipulation and AJAX interactions
- **Swiper Integration**: Modern touch slider framework for carousel components
- **Custom Scripts**: Includes custom functionality for:
  - Fixed navbar behavior on scroll
  - Menu hover effects
  - Smooth scrolling navigation
  - Password reveal functionality
  - Account notifications system
  - Offcanvas menu toggle

## Theme Integration
- **WHMCS Integration**: Built as a WHMCS theme with proper template structure
- **Responsive Design**: Mobile-first approach with breakpoint-specific styling
- **Dark Mode Support**: CSS variables configured for dark theme variant
- **Custom Components**: Enhanced UI components beyond standard WHMCS offerings

## Business Logic Features
- **Business Type Selection**: Custom onboarding flow for different business types (website creation, advertising, marketing, referrals, content writing)
- **Hybrid Service Model**: Combination of free and paid services with selective activation
- **Referral System**: Built-in affiliate/referral program with custom tracking and reporting
- **Service-Specific Forms**: Specialized forms for different service types with custom validation

# External Dependencies

## Core Framework
- **WHMCS**: Primary hosting management system platform
- **Bootstrap 4.5.3**: Frontend framework for responsive design and components
- **jQuery**: JavaScript library for DOM manipulation and AJAX functionality

## CSS Frameworks & Libraries
- **Bootstrap RTL**: Right-to-left language support extension
- **Swiper.js**: Modern slider/carousel component
- **Font Awesome**: Icon library for UI elements
- **Google Fonts API**: Typography service for Open Sans and Rubik fonts

## JavaScript Libraries
- **jQuery Easing**: Animation easing functions for smooth transitions
- **International Telephone Input**: Phone number input formatting and validation
- **Twitter Feed Integration**: Social media feed functionality

## Development Dependencies
- **CSS Preprocessing**: Uses CSS custom properties for theming
- **Minification**: Includes minified versions of CSS and JavaScript files for production
- **Asset Optimization**: Compressed and optimized static assets

## Hosting & Service Integration
- **WHMCS API**: Integration with WHMCS backend for billing and service management
- **Payment Gateways**: Integration through WHMCS payment system
- **Domain Registration**: Domain management through WHMCS providers
- **SSL Certificate Providers**: Integration with SSL certificate authorities
- **Website Builder Tools**: Integration with SiteBuilder and related services