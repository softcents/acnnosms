<?php

use App\Models\Gateway;
use App\Http\Controllers as Web;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

require __DIR__.'/auth.php';

Route::get('/', [Web\WebController::class, 'index'])->name('home.index');
Route::post('/newsletter', [WEB\WebController::class, 'newsletter'])->name('home.newsletter');

Route::get('/about-us', [Web\AcnooAboutController::class, 'index'])->name('about.index');
Route::resource('blogs', Web\AcnooBlogController::class)->only('index', 'show', 'store');

Route::get('/contact-us', [Web\AcnooContactController::class, 'index'])->name('contact.index');
Route::post('/contact/store', [Web\AcnooContactController::class, 'store'])->name('contact.store');
Route::get('/term/services', [Web\AcnooServiceController::class, 'index'])->name('services.index');
Route::get('/services/{id}', [Web\AcnooServiceController::class, 'show'])->name('services.show');

Route::get('/privacy', [Web\AcnooPolicyController::class, 'privacy'])->name('privacy.index');

Route::get('/refund', [Web\AcnooPolicyController::class, 'refund'])->name('refund.index');

// Payment Routes
Route::group(['middleware' => ['auth']], function () {
    Route::get('/payments-gateways', [Web\PaymentController::class, 'index'])->name('payments-gateways.index');
    Route::post('/payments/{plan_id}/{gateway_id}', [Web\PaymentController::class, 'payment'])->name('payments-gateways.payment');
    Route::get('/payment/success', [Web\PaymentController::class, 'success'])->name('payment.success');
    Route::get('/payment/failed', [Web\PaymentController::class, 'failed'])->name('payment.failed');
    Route::post('ssl-commerz/payment/success', [Web\PaymentController::class, 'sslCommerzSuccess']);
    Route::post('ssl-commerz/payment/failed', [Web\PaymentController::class, 'sslCommerzFailed']);
});

Route::get('/clear-all', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    return back()->with('success', __('Cache has been cleared.'));
});

Route::get('/update', function () {
    if (!Gateway::where('name', 'Tap Payment')->exists()) {
        Artisan::call('db:seed', ['--class' => 'OthersCurrenciesSeeder']);
        Artisan::call('db:seed', ['--class' => 'TapPaymentSeeder']);
    }

    Artisan::call('migrate');
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');

    return redirect('/')->with('message', __('System updated successfully.'));
});
