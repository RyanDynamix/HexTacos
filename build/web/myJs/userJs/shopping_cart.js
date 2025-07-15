// //calculate money amount
document.querySelectorAll(".product").forEach(product => {
    const soLuongInput = product.querySelector(".soLuong");
    const thanhTienSpan = product.querySelector(".thanhTien");
    const giaText = product.querySelector(".gia").textContent;
    const gia = parseFloat(giaText.replace(/\./g, '').replace('đ', ''));

    const updateThanhTien = () => {
        const soLuong = parseInt(soLuongInput.value);
        const thanhTien = gia * soLuong;
        const formattedThanhTien = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(thanhTien);
        thanhTienSpan.textContent = formattedThanhTien;
    };

    // Initialize thanhTien when page loads
    updateThanhTien();

    // Update thanhTien on input change
    soLuongInput.addEventListener("input", updateThanhTien);
});



//calculate total money amount
const giamGiaInput = document.getElementById("giamGia");
const phiVanChuyenInput = document.getElementById("phiVanChuyen");

giamGiaInput.addEventListener("input", updateTongTien);
phiVanChuyenInput.addEventListener("input", updateTongTien);

function updateTongTien() {
    let tongTienHang = 0;

    document.querySelectorAll(".product").forEach(product => {
        const thanhTienText = product.querySelector(".thanhTien").textContent;
        const thanhTien = parseFloat(thanhTienText.replace(/\./g, '').replace('đ', ''));
        tongTienHang += thanhTien;
    });

    const giamGia = parseFloat(giamGiaInput.value) / 100;
    const phiVanChuyen = parseFloat(phiVanChuyenInput.value);
    const thue = tongTienHang * 0.10;
    const tongTienSauGiamGia = tongTienHang * (1 - giamGia);
    const tongCong = tongTienSauGiamGia + thue + phiVanChuyen;

    document.getElementById("tongTienHang").textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(tongTienHang);
//    document.getElementById("thue").textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(thue);
    document.getElementById("tongCong").textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(tongTienHang);
//    document.getElementById("tongCong").textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(tongCong);
}

// Initialize tongTien when page loads
updateTongTien();
//btn go to top
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}