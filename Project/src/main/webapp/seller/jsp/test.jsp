<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <title>Summernote 테스트</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
</head>
<body>
<textarea id="content"></textarea>

<script>
    $(document).ready(function() {
        $('#content').summernote({
            lang: 'ko-KR',
            height: 300
        });
    });
</script>
</body>
</html>