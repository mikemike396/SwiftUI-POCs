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
    var document = PDFDocument()
    var fileName = String()
    var pathToFile = URL(string: "")
    var passedInFileName = "pdfTemplate"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPDFTemplate()
    }
    
    @IBAction func loadPDF(_ sender: Any) {
        print("test")
    }
    
    @IBAction func sharePDF(_ sender: Any) {
        let actualPath = pathToFile!.appendingPathComponent(fileName)
        let pdfData = actualPath
        let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
    
    //ensures the file is in the right spot
    func showSavedPDF(url: URL, fileName: String)
    {
        do {
            let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
            for url in contents {
                if url.description.contains("\(fileName).pdf"){
                    print("URL: \(url)")
                    break
                }
            }
        } catch {
            print("Could not locate pdf file")
        }
    }
    
    //saving the pdf to the document directory
    func savePDF(url: URL, fileName: String)
    {
        let pdfData = try? Data.init(contentsOf: url)
        let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        let pdfNameFromUrl = "CCC-\(fileName).pdf"
        let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
        do {
            try pdfData?.write(to: actualPath, options: .atomic)
            print("PDF successfully saved!")
        } catch {
            print("PDF could not be saved")
        }
    }
    
    // the "main" for this file
    func loadPDFTemplate()
    {
        let pdfView = PDFView()

        pdfView.frame = CGRect(x: 0, y: 0, width: self.PDFSubView.bounds.maxX, height: self.PDFSubView.bounds.maxY)
        pdfView.autoScales = true
        
        guard let path = Bundle.main.url(forResource: passedInFileName, withExtension: "pdf") else { return }
        
        pathToFile = path
        fileName = passedInFileName
        
        document = PDFDocument(url: path)!
        
        if document != PDFDocument() {
            pdfView.document = document
            
            
            let numOfPages = document.pageCount
            for page in 0..<numOfPages
            {
                placeTextField(document: document, pageNum: page, text: "Testing Page Number: \(page+1)", path: path)
            }
            
            savePDF(url: pathToFile!, fileName: fileName)
        }
        showSavedPDF(url: pathToFile!, fileName: fileName)
        
        PDFSubView.addSubview(pdfView)
    }
    
    //writing the annotation to the document
    func placeTextField(document: PDFDocument, pageNum: Int, text: String, path: URL) -> PDFDocument
    {
        document.page(at: pageNum)?.addAnnotation(createTextAnnotation(text: text))
        document.write(to: path)
        return document
    }
    
    //creating the annotation
    func createTextAnnotation(text: String) -> PDFAnnotation
    {
        let newAnnotation = PDFAnnotation(bounds: CGRect(x: 10, y: 10, width: 70, height: 60), forType: .freeText, withProperties: nil)
        newAnnotation.contents = text
        newAnnotation.font = UIFont.systemFont(ofSize: 15.0, weight: .thin)
        newAnnotation.fontColor = .cyan
        newAnnotation.color = .red
        
        return newAnnotation
    }
}
