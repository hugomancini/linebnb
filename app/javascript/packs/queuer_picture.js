const queuerPicture = () => {
  document.querySelectorAll(".queuer-picture-animation").forEach((picture) => {
    picture.addEventListener("mouseover", event => {
      picture.style.filter = "brightness(50%)";
      picture.nextElementSibling.firstElementChild.style.display = "block";
      picture.nextElementSibling.nextElementSibling.firstElementChild.style.display = "block";
    });
  });
  document.querySelectorAll(".queuer-picture-animation").forEach((picture) => {
    picture.addEventListener("mouseout", event => {
      picture.style.filter = "brightness(100%)";
      picture.nextElementSibling.firstElementChild.style.display = "none";
      picture.nextElementSibling.nextElementSibling.firstElementChild.style.display = "none";
    });
  });
}

export { queuerPicture };
