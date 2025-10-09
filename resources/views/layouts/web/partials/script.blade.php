<script src="{{ asset('web/js/jquery.min.js') }}"></script>
<script src="{{ asset('web/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('web/js/swiper-bundle.min.js') }}"></script>
<script src="{{ asset('web/js/lity.min.js') }}"></script>
<script src="{{ asset('web/js/theme.js') }}"></script>
<script src="{{ asset('web/js/custom.js') }}"></script>
<script src="{{ asset('assets/plugins/custom/notification.js') }}"></script>
<script src="{{ asset('assets/plugins/validation-setup/validation-setup.js') }}"></script>
<script src="{{ asset('assets/js/toastr.min.js') }}"></script>
<script src="{{ asset('assets/plugins/jquery-confirm/jquery-confirm.min.js')}}"></script>
<script src="{{ asset('assets/plugins/jquery-validation/jquery.validate.min.js') }}"></script>
<script src="{{ asset('assets/plugins/custom/form.js') }}"></script>
<script src="{{ asset('assets/js/custom-ajax.js') }}"></script>
<script src="{{ asset('assets/js/type.js') }}"></script>


@stack('js')


@if(Session::has('message'))
    <script>
        toastr.success( "{{ Session::get('message') }}");
    </script>
@endif

@if(Session::has('error'))
    <script>
        toastr.error( "{{ Session::get('error') }}");
    </script>
@endif

@if(Session::has('error'))
    <script>
        toastr.error( "{{ Session::get('error') }}");
    </script>
@endif
