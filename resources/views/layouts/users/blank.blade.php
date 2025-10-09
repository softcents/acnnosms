<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="{{__('IE=edge')}}">
    <meta name="viewport" content="{{__('width=device-width, initial-scale=1.0')}}">
    <title>@hasSection('title') @yield('title') | @endif {{ get_option('general')['title'] ?? config('app.name') }}</title>
    @include('layouts.users.partials.css')
</head>
<body>
@yield('main_content')

@include('layouts.users.partials.script')

</body>
</html>
