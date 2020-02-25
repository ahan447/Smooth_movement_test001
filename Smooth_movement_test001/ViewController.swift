//
//  ViewController.swift
//  Smooth_movement_test001
//
//  Created by tjoeun304 on 2020/02/25.
//  Copyright © 2020 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    //물체가 도달할 목표 지점
    var targetX:CGFloat=52
    var targetY:CGFloat=132
    
    @IBAction func btnClick(_ sender: Any) {
        move()
    }
    
    @IBAction func btnClick2(_ sender: Any) {
        }
    //물체를 감속도로 이동시키는 메소드
    @objc func move(){
        //한꺼번에 400에 도달하지 말고
        //조금씩 도달해보자 ( =감속도 공식)
        //imgView.frame.origin.x = imgView.frame.origin.x + 0.1*(목표지점 - 현재 나의 위치)
        //x 좌표 지정
        imgView.frame.origin.x = imgView.frame.origin.x+0.0003*(targetX-imgView.frame.origin.x)
           
        //y 좌표 지정
        imgView.frame.origin.y = imgView.frame.origin.y+0.0003*(targetY-imgView.frame.origin.y)
              
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //일정 시간 간격으로 호출
               Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(move), userInfo: nil, repeats: true)
        
        
        //view에 터치 이벤트 구현
        let gesture = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        
        self.view.addGestureRecognizer(gesture)
          
    }
    //targetX,targetY의 값을 터치 좌표값으로 바꿈
    @objc func getPoint(sender:UITapGestureRecognizer){
        let point =  sender.location(in: self.view)
        targetX = point.x
        targetY = point.y
        
    }


}

