// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("click", function(event) {
  if (event.target.matches("#delete-link a")) {
    event.preventDefault();
    var url = event.target.href;
    if (confirm("Are you sure?")) {
      var xhr = new XMLHttpRequest();
      xhr.open("DELETE", url);
      xhr.setRequestHeader("Content-Type", "application/json");
      xhr.onload = function() {
        if (xhr.status === 200) {
          var data = JSON.parse(xhr.responseText);
          // Handle success response
        } else {
          // Handle error response
        }
      };
      xhr.send();
    }
  }
});
