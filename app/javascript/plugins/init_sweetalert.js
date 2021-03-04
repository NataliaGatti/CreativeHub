// import swal from 'sweetalert';

// const initSweetalert = (selector, options = {}) => {
//   const swalButton = document.querySelector(selector);
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal(options);
//     });
//   }
// };

// export { initSweetalert };



import swal from 'sweetalert';
const sleep = (delay) => new Promise((resolve) => setTimeout(resolve, delay))

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  const description = document.getElementById("postulation_description");
  const file = document.getElementById("postulation_file");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      if (description.value.length > 49 && file.value.length > 0) {
        swal(options).then(callback); // <-- add the `.then(callback)`
      
      }; 
    });
  }
};

export { initSweetalert};

