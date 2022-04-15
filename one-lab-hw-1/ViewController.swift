//
//  ViewController.swift
//  one-lab-hw-1
//
//  Created by aya on 14.04.2022.
//

/*import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}*/
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var priorityOptions = ["None", "!", "!!", "!!!"]
    private lazy var graySpaceView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GrayBackgroundColor")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor

        return view
    }()
    
    private lazy var graySpaceView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GrayBackgroundColor")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private lazy var graySpaceView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GrayBackgroundColor")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private lazy var graySpaceView4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "GrayBackgroundColor")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.tintColor, for: .normal)
        return button
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        return button
    }()
    
    private lazy var createLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Reminder"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "  Get Groceries"
        return label
    }()
    
    private lazy var remindLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Remind me on a day"
        return label
    }()
    
    private lazy var remindSwitch: UISwitch = {
        let remindSwitch = UISwitch()
        remindSwitch.onTintColor = .green
        remindSwitch.thumbTintColor = .white
        remindSwitch.backgroundColor = .white
        return remindSwitch
    }()
    
    private lazy var dateTextView: UITextField = {
        let dateTextView = UITextField()
        dateTextView.backgroundColor = .white
        dateTextView.text = formatDate(date: Date())
        dateTextView.textColor = .tintColor
        dateTextView.layer.borderWidth = 1
        dateTextView.layer.borderColor = UIColor.gray.cgColor
        return dateTextView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.backgroundColor = .white
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .wheels
    
        return picker
    }()
    
  /*  private lazy var repeatView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()*/
    
    private lazy var repeatLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Repeat"
        return label
    }()
    
    private lazy var repeatOptionsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Never >"
        return label
    }()
    
  /*  private lazy var repeatNavigationitem: UINavigationItem = {
        let navItem = UINavigationItem()
        navItem.title = "Never"
        navItem.titleView?.tintColor = UIColor(named: "GrayBackgroundColor")
        return navItem
    }()*/
    
    private lazy var remindAtLocationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Remind me at a location"
        return label
    }()
    
    private lazy var remindAtLocationSwitch: UISwitch = {
        let remindSwitch = UISwitch()
        remindSwitch.onTintColor = .green
        remindSwitch.thumbTintColor = .white
        remindSwitch.backgroundColor = .white
        return remindSwitch
    }()
    
    private lazy var priorityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Priority"
        return label
    }()
    
    private lazy var prioritySegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: priorityOptions)
        segmentedControl.layer.borderColor = UIColor.blue.cgColor
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = .blue
        return segmentedControl
    }()
    
    private lazy var notesTextField: UITextField = {
        let notes = UITextField()
        notes.text = "Notes"
        notes.backgroundColor = .white
        return notes
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControl.Event.valueChanged)
        dateTextView.inputView = datePicker
        
        prioritySegmentedControl.addTarget(self, action: #selector(priorityChanged(prioritySegmentedControl:)), for: UIControl.Event.valueChanged)
    }

    private func configureViews(){
        
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.leading).offset(10)
          //  $0.centerY.equalTo(createView.snp.centerY)
            $0.height.equalTo(40)
        }
        
        view.addSubview(createLabel)
        createLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalTo(view.snp.centerX)
          //  $0.centerY.equalTo(createView.snp.centerY)
            $0.height.equalTo(40)
        }
        
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
        //    $0.centerY.equalTo(createView.snp.centerY)
            $0.height.equalTo(40)
        }
        
       view.addSubview(graySpaceView1)
        graySpaceView1.snp.makeConstraints{
            $0.top.equalTo(cancelButton.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
       
        view.addSubview(label)
        label.snp.makeConstraints{
            $0.top.equalTo(graySpaceView1.snp.bottom)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(50)
        }
      
        view.addSubview(graySpaceView2)
        graySpaceView2.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
      
        view.addSubview(remindSwitch)
        remindSwitch.snp.makeConstraints{
            $0.top.equalTo(graySpaceView2.snp.bottom).offset(5)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(50)
        }
        
        view.addSubview(remindLabel)
        remindLabel.snp.makeConstraints{
            $0.top.equalTo(graySpaceView2.snp.bottom)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.height.equalTo(50)
        }
      
        view.addSubview(dateTextView)
        dateTextView.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading)
            $0.top.equalTo(remindLabel.snp.bottom)
            $0.height.equalTo(50)
            $0.width.equalToSuperview()
        }
        
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints{
            $0.top.equalTo(dateTextView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        view.addSubview(repeatLabel)
        repeatLabel.snp.makeConstraints{
            $0.top.equalTo(datePicker.snp.bottom)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.height.equalTo(50)
        }
        
        view.addSubview(repeatOptionsLabel)
        repeatOptionsLabel.snp.makeConstraints{
            $0.top.equalTo(datePicker.snp.bottom)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(50)
        }
        /* view.addSubview(remindView)
         remindView.snp.makeConstraints{
             $0.top.equalTo(label.snp.bottom).offset(40)
             $0.height.equalTo(40)
             $0.width.equalToSuperview()
         }*/
        
        view.addSubview(graySpaceView3)
        graySpaceView3.snp.makeConstraints{
            $0.top.equalTo(repeatLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        view.addSubview(remindAtLocationSwitch)
        remindAtLocationSwitch.snp.makeConstraints{
            $0.top.equalTo(graySpaceView3.snp.bottom).offset(5)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(50)
        }
        
        view.addSubview(remindAtLocationLabel)
        remindAtLocationLabel.snp.makeConstraints{
            $0.top.equalTo(graySpaceView3.snp.bottom)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.height.equalTo(50)
        }
        
        view.addSubview(graySpaceView4)
        graySpaceView4.snp.makeConstraints{
            $0.top.equalTo(remindAtLocationLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        view.addSubview(prioritySegmentedControl)
        prioritySegmentedControl.snp.makeConstraints{
            $0.top.equalTo(graySpaceView4.snp.bottom).offset(5)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.height.equalTo(30)
            $0.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        view.addSubview(priorityLabel)
        priorityLabel.snp.makeConstraints{
            $0.top.equalTo(graySpaceView4.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        view.addSubview(notesTextField)
        notesTextField.snp.makeConstraints{
            $0.top.equalTo(priorityLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    
    @objc func dateChanged(datePicker : UIDatePicker){
        dateTextView.text = formatDate(date: datePicker.date)
        print("date changed")
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "  EEEE, MMM d, yyyy, h:mm a"
        return formatter.string(from: date)
    }
    
    @objc func priorityChanged(prioritySegmentedControl : UISegmentedControl){
        print(priorityOptions[prioritySegmentedControl.selectedSegmentIndex])
    }
}

