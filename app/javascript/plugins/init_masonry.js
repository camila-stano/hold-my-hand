const initMasonry = () => {

  var grid = document.querySelector('.grid');
  if (grid) {
    var msnry = new Masonry( '.grid', {
      // options...
      itemSelector: '.grid-item'
      // columnWidth: 
    });
  }
  // // init with selector
  // var msnry = new Masonry( '.grid', {
  //   // options...
  // });
}

export { initMasonry }