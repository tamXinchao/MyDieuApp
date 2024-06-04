$('a.load-content').click(function () {
    // Call ajax load form to page
    var page = $(this).attr('href');
    $.ajax({
        type: 'GET',
        url: page,
        data: {},
        success: function (data) {
            $('#content').html(data);
        }
    });

    return false;
})
var color = 1;
// Add question on create page
function addQuestion() {
    color++;
    $('#question-block').append(`
    <hr>
    <div class="form-group row mx-0 d-flex justify-content-end">
        <div class="col-10">
            <input type="text" class="form-control w-75 color" name="color${color}" placeholder="Enter color ${color}">
        </div>
    </div>
    <div class="form-group row mx-0 d-flex justify-content-end">
        <div class="col-10">
            <input type="text" class="form-control w-75 color" name="hex${color}" placeholder="Enter color code ${color}">
        </div>
    </div>
    <div class="form-group row mx-0 d-flex justify-content-end">
        <div class="col-10">
            <div class="input-group col-6 px-0">
                <input type="text" class="form-control col-10 image" name="image${color}_1" id="image${color}_1" placeholder="Enter image 1">
            </div>
            <label id="image-error" class="error" style="display: none;" for="image${color}_1"></label>
        </div>
    </div>
`);
    $("#productForm").validate();
    $(".color").each(function () {
        $(this).rules("add", {
            required: true,
            messages: {
                required: "Please enter a " + $(this).attr('name') + "!"
            }
        });
    });
    $(".image").each(function () {
        $(this).rules("add", {
            required: true,
            messages: {
                required: "Please enter a " + $(this).attr('name') + "!",
            }
        });
    });
}
