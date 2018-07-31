@if(isset($collection) && !empty($collection))
    @foreach($collection as $comment)
        @include('blog.comments.comments',['comment'=>$comment])
    @endforeach
@endif
