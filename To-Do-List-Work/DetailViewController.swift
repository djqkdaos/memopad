//
//  DetailViewController.swift
//  To-Do-List-Work
//
//  Created by amadeus on 2017. 6. 8..
//  Copyright © 2017년 DIT Apps. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detail_title: UILabel!
    @IBOutlet weak var detail_date: UILabel!
    @IBOutlet weak var detail_img: UIImageView!
    @IBOutlet weak var detaillabeltext: UILabel!
    var memodata: String?
    var memodate: String?
    var meemotitle: String?
    var memoimg: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        detaillabeltext.text = memodata
        detail_title.text = meemotitle
        title = meemotitle
        detail_img.image = UIImage(named:memoimg!)
        detail_date.text = memodate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
