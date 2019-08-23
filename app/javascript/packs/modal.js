const listenCheck = () => {
  setTimeout(() => {
    const toggle = document.querySelector('.toggle');
    if(toggle) {
      toggle.addEventListener('click', (event) => {
        const input = document.querySelector('.checkrole');
        if(input.checked) {
          document.querySelector('.queuer').classList.remove('d-none');
          document.querySelector('.user').classList.add('d-none');
        } else {
          document.querySelector('.user').classList.remove('d-none');
          document.querySelector('.queuer').classList.add('d-none');
        }
      });
    }
  }, 1000)
};



export { listenCheck };
