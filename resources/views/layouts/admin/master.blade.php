<!DOCTYPE html>
@if (app()->getLocale() == 'ar')
<html lang="ar" dir="rtl">
@else
<html lang="en" dir="auto">
@endif
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="{{__('IE=edge')}}">
    <meta name="viewport" content="{{__('width=device-width, initial-scale=1.0')}}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@hasSection('title') @yield('title') | @endif {{ get_option('general')['title'] ?? config('app.name') }}</title>
    @include('layouts.admin.partials.css')
</head>
<body>

<!-- Side Bar Start -->
@include('layouts.admin.partials.side-bar')
<!-- Side Bar End -->
<div class="section-container">
    <!-- header start -->
    @include('layouts.admin.partials.header')
    <!-- header end -->
    <!-- erp-state-overview-section start -->
    @yield('main_content')
    <!-- erp-state-overview-section end -->
    <!-- footer start -->
    @include('layouts.admin.partials.footer')
    <!-- footer end -->
    @stack('modal')
</div>

@include('layouts.admin.partials.script')
</body>
</html>
