//
//  ViewController.swift
//  Demo(ForIn)
//
//  Created by Sin on 2023/3/9.
//

import UIKit

class ViewController: UIViewController {
    //🔴基礎排列Outlet
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var patternSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    //🟢進階排列Outlet
    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var shapeEmojiLabel: UILabel!
    @IBOutlet weak var shapeNumberLabel: UILabel!
    @IBOutlet weak var shapeSliderOutlet: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    //🔴基礎排列Action
    @IBAction func SegmentedControl(_ sender: Any) {
        //切換SegmentedControl時，全部數值歸0
        sliderOutlet.value = 0
        emojiLabel.text = "📙"
        numberLabel.text = "0"
    }
    @IBAction func slider(_ sender: UISlider) {
        
        //設定Slider與Label的關係
        sender.value = sender.value.rounded()
        let number = Int(sender.value)
        //因為value型別為Float，要轉換型別，將slider數值設為整數
        numberLabel.text = "\(number)"
        //轉換型別，將number轉為字串
        
        //先建立不同的function，在設定SegmentedControl可以直接在大括號內呼叫func
        //長方形排列（課程示範）
        func rectangle() {
            var content = ""
            for _ in 1...number {
              for _ in 1...number {
              content += "📙"
              }
              content += "\n"
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //第一排不一樣
        func line() {
            var content = ""
            for i in 1...number {
                for _ in 1...number {
                    if i == 1 {
                        content += "📘"
                    } else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
            //膝反射寫法😀失敗..
            /*for _ in 1...number {
                content += "📘"
            }
            content += "\n"
            for _ in 1...number {
              for _ in 1...number {
              content += "📙"
              }
              content += "\n"
            }*/
        }
        //對角線\
        func diagonalRight() {
            var content = ""
            for i in 1...number {
                for j in 1...number {
                    if i == j {
                        content += "📘"
                    } else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //對角線/
        func diagonalLeft() {
            var content = ""
            for i in 1...number {
                for j in 1...number {
                    if i + j == number + 1{
                        content += "📘"
                    } else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //畫X，結果只能是奇數
        func xLine() {
            var content = ""
            for i in 1...number{
                for j in 1...number{
                    if (i == j || i + j == number + 1), number % 2 != 0 {
                        content += "📘"
                    }else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //畫+，結果只能是奇數
        func cross() {
            var content = ""
            let count = (number + 1) / 2
            for i in 1...number {
                for j in 1...number {
                    if i == count || j == count, number % 2 != 0{
                        content += "📘"
                    }else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        
        //畫X，結果只能是奇數，中心點的Emoji用📗
        func crossSpecial() {
            var content = ""
            let count = (number / 2) + 1
            for i in 1...number {
                for j in 1...number {
                    if i == j, i + j == number + 1, number % 2 != 0 {
                        //i == j, i + j == number + 1, number % 2 != 0 三個條件要同時成立
                        content += "🤍"
                    }else if i == j || i + j == number + 1, number % 2 != 0{
                        //i == j || i + j == number + 1 兩個條件其中之一成立，再加上奇數條件成立
                        content += "📘"
                    }else{
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //畫外框
        func box(){
            var content = ""
            for i in 1...number{
                for j in 1...number{
                    if i == 1 || j == 1 || i == number || j == number {
                        content += "📘"
                    }else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //梅花座
        func checkerboard(){
            var content = ""
            for i in 1...number{
                for j in 1...number{
                    if (i + j) % 2 == 0 {
                        content += "📘"
                    }else {
                        content += "📙"
                    }
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        //每排顯示不同圖案
        func emojiRoles(){
            let roles = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎"]
            var content = ""
            for role in roles{
                //因為是外面的迴圈決定每一列要出現的愛心顏色，所以將array設定在外面的迴圈，role會依序存入array內的愛心
                for _ in 1...number{
                    //存入role目前呼叫到的愛心，並重複slider指定的次數
                    content += role
                }
                content += "\n"
                //記得大迴圈每跑一次就要換行一次
            }
            emojiLabel.text = content
            numberLabel.text = "\(number)"
        }
        
        //設定不同的SegmentedControl
        if patternSegmentedControl.selectedSegmentIndex == 0 {
            rectangle()
        } else if patternSegmentedControl.selectedSegmentIndex == 1 {
            line()
        } else if patternSegmentedControl.selectedSegmentIndex == 2 {
            diagonalRight()
        } else if patternSegmentedControl.selectedSegmentIndex == 3 {
            diagonalLeft()
        } else if patternSegmentedControl.selectedSegmentIndex == 4 {
            xLine()
        } else if patternSegmentedControl.selectedSegmentIndex == 5 {
            cross()
        } else if patternSegmentedControl.selectedSegmentIndex == 6 {
            crossSpecial()
        } else if patternSegmentedControl.selectedSegmentIndex == 7 {
            box()
        } else if patternSegmentedControl.selectedSegmentIndex == 8 {
            checkerboard()
        } else if patternSegmentedControl.selectedSegmentIndex == 9 {
            emojiRoles()
        }
        }
    
    //🟢進階排列Action
    
    @IBAction func shapeSegmentedControlAction(_ sender: Any) {
        //切換SegmentedControl時，全部數值歸0
        shapeSliderOutlet.value = 0
        shapeEmojiLabel.text = ""
        shapeNumberLabel.text = "0"
    }
    
    @IBAction func shapeSliderAction(_ sender: UISlider) {
        //設定Slider與Label的關係
        sender.value = sender.value.rounded()
        let count = Int(sender.value)
        //因為value型別為Float，要轉換型別，將slider數值設為整數
        shapeNumberLabel.text = "\(count)"
        //轉換型別，將number轉為字串
        
        //先建立不同的function，在設定SegmentedControl可以直接在大括號內呼叫func
        //畫直角三角形1
        func triangle1() {
            var content = ""
            for i in 1...count{
                for _ in 1...i{
                    content += "🤩"
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //畫直角三角形2
        func triangle2() {
            var content = ""
            for i in 1...count{
                for _ in i...count{
                    content += "👻"
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //畫直角三角形3
        func triangle3() {
            var content = ""
            for i in 1...count{
                for j in 1...count{
                    if i > j {
                        content += "🪣"
                    } else {
                        content += "🧽"
                    }
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //畫金字塔
        func pyramid() {
            var content = ""
            for i in 1...count{
                for _ in i..<count{
                    content += "🧯"
                }
                let number = i * 2 - 1
                for _ in 1...number{
                    content += "🔥"
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //畫三角形
        func triangle4() {
            var content = ""
            var emojiCount = 1
            for i in 1...count*2-1 {
                for _ in 1...emojiCount {
                    content += "🛸"
                }
                if i < count {
                    emojiCount += 1
                } else {
                    emojiCount -= 1
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //畫菱形
        func rhombic() {
            var content = ""
            var blowingCount = count - 1
            var bubbleCount = 1
            for i in 1...count*2-1 {
                for _ in 0..<blowingCount {
                    content += "🌬️"
                }
                for _ in 1...bubbleCount {
                    content += "🫧"
                }
                if i < count {
                    blowingCount -= 1
                    bubbleCount += 2
                } else {
                    blowingCount += 1
                    bubbleCount -= 2
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //每排不同東西
        func role() {
            let roles = ["🌕", "🌖", "🌗", "🌘", "🌑" ]
            var content = ""
            for i in 0..<count {
                let role = roles[i]
                for _ in 0...i {
                    content  += role
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
        //綜合練習
        func combo() {
            var content = ""
            let roles = ["🐚", "🦑", "🐋", "🐡", "🪸"]
            var mermaidCount = count - 1
            var roleCount = 1
            for i in 1...count*2-1 {
                for _ in 0..<mermaidCount {
                    content += "🧜🏻‍♀️"
                }
                let number = (roleCount-1) / 2
                for j in 0...number {
                    content  += roles[j]
                }
                for j in 0..<number {
                    content  += roles[number-1-j]
                }
                if i < count {
                    mermaidCount -= 1
                    roleCount += 2
                } else {
                    mermaidCount += 1
                    roleCount -= 2
                }
                content += "\n"
            }
            shapeEmojiLabel.text = content
            shapeNumberLabel.text = "\(count)"
        }
     
        //設定不同的SegmentedControl
        if shapeSegmentedControl.selectedSegmentIndex == 0 {
            triangle1()
        } else if shapeSegmentedControl.selectedSegmentIndex == 1 {
            triangle2()
        } else if shapeSegmentedControl.selectedSegmentIndex == 2 {
            triangle3()
        } else if shapeSegmentedControl.selectedSegmentIndex == 3 {
            pyramid()
        } else if shapeSegmentedControl.selectedSegmentIndex == 4 {
            triangle4()
        } else if shapeSegmentedControl.selectedSegmentIndex == 5 {
            rhombic()
        } else if shapeSegmentedControl.selectedSegmentIndex == 6 {
            role()
        } else if shapeSegmentedControl.selectedSegmentIndex == 7 {
            combo()
        }
        
    }
    
}

