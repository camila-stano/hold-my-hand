const initEdit = () => {
  const button = document.querySelector(".btn-edit-about");
    button.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.insertAdjacentHTML = ('afterend', "<%= render 'shared/form_about' %>");
    });

  }

export { initEdit }