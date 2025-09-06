import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "form"]

  pick() {
    if (this.hasInputTarget) {
      this.inputTarget.click()   // ← クリックで file input を開く
    }
  }

  preview(event) {
    const file = event.target.files && event.target.files[0]
    if (!file) return

    // 即時プレビュー
    const url = URL.createObjectURL(file)
    if (this.hasPreviewTarget) {
      this.previewTarget.src = url
    }

    // 自動送信
    if (this.hasFormTarget) {
      this.formTarget.requestSubmit()
    }
  }
}
