//
//  ViewController.swift
//  dfgdf
//
//  Created by Rutul Desai on 1/21/20.
//  Copyright © 2020 Rutul Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horizontalStackView: UIStackView!
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var operation:Int = 0;
    var performMath:Bool = false;
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var verticalStackView: UIStackView!
    
    @IBAction func buttons(_ sender: UIButton) {
        if  label.text != "" && sender.tag != 11 && sender.tag != 16
            {
                previousNumber = Double(label.text!)!;
                if sender.tag == 12
                {
                    label.text = "/";
                    
                }
                else if sender.tag == 13
                {
                    label.text = "*";
                    
                }
                else if sender.tag == 14
                {
                    label.text = "-";
                }
                else if sender.tag == 15
                {
                    label.text = "+";
                }
                else if sender.tag == 17
                {
                    label.text = "+";
                }
                else if sender.tag == 18
                {
                    label.text = "%";
                }
                
                operation = sender.tag;
                performMath = true;
            }
            else if(sender.tag == 16)
            {
                if(operation == 12)
                {
                    label.text = String(previousNumber/numberOnScreen);
                }
                else if(operation == 13)
                {
                    label.text = String(previousNumber*numberOnScreen);
                }
                else if(operation == 14)
                {
                    label.text = String(previousNumber-numberOnScreen);
                }
                else if(operation == 15)
                {
                    label.text = String(previousNumber+numberOnScreen);
                }
                else if(operation == 17)
                {
                    label.text = String(previousNumber+numberOnScreen);
                }
                else if(operation == 18)
                {
                    label.text = String(previousNumber.truncatingRemainder(dividingBy: numberOnScreen));
                }
            }
            else if(sender.tag == 11)
            {
                label.text = "";
                numberOnScreen = 0;
                previousNumber = 0;
                operation = 0;
            }
    }
    @IBAction func numbers(_ sender: UIButton) {
        if(performMath == true)
        {
            label.text = String(sender.tag-1);
            numberOnScreen = Double(label.text!)!;
            performMath = false;
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalStackView.isHidden = true;
        // Do any additional setup after loading the view.
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        var text=""
        switch UIDevice.current.orientation{
        case .portrait:
            text="Portrait"
            horizontalStackView.isHidden = true;
        case .portraitUpsideDown:
            text="PortraitUpsideDown"
            horizontalStackView.isHidden = true;
        case .landscapeLeft:
            text="LandscapeLeft"
            horizontalStackView.isHidden = false;
        case .landscapeRight:
            text="LandscapeRight"
            horizontalStackView.isHidden = false;
        default:
            text="Another"
        }
        NSLog("You have moved: \(text)")
    }


}

