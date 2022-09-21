package com.example.uni_pdf

import com.example.uni_pdf.pdfview.PdfValidationResult
import com.example.uni_pdf.pdfview.PdfValidator
import java.io.File

fun isPdfEncrypted(path:String) :Boolean{
    val file = File("$path")
    return  PdfValidator.isPasswordProtected(file)
}

fun isPasswordCorrect(path: String,password:String):Boolean{
    val file = File(path)
    return PdfValidator.validate(file,password)== PdfValidationResult.VALID
}

