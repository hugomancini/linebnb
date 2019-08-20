const modalLogin = () => {
  document.querySelector(".login").addEventListener('click', event => {
    document.querySelector(".modal-login").style.display = "block";
    document.querySelector(".mybody").classList.add("dark");

    document.querySelector(".mybody").addEventListener('click', evento => {
      document.querySelector(".modal-login").style.display = "none";
      document.querySelector(".mybody").classList.toggle("dark");
    });
  });
}

export { modalLogin };
