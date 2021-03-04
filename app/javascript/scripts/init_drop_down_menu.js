
// $(document).ready(function() {      
//   $('.dc-menu-trigger').click(function(){
//      $('nav').toggleClass( "dc-menu-open" );
//      $('.menu-overlay').toggleClass( "open" );
//      $('header').toggleClass( "shownav" );
//   }); 
// });


const initDropDownMenu = () => {
  const dropMenuSelector = document.getElementById("drop-menu")
  const dropMenuSelectorClickabelArea = document.querySelector(".menu-overlay")
  
  const filterStatusSelector = document.querySelector(".filter-status")
  const filterStatusListSelector = document.querySelectorAll(".status-item")

  dropMenuSelectorClickabelArea.addEventListener("click", () => {
    dropMenuSelector.classList.toggle("dc-menu-open")
    dropMenuSelectorClickabelArea.classList.toggle("open")

    document.querySelector("#header").classList.toggle("shownav")

  })
  
  filterStatusListSelector.forEach(statusItem => {
    statusItem.addEventListener("click", (event) => {
      event.preventDefault()
      console.log(event.target.innerText)

      filterStatusSelector.innerText = event.target.innerText
    })
  })

}

export { initDropDownMenu }