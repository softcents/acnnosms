@extends('layouts.admin.master')

@section('title')
    {{ __('Edit Testimonial') }}
@endsection

@section('main_content')
<div class="erp-table-section">
    <div class="container-fluid">
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="table-header">
                    <h4>{{__('Edit Testimonial') }}</h4>
                    <div>
                        <a href="{{ route('admin.testimonials.index') }}" class="theme-btn print-btn text-light">
                            <i class="fas fa-list me-1"></i>
                            {{ __("View List") }}
                        </a>
                    </div>
                </div>

                <div class="order-form-section">
                    {{-- form start --}}
                    <form action="{{ route('admin.testimonials.update',['testimonial'=>$testimonial]) }}" method="post" enctype="multipart/form-data" class="ajaxform_instant_reload">
                        @csrf
                        @method('put')

                        <div class="add-suplier-modal-wrapper">
                            <div class="row">
                                <div class="col-lg-6 mt-2">
                                    <label>{{('Satisfy About')}}</label>
                                    <input type="text" name="satisfy_about" required class="form-control" value="{{ $testimonial->satisfy_about }}" placeholder="{{ __('Enter Satisfy About') }}" >
                                </div>

                                <div class="col-sm-6 mt-2">
                                    <label>{{ __('Stars') }}</label>
                                    <div class="gpt-up-down-arrow position-relative">
                                        <select name="star" required="" class="form-control select-dropdown">
                                            <option @selected($testimonial->star == 1) value="1">{{ __('1') }}</option>
                                            <option @selected($testimonial->star == 2) value="2">{{ __('2') }}</option>
                                            <option @selected($testimonial->star == 3) value="3">{{ __('3') }}</option>
                                            <option @selected($testimonial->star == 4) value="4">{{ __('4') }}</option>
                                            <option @selected($testimonial->star == 5) value="5">{{ __('5') }}</option>
                                        </select>
                                        <span></span>
                                    </div>
                                </div>

                                <div class="col-lg-6 mt-2">
                                    <label>{{ __('Client Name') }}</label>
                                    <input type="text" name="client_name" required class="form-control" value="{{ $testimonial->client_name }}" placeholder="{{ __('Enter Client Name') }}">
                                </div>

                                <div class="col-lg-5 mt-2 align-self-center">
                                    <label>{{ __('Client Image') }}</label>
                                    <input type="file" name="client_image" class="form-control">
                                </div>

                                <div class="col-lg-1 mt-2 align-self-center mt-4">
                                    <img class="img-fluid table-img" src="{{ asset($testimonial->client_image) }}" alt="{{ $testimonial->client_name }} Image">
                                </div>

                                <div class="col-lg-12 mt-2">
                                    <label>{{ __('Review') }}</label>
                                    <textarea name="text" id="" class="form-control" placeholder="{{ __('Enter review message here') }}">{{ $testimonial->text }}</textarea>
                                </div>

                                <div class="col-lg-12">
                                    <div class="button-group text-center mt-5">
                                        <a href="" class="theme-btn border-btn m-2">{{__('Cancel')}}</a>
                                        <button class="theme-btn m-2 submit-btn">{{__('Update')}}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    {{-- form end --}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
