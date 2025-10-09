<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\Comment;
use Illuminate\Http\Request;

class AcnooBlogController extends Controller
{
    public function index()
    {
        $page_data = get_option('manage-pages');
        $recent_blogs = Blog::with('user:id,name')->whereStatus(1)->latest()->get();
        $blogs = Blog::with('user:id,name')->latest()->get();

        return view('web.blog.index', compact('recent_blogs', 'blogs', 'page_data'));
    }

    public function show(string $slug)
    {
        $page_data = get_option('manage-pages');
        $blog = Blog::where('slug', $slug)->firstOrFail();
        $recent_blogs = Blog::with('user:id,name')->select('id', 'title', 'slug', 'image', 'user_id', 'created_at', 'updated_at')->whereStatus(1)->latest()->limit(3)->get();
        $comments = Comment::with('blog:id')->whereStatus(1)->where('blog_id', $blog->id)->latest()->limit(3)->get();
        return view('web.blog.show', compact('recent_blogs', 'blog', 'page_data', 'comments'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'comment' => 'required|string|max:255',
        ]);

        Comment::create($request->except('blog_id') + [
            'blog_id' => $request->blog_id,
        ]);

        return response()->json([
            'message'   => __('Your Comment Submitted successfully'),
            'redirect'  => route('blogs.show', $request->blog_slug)
        ]);
    }
}
