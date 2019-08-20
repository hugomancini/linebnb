const modalLogin = () => {
  if(document.querySelector(".login")) {
      document.querySelector(".login").addEventListener('click', event => {
      document.querySelector(".modal-login").style.display = "block";
      document.querySelector(".mybody").classList.add("dark");

      document.querySelector(".mybody").addEventListener('click', evento => {
        document.querySelector(".modal-login").style.display = "none";
        document.querySelector(".mybody").classList.remove("dark");
      });
    });
  };
}
const modalSignin = () => {
  if(document.querySelector('.signin')) {
      document.querySelector(".signin").addEventListener('click', event => {
      document.querySelector(".modal-signin").style.display = "block";
      document.querySelector(".mybody").classList.add("dark");

      document.querySelector(".mybody").addEventListener('click', evento => {
        document.querySelector(".modal-signin").style.display = "none";
        document.querySelector(".mybody").classList.remove("dark");
      });
    });
  };
}



export { modalLogin, modalSignin };
