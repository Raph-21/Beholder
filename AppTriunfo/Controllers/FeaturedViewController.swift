//
//  ViewController.swift
//  AppTriunfo
//
//  Created by Raphael on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = [] //.popularMovies()
    var nowPlayingMovies: [Movie] = [] //.nowPlayingMovies()
    var upcomingMovies: [Movie] = [] //.upcomingMovies()
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var playingCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        playingCollectionView.dataSource = self
        playingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        Task {
            nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.playingCollectionView.reloadData()
            
        }
        
        Task {
            upcomingMovies = await Movie.upcomingAPI()
            self.upcomingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
        
    }
    
}
