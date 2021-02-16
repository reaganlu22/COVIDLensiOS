//
//  DocumentationVM.swift
//  COVID Lens
//
//  Created by aronm on 2/16/21.
//

import Foundation
import QuickLook

let previewController = QLPreviewController()
    previewController.dataSource = self
    present(previewController, animated: true)
func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
    return 3
}
