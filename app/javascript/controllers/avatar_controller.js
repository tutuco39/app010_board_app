import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fileInput", "preview"]

  pick() { this.fileInputTarget.click() }

  preview(e) {
    const [file] = e.target.files || []
    if (!file) return
    this.previewTarget.src = URL.createObjectURL(file) // 見た目だけ更新
  }
}
