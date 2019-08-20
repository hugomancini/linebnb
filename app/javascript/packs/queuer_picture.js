const queuerPicture = () => {
  document.querySelectorAll(".queuer-picture-animation").forEach((picture) => {
    picture.addEventListener("mouseover", event => {
      picture.style.opacity = "0.7";
      picture.nextElementSibling.firstElementChild.style.display = "block";
      picture.nextElementSibling.nextElementSibling.firstElementChild.style.display = "block";
    });
  });
  document.querySelectorAll(".queuer-picture-animation").forEach((picture) => {
    picture.addEventListener("mouseout", event => {
      picture.style.opacity = "1";
      picture.nextElementSibling.firstElementChild.style.display = "none";
      picture.nextElementSibling.nextElementSibling.firstElementChild.style.display = "none";
    });
  });
}

export { queuerPicture };
