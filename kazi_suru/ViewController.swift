//
//  ViewController.swift
//  kazi_suru
//
//  Created by 前川彰 on 2017/11/01.
//  Copyright © 2017 akira_maegawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    @IBOutlet weak var tableView: UITableView!
    
    var didHouseWorksNum: Int = 0
    let houseworks:[String] = ["食器洗い",
                          "洗濯",
                          "洗濯物干し",
                          "風呂掃除",
                          "掃除掛け",
                          "掃除機がけ",
                          "布団干し",
                          "台拭き",
                          "買い出し",
                          "料理"]
    
    
    private var aTableCellsHeight:CGFloat{
        get {return CGFloat(houseworks.count)*44.0}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        didHouseWorksNum = 0
        tableView.allowsMultipleSelection = true
    }
    
    // TODO: スクロール機能を実装
//    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        /**端に行った際に中央にセットしなおす*/
//        if (scrollView.contentOffset.y<=0)||(scrollView.contentOffset.y>=aTableCellsHeight*2.0) {
//            scrollView.contentOffset.y = aTableCellsHeight
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
        didHouseWorksNum += 1
        
    }
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
        didHouseWorksNum -= 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 一つのsectionの中に入れるCellの数を決める。
        
        return houseworks.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int { // sectionの数を決める
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Cellの高さを決める
        
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellの内容を決める（超重要）
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "one_row", for: indexPath)
        //ここで先ほど指定した『beginnerCell』を呼んでる。
        cell.textLabel?.text = houseworks[indexPath.row]
        
        return cell
        
    }
  
   
    
    // TODO: 画面遷移時の値受け渡し
    
//    func segueToSecondViewController() {
//        self.performSegue(withIdentifier: "toSecondViewController", sender: houseworks.count)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "resultSegue" {
//            let secondViewController = segue.destination as! ResultViewController
//            secondViewController.resultPoint = sender as! Int
//        }
//    }
    
//    @IBAction func ResultButton(_ sender: Any) {
//        prepare(for: resultSegue, sender: tableView(tableView, numberOfRowsInSection: 0))
//    }
    
    @IBAction func ResultButton(_ sender: Any) {
    }
    
    @IBAction func RoomButton(_ sender: Any) {
    }
    
    
}

