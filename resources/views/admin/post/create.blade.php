@extends('admin.layout')

@section('styles')
    <link rel="stylesheet" href="{{ asset('pickadate/themes/default.css') }}">
    <link rel="stylesheet" href="{{ asset('pickadate/themes/default.date.css') }}">
    <link rel="stylesheet" href="{{ asset('pickadate/themes/default.time.css') }}">
    <link rel="stylesheet/less" type="text/css" href="{{ asset('selectize/less/selectize.less') }}">
    <link rel="stylesheet/less" type="text/css" href="{{ asset('selectize/less/selectize.default.less') }}">
@stop

@section('content')
    <div class="container-fluid">
        <div class="row page-title-row">
            <div class="col-md-12">
                <h3>Posts <small>» Add New Post</small></h3>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">New Post Form</h3>
                    </div>
                    <div class="panel-body">
                        @include('admin.partials.errors')
                        <form action="{{ route('admin.post.store') }}" class="form-horizontal" role="form" method="POST">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            @include('admin.post._form')
                            <div class="col-md-8">
                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-2">
                                        <button type="submit" class="btn btn-primary btn-lg">
                                            <i class="fa fa-disk-o"></i>
                                            Save New Post
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('scripts')
    <script src="{{ asset('js/less.min.js') }}"></script>
    <script src="{{ asset('js/microevent.js') }}"></script>
    <script src="{{ asset('js/microplugin.js') }}"></script>
    <script src="{{ asset('pickadate/picker.js') }}"></script>
    <script src="{{ asset('pickadate/picker.date.js') }}"></script>
    <script src="{{ asset('pickadate/picker.time.js') }}"></script>
    <script src="{{ asset('selectize/selectize.js?time()') }}"></script>
    <script>
        $(function(){
            $("#publish_date").pickadate({
                format:'yyyy-mm-dd'
            });
            $('#publish_time').pickatime({
                format:'HH:i A'
            });
            $('#tags').selectize({
                create:true
            });
        })
    </script>
@stop