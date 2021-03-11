const initEdit = () => {
  const button = document.querySelector(".btn-edit-about");
  if (button){
      button.addEventListener("click", (event) => {

        var x = document.getElementById("myDIV");
        x.style.display = "block";
        var y = document.querySelector(".content-about");
        y.style.display = "none";
        var z = document.querySelector(".btn-edit-about");
        z.style.display = "none";

        // var x = document.getElementById("myDIV");
        // if (x.style.display === "none") {
        //   x.style.display = "block";
        // } else {
        //   x.style.display = "none";
        // }  

        // var button = document.getElementById("myDIV");
        // if (button.style.display === "none") {
        //   button.style.display = "block";
        // } else {
        //   button.style.display = "none";
        // }  

        // var y = document.querySelector(".content-about");
        // if (y.style.display === "none") {
        //   y.style.display = "block";
        // } else {
        //   y.style.display = "none";
        // }  

      });
    }
  }

export { initEdit }