//
//  DetailViewController.swift
//  flix_demo_02
//
//  Created by Aziz Alenezi on 2/15/18.
//  Copyright © 2018 Aziz Alenezi. All rights reserved.
//

import UIKit
enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var BackDropimageView: UIImageView!
    
    @IBOutlet weak var posterimageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ReleaseDateLabel: UILabel!
    
    @IBOutlet weak var overViewLabel: UILabel!
    
    var movie: [String: Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie[MovieKeys.title] as? String
            ReleaseDateLabel.text = movie["release_date"] as? String
            overViewLabel.text = movie["overview"] as? String
            let backdropPathString = movie[MovieKeys.backdropPath] as? String
            let posterPathString = movie[MovieKeys.posterPath] as? String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backdropURL = URL(string: baseURLString + backdropPathString!)!
            BackDropimageView.af_setImage(withURL: backdropURL)
            let posterPathURL = URL(string: baseURLString + posterPathString!)!
            posterimageView.af_setImage(withURL: posterPathURL)
        }
        
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
