@foreach ($comments as $comment)
    <tr>
        <td class="checkbox text-start">
            <input type="checkbox" name="ids[]" class="checkbox-item" value="{{ $comment->id }}" data-url="{{ route('admin.comments.delete-all') }}">
        </td>
        <td>
            {{ $loop->index + 1 }}
        </td>
        <td>{{ $comment->name }}</td>
        <td>{{ $comment->email }}</td>
        <td>{{  Str::limit($comment->comment, 20, '...') }}</td>
        <td class="print-d-none">
            <div class="dropdown table-action">
                <button type="button" data-bs-toggle="dropdown">
                    <i class="far fa-ellipsis-v"></i>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="{{ route('admin.comments.destroy',$comment->id) }}" class="confirm-action"
                            data-method="DELETE">
                            <i class="fal fa-trash-alt"></i>
                            {{ __('Delete') }}
                        </a>
                    </li>
                </ul>
            </div>
        </td>
    </tr>
@endforeach
