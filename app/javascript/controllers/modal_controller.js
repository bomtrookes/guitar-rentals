import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["image", "gallery", "modal"]

  connect() {
    console.log("Gallery controller connected")
  }
  openGallery() {
    document.querySelector(".gallery-modal").classList.add("open")
  }
  closeGallery() {
    document.querySelector(".gallery-modal").classList.remove("open")
  }
  openReview() {
    document.querySelector(".review-modal").classList.add("open")
  }
  closeReview() {
    document.querySelector(".review-modal").classList.remove("open")
  }

}
