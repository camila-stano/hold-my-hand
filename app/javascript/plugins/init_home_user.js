const initHomeUser = () => {
  const iconLabel = document.getElementById("icon-label")

  document.querySelectorAll(".home-icon").forEach( (element) => {
    element.addEventListener("mouseover", (event) => {
      iconLabel.innerText = element.querySelector("h5").innerText
    })
    element.addEventListener("mouseleave", (event) => {
      iconLabel.innerText = "SELECT OPTION"
    })
  });


}

export { initHomeUser }