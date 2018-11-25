function outputMenus() {
    let menus_section = document.getElementById("menus") 
    if (menus_section) {
        // console.log("start")
      let xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let menus = JSON.parse(this.responseText);
            let output = "";
            for(let i=0; i < menus.length; i++) {
                output += `<tr>
                             <td><img src="${menus[i].photo_url}" width="200" height="200"></img></td>
                             <td>${menus[i].name}</td>
                             <td>${menus[i].price}</td>
                             <td><input type="text" data-menu_item_id="${menus[i].id}" /></td>
                             <td><button class="addToCartButton">Add to Cart</button></td>
                          </tr>`
            }
            menus_section.innerHTML = output;
            addEventToButtons()
      }
    };
    xhttp.open("GET", "api/menus", true);
    xhttp.send();
    }
}

function addToCart(ele) {
    let data = new FormData();
    let target = ele.parentElement.previousElementSibling.firstElementChild
    let quantity = target.value
    let menu_id = target.getAttribute("data-menu_id")
    if (quantity) {
      data.append('quantity', quantity);
      data.append('menu_id', menu_id);
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'api/menus', true);
       
      // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
      xhr.onload = function () {
          console.log(this.status);
          let result = JSON.parse(this.responseText);
          var node = document.createElement("P");     
          node.classList = ["notice_message"];
          var textnode = document.createTextNode(result.notice); 
          node.appendChild(textnode);
          document.getElementById("flash_messages").appendChild(node); 
          window.scrollTo(0, 0);
          target.value = "";
      };
      xhr.send(data);
    }
}

function addEventToButtons() {
  let buttons = document.getElementsByClassName("addToCartButton");
  for(let i=0; i < buttons.length; i++) {
      buttons[i].addEventListener("click", function() {
          addToCart(buttons[i]);
      });
  }
}

document.addEventListener("DOMContentLoaded", function(event) {
    // Your code to run since DOM is loaded and ready
    outputMenus();
});