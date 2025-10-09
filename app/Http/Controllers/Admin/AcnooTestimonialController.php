<?php

namespace App\Http\Controllers\Admin;

use App\Models\Testimonial;
use App\Helpers\HasUploader;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class AcnooTestimonialController extends Controller
{
    use HasUploader;

    public function __construct()
    {
        $this->middleware('permission:testimonials-read')->only('index');
        $this->middleware('permission:testimonials-create')->only('create', 'store');
        $this->middleware('permission:testimonials-update')->only('edit', 'update','status');
        $this->middleware('permission:testimonials-delete')->only('destroy','deleteAll');
    }

    public function index(Request $request)
    {
        $testimonials = Testimonial::when($request->has('search'), function ($q) use ($request) {
            $q->where(function ($query) use ($request) {
                $query->where('satisfy_about', 'like', '%' . $request->search . '%')
                    ->orWhere('text', 'like', '%' . $request->search . '%')
                    ->orWhere('client_name', 'like', '%' . $request->search . '%');
            });
        })
            ->latest();

        if ($request->ajax()) {
            $testimonials = $testimonials->get();

            return response()->json([
                'data' => view('admin.testimonials.datas', compact('testimonials'))->render()
            ]);
        }

        $testimonials = $testimonials->paginate(10);
        return view('admin.testimonials.index', compact('testimonials'));
    }

    public function create()
    {
        return view('admin.testimonials.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'satisfy_about' => 'nullable',
            'text' => 'nullable',
            'star' => 'nullable',
            'client_name' => 'required|string',
            'client_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        Testimonial::create($request->except('client_image') + [
            'client_image' => $request->client_image ? $this->upload($request, 'client_image') : NULL
        ]);

        return response()->json([
            'message' => __('Testimonial created successfully'),
            'redirect' => route('admin.testimonials.index')
        ]);
    }

    public function edit(Testimonial $testimonial)
    {
        return view('admin.testimonials.edit', compact('testimonial'));
    }

    public function update(Request $request, Testimonial $testimonial)
    {
        $request->validate([
            'satisfy_about' => 'required|string',
            'text' => 'nullable|string',
            'star' => 'nullable|integer',
            'client_name' => 'required|string',
            'client_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $testimonial->update($request->except('client_image') + [
            'client_image' => $request->client_image ? $this->upload($request, 'client_image', $testimonial->client_image) : $testimonial->client_image,
        ]);

        return response()->json([
            'message' => __('Testimonial updated successfully'),
            'redirect' => route('admin.testimonials.index')
        ]);
    }

    public function destroy(Testimonial $testimonial)
    {
        if (file_exists($testimonial->client_image)) {
            Storage::delete($testimonial->client_image);
        }
        $testimonial->delete();

        return response()->json([
            'message'   => __('Testimonial Deleted successfully'),
            'redirect'  => route('admin.testimonials.index')
        ]);
    }

    public function deleteAll(Request $request)
    {
        $testimonials = Testimonial::whereIn('id', $request->ids)->get();
        foreach ($testimonials as $testimonial) {
            if (file_exists($testimonial->client_image)) {
                Storage::delete($testimonial->client_image);
            }
        }

        $testimonials->each->delete();

        return response()->json([
            'message' => __('Testimonials deleted successfully'),
            'redirect' => route('admin.testimonials.index')
        ]);
    }
}
