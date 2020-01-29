document.addEventListener('turbolinks:before-cache', function(){
  $('#myTable').DataTable().destroy();
})

document.addEventListener('turbolinks:load', function(){
  $('#myTable').DataTable();
})
