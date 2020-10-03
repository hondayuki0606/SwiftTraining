//
//  GameViewController.swift
//  testGame
//
//  Created by 本田尚行 on 2019/12/25.
//  Copyright © 2019 本田尚行. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var postImage:UIImage?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timer1: UIButton!
    @IBOutlet weak var timer10: UIButton!
    var selectedTime:Int = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func nextButton(_ sender: Any) {
        print("nextButton")
                   time.text = "test2"
    }
    
    // imageを選ぶボタン
    // ライブラリー選択ボタン
    @IBOutlet weak var libraryBtn: UIButton!
    @IBAction func toLibrary(_ sender: Any) {
        addImagePickerView()
    }
    // カメラ撮影ボタン
    @IBOutlet weak var cameraBtn: UIButton!
    @IBAction func toCamera(_ sender: Any) {
        addCameraView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func time10(_ sender: Any) {
        selectedTime += 10
              time.text = "\(selectedTime)"
    }
}
// imagePickerViewの設定用
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // カメラの利用
    func addCameraView() {

        // シミュレーターでやるとカメラが使えないから、クラッシュしないようにアラート表示させる方へ分岐
        if !UIImagePickerController.isSourceTypeAvailable(.camera){

            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)

            let okAction = UIAlertAction.init(title: "Alright", style: .default, handler: {(alert: UIAlertAction!) in
            })

            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)

        }
        else{
            //imagePickerViewを表示する
            let pickerController = UIImagePickerController()
            pickerController.sourceType = .camera
            pickerController.delegate = self
            self.present(pickerController, animated: true, completion: nil)
        }
    }

    // ライブラリーの利用
    func addImagePickerView() {
        //imagePickerViewを表示する
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        self.present(pickerController, animated: true, completion: nil)
    }

    // 以下の二つは、sourceTypeがcameraでもphotoLibraryでも共通
    // pickerの選択がキャンセルされた時の処理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }
    // 画像が選択(撮影)された時の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("The image was selected")
        print(info[UIImagePickerController.InfoKey.originalImage] as! UIImage)

        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? else {return}

        // imageを格納
        imageView.image = selectedImage

        self.dismiss(animated: true, completion: nil)
    }
}
