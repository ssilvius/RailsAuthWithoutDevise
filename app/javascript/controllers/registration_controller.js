import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "error"]

  handleSubmit(event) {
    const [data, status, xhr] = event.detail
    
    if (status === 422) { // Unprocessable Entity
      const errors = JSON.parse(xhr.response)
      this.clearErrors()
      this.showErrors(errors)
    } else {
      this.clearErrors()
    }
  }

  clearErrors() {
    this.errorTargets.forEach(errorElement => {
      errorElement.textContent = ""
      errorElement.classList.add('hidden')
    })
    this.inputTargets.forEach(inputElement => {
      inputElement.classList.remove('border-red-500')
    })
  }

  showErrors(errors) {
    Object.keys(errors).forEach(field => {
      const inputElement = this.inputTargets.find(el => el.dataset.field === field)
      const errorElement = this.errorTargets.find(el => el.dataset.field === field)
      
      if (inputElement && errorElement) {
        inputElement.classList.add('border-red-500')
        errorElement.textContent = errors[field].join(', ')
        errorElement.classList.remove('hidden')
      }
    })
  }
}