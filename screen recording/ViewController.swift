//
//  ViewController.swift
//  screen recording
//
//  Created by Shubham on 04/08/21.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    let record = RPScreenRecorder.shared()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func START(_ sender: Any) {
        record.startRecording { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    @IBOutlet weak var recordingtime: UILabel!
    
    @IBAction func STOP(_ sender: Any) {
        
        record.stopRecording { ( presentdata ,error ) in
            if let presentdata = presentdata {
                print(presentdata.accessibilityPath)
                presentdata.previewControllerDelegate = self
                self.present( presentdata,animated: true,completion: nil )
            }
        
            if let error = error {
                print(error)
            }
        }
    }
    
}


extension ViewController:RPPreviewViewControllerDelegate{
    func previewController(_ previewController: RPPreviewViewController, didFinishWithActivityTypes activityTypes: Set<String>) {
        dismiss(animated: true, completion: nil)
    }
  
}
