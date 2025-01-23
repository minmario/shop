$(function () {
    $("#content").summernote({
        lang: "ko-KR",
        width: 750,
        height: 300,
        maxHeight: 400,
        minHeight: 200,

        callbacks: {
            onImageUpload: function (files, editor) {
                for (let i = 0; i < files.length; i++) {
                    // saveImg(files[i], editor);
                }
            }
        }
    });
});