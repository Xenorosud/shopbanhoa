



//



// code chuyển loại trang 
function redirectToLoaiHang(maLoai) {
    window.location.href = 'TrangLoaiHoa.aspx?MaLoai=' + maLoai;
}



// chức năng sắp xếp 

$(document).ready(function () {
    $('#ddlSapXep').change(function () {
        var sortOrder = $(this).val();
        sortProducts(sortOrder);
    });

    function sortProducts(sortOrder) {
        var $products = $('.product-item');

        $products.sort(function (a, b) {
            var priceA = parseFloat($(a).find('.prices-prducts').text().replace(/[^\d.]/g, ''));
            var priceB = parseFloat($(b).find('.prices-prducts').text().replace(/[^\d.]/g, ''));
            if (sortOrder === 'ASC') {
                return priceA - priceB;
            } else {
                return priceB - priceA;
            }
        });

        $('.card_bodyss').html($products);
    }
});







//==============================

//============================== 
//======== chức năng tìm kiếm 
$(document).ready(function () {
    function searchProducts() {
        var keyword = $("#txtSearch").val();
        if (keyword != "") {
            // Chuyển hướng đến trang HienThiSP.aspx và truyền tham số keyword trong URL
            window.location.href = "HienThiSP.aspx?keyword=" + keyword;
        }
    }

    // Xử lý khi nhấn nút tìm kiếm
    $(".btn-search").click(function () {
        searchProducts();
    });

    // Xử lý khi nhấn phím "Enter"
    $(".form-alls-search").keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault(); // Ngăn chặn tải trang
            searchProducts();
        }
    });
});



//================ slider   
document.addEventListener("DOMContentLoaded", function () {
    var slides = document.querySelectorAll(".slide");
    var currentSlide = 0;
    var prevButton = document.querySelector(".prev");
    var nextButton = document.querySelector(".next");

    function showSlide(n) {
        slides.forEach(function (slide) {
            slide.classList.remove("active");
        });
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add("active");
    }

    function nextSlide() {
        showSlide(currentSlide + 1);
    }

    function prevSlide() {
        showSlide(currentSlide - 1);
    }

    nextButton.addEventListener("click", nextSlide);
    prevButton.addEventListener("click", prevSlide);

    showSlide(0); // Hiển thị slide đầu tiên ngay khi trang được tải

    setInterval(nextSlide, 2000);

    // Không load lại trang khi click nút điều hướng
    prevButton.type = "button";
    nextButton.type = "button";
});


//=================================
// slider chuyển động sản phẩm 





$(document).ready(function () {
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: true,
        centerMode: true,
        focusOnSelect: true
    });
    $('.additional-slider').slick();


    $('.pres').on('click', function (e) { // khai báo biến e đẩy vào sự kiện ngăn chặn tải trang khi click nút pre và next -----
        e.preventDefault();
        $('.additional-slider').slick('slickPrev');
    });
    $('.nexts').on('click', function (e) {
        e.preventDefault();
        $('.additional-slider').slick('slickNext');
    });

    // Chuyển động slider sang trái mỗi 3 giây =================================
    setInterval(function () {
        $('.additional-slider').slick('slickNext');
    }, 2000);
});



//================================

