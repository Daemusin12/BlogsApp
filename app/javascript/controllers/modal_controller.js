import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal'];

  connect() {

  }

  openModal() {
    this.modalTarget.style.display = 'flex';
  }

  closeModal() {
    this.modalTarget.style.display = 'none';
  }
}
