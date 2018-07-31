<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="{{ $meta_description }}">
        <meta name="author" content="{{ config('blog.author') }}">
        <title>{{ $title or config('blog.title') }}</title>
        <link rel="alternate" href="{{ url('rss') }}" type="application/rss+xml" title="RSS Feed {{ config('blog.title') }}">
        {{-- styles --}}
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link  rel="stylesheet" type="text/css" href="{{ asset('css/font-awesome.css') }}">
        <link  rel="stylesheet" type="text/css" href="{{ asset('css/clean-blog.css') }}?{{ time() }}">
        <link  rel="stylesheet" type="text/css" href="{{ asset('css/font-awesome-open-san.css') }}">
        @yield('styles')

        {{-- html5 shim and respond.js for ie8 support --}}
        <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="//oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        @include('blog.partials.page-nav')

        @yield('page-header')
        @yield('content')

        @if(isset($comments) && !empty($comments))
            @include('blog.comments.list',['collection'=>isset($comments['root']) ? $comments['root'] : ''])
            <div class="col-md-12">
                <h3>留下您的评论</h3>
                @include('blog.comments.form',['parentId'=>$post->id])
            </div>
        @endif
        @include('blog.partials.page-footer')

        {{-- scripts --}}
        <script src="{{ asset('js/less.min.js') }}"></script>
        <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
        <script src="{{ asset('js/jquery-ui.min.js') }}"></script>
        <script src="{{ asset('js/blog.js') }}"></script>
        @yield('script')
    </body>
</html>
