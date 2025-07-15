//nút xem thêm
function toggleContent() {
    var moreContent = document.querySelector('.more-content');
    var showMoreBtn = document.querySelector('.show-more-btn');
    if (moreContent.style.display === 'none') {
        moreContent.style.display = 'inline';
        showMoreBtn.textContent = 'Thu gọn';
    } else {
        moreContent.style.display = 'none';
        showMoreBtn.textContent = 'Xem thêm';
    }
}
document.querySelector('.search-btn').addEventListener('click', function () {
	this.parentElement.classList.toggle('open')
	this.previousElementSibling.focus()
})
const listImage = document.querySelector('.slider-content-left-top')
const imgs = document.getElementsByClassName(".imgs")
const btnLeft = document.querySelector('.btn-left')
const btnRight = document.querySelector('.btn-right')
const length = imgs.length
let current = 0

const handleChangeSlide = () => {
    if (current == length - 1) {
        current = 0
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(0px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')

    } else {
        current ++
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    }
}

let handleEventChangeSlide = setInterval(handleChangeSlide, 4000)

btnRight.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide)
    handleChangeSlide()
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000)
})

btnLeft.addEventListener('click', () => {
    clearInterval(handleEventChangeSlide)
    if (current == 0) {
        current = length - 1
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    } else {
        current --
        let width = imgs[0].offsetWidth
        listImage.style.transform = `translateX(${width * -1 * current}px)`
        document.querySelector('.active').classList.remove('active')
        document.querySelector('.index-item-'+ current).classList.add('active')
    }
    handleEventChangeSlide = setInterval(handleChangeSlide, 4000)
})

var colorsList = document.querySelectorAll(".d-lg-flex>img");
for(var i = 0; i < colorsList.length; i++){
colorsList[i].onmouseover = function(){
//alert(this.src);
var mainImg = document.querySelector(".mainImg");
mainImg.src = this.src;
}
}

