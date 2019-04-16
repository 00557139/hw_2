//
//  ViewController.swift
//  hw
//
//  Created by User15 on 2019/4/15.
//  Copyright © 2019 User15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tem_label.text=String(30)
        hum_label.text=String(50)
        wind_label.text=String(0)
        tem_input.text=String(30)
        hum_input.text=String(50)
        wind_input.text=String(0)
        ans.text=String(33.63)
        pic.image=UIImage(named:"pic_1")
        describe.text=""
        level.isHidden=true
        p_4.isHidden=true
    }
    var k=false
    @IBOutlet weak var tem_label: UILabel!
    @IBOutlet weak var tem_sli: UISlider!
    @IBOutlet weak var tem_input: UITextField!
    
    @IBOutlet weak var hum_label: UILabel!
    @IBOutlet weak var hum_sli: UISlider!
    @IBOutlet weak var hum_input: UITextField!
    
    @IBOutlet weak var wind_label: UILabel!
    @IBOutlet weak var wind_sli: UISlider!
    @IBOutlet weak var wind_input: UITextField!
    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var describe: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var p_4: UIImageView!
    @IBOutlet weak var the_k: UISwitch!
    
    
    @IBAction func change_tem(_ sender: UISlider) {
        tem_label.text=String(format:"%.2f", sender.value)
        tem_input.text=String(format:"%.2f", sender.value)
    }
    @IBAction func key_off_tem(_ sender: Any) {
        tem_sli.value=Float(tem_input.text!)!
        tem_label.text=tem_input.text
    }
    @IBAction func change_hum(_ sender: UISlider) {
        hum_label.text=String(format:"%.2f", sender.value)
        hum_input.text=String(format:"%.2f", sender.value)
    }
    @IBAction func key_off_hum(_ sender: Any) {
        hum_sli.value=Float(hum_input.text!)!
        hum_label.text=hum_input.text
    }
    @IBAction func change_wind(_ sender: UISlider) {
        wind_label.text=String(format:"%.2f", sender.value)
        wind_input.text=String(format:"%.2f", sender.value)
    }
    @IBAction func key_off_wind(_ sender: Any) {
        wind_sli.value=Float(wind_input.text!)!
        wind_label.text=wind_input.text
    }
    @IBAction func calculate(_ sender: UIButton) {
        if k==false{
        level.isHidden=false
        ans.text=String(format:"%.2f",1.07*Double(tem_label.text!)!+0.2*((Double(hum_label.text!)!/100)*6.105*exp((17.27*Double(tem_label.text!)!)/(237.7+Double(tem_label.text!)!)))-0.65*Double(wind_label.text!)!-2.7)
        if Double(ans.text!)!<38.0 && Double(ans.text!)!>10.0{
            pic.image=UIImage(named:"pic_5")
            if Double(ans.text!)!>27.0{
                level.text="hot"
                describe.text=""
            }
            else if Double(ans.text!)!<=27.0 && Double(ans.text!)!>15.0{
                level.text="cool"
                if Double(ans.text!)!<=20.0{
                    describe.text=""
                }
            }
            else{
                level.text="cold"
                describe.text=""
            }
        }
        else if Double(ans.text!)!>=38.0{
            pic.image=UIImage(named:"pic_2")
            level.text="very hot"
            describe.text=""
        }
        else{
            pic.image=UIImage(named:"pic_3")
            level.text="very cold"
            if Double(ans.text!)!>5.0{
                describe.text="俄國人在外頭種小黃瓜"
            }
            else if Double(ans.text!)!<=5.0 && Double(ans.text!)!>0.0{
                describe.text="義大利車發動不了"
            }
            else if Double(ans.text!)!<=0.0 && Double(ans.text!)!>(-20.0){
                describe.text="俄國人進行換季前最後一次野餐"
            }
            else if Double(ans.text!)!<=(-20.0) && Double(ans.text!)!>(-25.0){
                describe.text="美國車發動不了"
            }
            else if Double(ans.text!)!<=(-25.0) && Double(ans.text!)!>(-35.0){
                describe.text="德國車發動不了"
            }
            else if Double(ans.text!)!<=(-35.0) && Double(ans.text!)!>(-40.0){
                describe.text="日本車發動不了"
            }
            else if Double(ans.text!)!<=(-40.0) && Double(ans.text!)!>(-60.0){
                describe.text="俄國人正邊逛街邊吃冰淇淋"
            }
            else if Double(ans.text!)!<=(-60.0) && Double(ans.text!)!>(-80.0){
                describe.text="酒精結冰了，俄國人很不爽"
            }
            else if Double(ans.text!)!<=(-80.0) && Double(ans.text!)!>=(-250.0){
                describe.text="俄國人開始穿上長靴"
            }
            }}
    }
    @IBAction func display(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0 {
            p_4.isHidden=true
        }
        else {
            p_4.isHidden=false
        }
    }
    @IBAction func pic_turn_on(_ sender: UISwitch) {
        if sender.isOn==true {
            ans.text="0 k"
            describe.text="俄國足球隊贏得世界冠軍"
            pic.image=UIImage(named:"pic_3")
            k=true
        }
        else{k=false}
    }
}

