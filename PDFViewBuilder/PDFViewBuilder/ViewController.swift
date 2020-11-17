//
//  ViewController.swift
//  PDFViewBuilder
//
//  Created by Komrska, Jack on 11/16/20.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    @IBOutlet weak var PDFSubView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadPDFTemplate()
    }
    @IBAction func loadPDF(_ sender: Any) {
        
    }
    
    @IBAction func sharePDF(_ sender: Any) {
        
    }
    
    func loadPDFTemplate()
    {
        let pdfView = PDFView()

        pdfView.frame = CGRect(x: 0, y: 0, width: self.PDFSubView.bounds.maxX, height: self.PDFSubView.bounds.maxY)
        pdfView.autoScales = true
        
        guard let path = Bundle.main.url(forResource: "Furlough FAQ", withExtension: "pdf") else { return }

        if let document = PDFDocument(url: path) {
            pdfView.document = document
            let numOfPages = document.pageCount
            for page in 0..<numOfPages
            {
                placeTextField(document: document, pageNum: page, text: "Testing Page Number: \(page+1)")
            }
        }
        
        PDFSubView.addSubview(pdfView)
    }
    
    func placeTextField(document: PDFDocument, pageNum: Int, text: String) -> PDFDocument
    {
        document.page(at: pageNum)?.addAnnotation(createTextAnnotation(text: text))
        return document
    }
    
    func createTextAnnotation(text: String) -> PDFAnnotation
    {
        let newAnnotation = PDFAnnotation(bounds: CGRect(x: 10, y: 10, width: 70, height: 60), forType: .freeText, withProperties: nil)
        newAnnotation.contents = text
        newAnnotation.font = UIFont.systemFont(ofSize: 15.0)
        newAnnotation.fontColor = .white
        newAnnotation.color = .blue
        
        return newAnnotation
    }
}
