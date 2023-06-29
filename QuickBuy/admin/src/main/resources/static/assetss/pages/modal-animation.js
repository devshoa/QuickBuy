$('.btn-animation').on('click', function (br) {
    //adding animation
    $('.modal.animation-modal .modal-dialog').attr('class', 'modal-dialog  ' + $(this).data("animation") + '  animated');
});