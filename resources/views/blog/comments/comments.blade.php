<div class="col-md-12">
    <h5><span style="color:#31b0d5">{{ $comment['owner']['name'] }}</span>:</h5>
    <h5>{{ $comment['body'] }}</h5>

    @include('blog.comments.form',['parentId'=>$comment['id']])
    @if(isset($comments[$comment['id']]))
        @include('blog.comments.list',['collection'=>$comments[$comment['id']]])
    @endif
</div>