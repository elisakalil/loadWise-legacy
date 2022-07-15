//
//  PDFCreator.swift
//  powerScale
//
//  Created by Elisa Kalil on 15/07/22.
//

import Foundation
import PDFKit

class PDFCreator {
    
    func createPdfFromView(aView: UIView, saveToDocumentsWithFileName fileName: String) {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil)
        UIGraphicsBeginPDFPage()

        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }

        aView.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()

        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName = documentDirectories + "/" + fileName
            debugPrint(documentsFileName)
            pdfData.write(toFile: documentsFileName, atomically: true)
        }
    }
}

