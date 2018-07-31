@include('admin.partials.errors')
@include('admin.partials.success')
<form action="{{ route('blog/comments',$post->id) }}" accept-charset="utf-8" role="form" method="post">
    {{ csrf_field() }}

    @if(isset($parentId))
        <input type="hidden" name="parent_id" value="{{ $parentId }}">
    @endif

    <div class="form-group hidden">
        <label for="body" class="control-label">Info:</label>
        <textarea name="body" id="body" class="form-control" required="required"></textarea>
    </div>
    <button type="submit" class="btn btn-success" onclick="var bools = $(this).prev().hasClass('hidden') ? 1 : 0;$(this).prev().removeClass('hidden');if(bools){return false;}">回复</button>
</form>