const initHomeUser = () => {
  const iconLabel = document.getElementById("icon-label");
  const iconLabelBefore = document.getElementById('icon-label').innerText;

  document.querySelectorAll(".home-icon").forEach( (element) => {
    element.addEventListener("mouseover", (event) => {
      iconLabel.innerText = element.querySelector("h5").innerText
    })
    element.addEventListener("mouseleave", (event) => {
      iconLabel.innerText = iconLabelBefore
      
    })
  });


}

export { initHomeUser }