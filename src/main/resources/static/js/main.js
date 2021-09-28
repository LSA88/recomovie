//new Swiper(선택자, 옵션)

new Swiper('.img_box .swiper-container', {
  slidesPerView: 5, // 한번에 보여줄 슬라이드 개수
  spaceBetween: 15,
  centeredSlides: true, // 1번 슬라이드가 가운데 보이기
  loop: true,
  autoplay: {
    delay: 5000 
},
pagination: {
  el: '.mainwindow .swiper-pagination', // 페이지 번호 요소 선택자
  clickable: true // 사용자 페이지 번호 요소 제어 기능
},
navigation: {
  prevEl: '.mainwindow .swiper-prev',
  nextEl: '.mainwindow .swiper-next'
}
});