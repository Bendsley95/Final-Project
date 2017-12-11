//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Shannon, Leandre D. (MU-Student) on 11/9/17.
//  Copyright © 2017 Shannon, Leandre D. (MU-Student). All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    var inputVal: String = ""
    var outputVal: String = ""
    var converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    var currentConverter: Converter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputVal = ""
        outputVal = ""
        inputDisplay.text = converters[0].inputUnit
        outputDisplay.text = converters[0].outputUnit
        currentConverter = converters[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        for conv in converters {
            alert.addAction(UIAlertAction(title: conv.label, style: UIAlertActionStyle.default, handler: { (alertAction) in
                self.inputDisplay.text = conv.inputUnit
                self.outputDisplay.text = conv.outputUnit
                self.currentConverter = conv
            }))
        }
        
        self.present(alert, animated:true, completion: nil)
    }
    
    @IBAction func buttonSelection(_ sender: UIButton) {
        
        switch sender.tag {
        case 0...9:
            inputVal += String(sender.tag)
            convert()
        case -1:
            inputDisplay.text = currentConverter!.inputUnit
            outputDisplay.text = currentConverter!.outputUnit
            inputVal = ""
            outputVal = ""
        case -2:
            var input: Double? = Double(inputVal)
            if input != nil {
                input = input! * -1
                inputVal = String(input!)
            }
            inputDisplay.text = inputVal + currentConverter!.inputUnit
            convert()
        case -3:
            if(inputVal.range(of: ".") != nil)
            {
                break
            }
            else
            {
                inputVal += "."
                inputDisplay.text = inputVal + currentConverter!.inputUnit
            }
            
        default:
            inputDisplay.text = inputDisplay.text
        }
        inputDisplay.text = inputVal + currentConverter!.inputUnit
        outputDisplay.text = outputVal + currentConverter!.outputUnit
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func convert()
    {
        let castInput:Double? = Double(inputVal)
        var out:Double
        switch currentConverter!.label {
        case "fahrenheit to celcius":
            out = (castInput! - 32) * (5/9)
            outputVal = String(out)
        case "celcius to fahrenheit":
            out = (castInput! * (9/5)) + 32
            outputVal = String(format: "%.2f", out)
        case "miles to kilometers":
            out = (castInput! * 1.60934)
            outputVal = String(format: "%.2f", out)
        case "kilometers to miles":
            out = (castInput! / 1.60934)
            outputVal = String(format: "%.2f", out)
        default:
            inputDisplay.text = inputDisplay.text
            outputDisplay.text = outputDisplay.text
        }
    }

}
