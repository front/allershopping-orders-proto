(function($){
  $.fn.openEditForm = function() {
    // Close any other open form.
    $(this).closest('table').find('tr.edit-form').addClass('hide');
    $form = $(this).closest('tr').next();
    $form.removeClass('hide');
  }

  $.fn.closeEditForm = function() {
    $form = $(this).closest('tr');
    $form.addClass('hide');
  }
})(jQuery);