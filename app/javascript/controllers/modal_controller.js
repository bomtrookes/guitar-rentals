import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["image", "gallery", "modal"]

  connect() {
    console.log("Modal controller connected")
    this.setDate();
    this.bookingUpdate();
    const startDateInput = document.querySelector('#booking_start_date');
    const endDateInput = document.querySelector('#booking_end_date');
    startDateInput.addEventListener('change', this.bookingUpdate.bind(this));
    endDateInput.addEventListener('change', this.bookingUpdate.bind(this));
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

  bookingUpdate() {
    const startDateInput = document.querySelector('#booking_start_date');
    const endDateInput = document.querySelector('#booking_end_date');
    const totalCostDiv = document.querySelector('#total-cost');
    const costPerNight = document.querySelector('#cost').textContent;
    console.log("booking updated trigger")
    const calculateTotalCost = () => {
      const startDate = new Date(startDateInput.value);
      const endDate = new Date(endDateInput.value);
      const nights = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24));
      const totalCost = nights * parseInt(costPerNight.slice(1));
      totalCostDiv.innerHTML = `Total Cost: £${totalCost.toFixed(2)}`;
    };
    calculateTotalCost();
    startDateInput.addEventListener('change', calculateTotalCost);
    endDateInput.addEventListener('change', calculateTotalCost);
  }

  setDate() {
    console.log("firing setDate");
    const today = new Date();
    const formattedDate = today.toISOString().slice(0,10);
    const tomorrow = new Date(today);
    tomorrow.setDate(today.getDate() + 1);
    const formattedTomorrow = tomorrow.toISOString().slice(0,10);
    document.getElementById("booking_start_date").value = formattedDate;
    document.getElementById("booking_end_date").value = formattedTomorrow;
  }

}
