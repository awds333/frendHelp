//
//  MenuController.swift
//  Task2.1
//
//  Created by Pavel Bandiuk on 22.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemFilmArray: [FilmLibrary] =
    {
        var filmsMenu = FilmLibrary()

        filmsMenu.name = NSLocalizedString("Pirates of the caribbean sea", comment: "")
        filmsMenu.imageName = "pirates.jpg"
        filmsMenu.descriptonFLabel = "Adventure film about pirates, which takes place in the Caribbean in the first half of the XVIII century. The film was directed by Gore Verbinsky and produced by Jerry Bruckheimer. The idea of ​​the painting came to the creators impressed by the eponymous thematic water attraction in Disneyland."
        filmsMenu.descriptionSLabel = "This is the first Walt Disney Pictures movie to receive a PG-13 rating (“Some content may be a little unsuitable for children under 13 years old”) from MPAA. The official Russian age rating of the film is 12+. The film premiered in Russia on August 22, 2003."
        
        var filmsMenu2 = FilmLibrary()
        filmsMenu2.name = NSLocalizedString("Extraction", comment: "")
        filmsMenu2.imageName = "Эвакуация.jpg"
        filmsMenu2.descriptonFLabel = "Mercenary Tyler Reik instructed to release the son of an international criminal. The boy is a pawn in the war of two drug lords, and he is held hostage in the city of Dhaka, the capital of Bangladesh and one of the most impregnable places in the world."
        filmsMenu2.descriptionSLabel = "The most exciting film in 2019"
        
        var filmsMenu3 = FilmLibrary()
        filmsMenu3.name = NSLocalizedString("Winter", comment: "")
        filmsMenu3.imageName = "Winter.jpeg"
        filmsMenu3.descriptonFLabel = "On the way home in a strange city, Alexander and his father are seriously injured by drunken juvenile delinquents. The father dies, and Alexander becomes a dangerous witness, which must be eliminated. He is forced to start the persecution himself and very soon turns from a victim into a cold-blooded hunter."
        
        filmsMenu3.descriptionSLabel = "This film has many tricks"
        
        
        return [filmsMenu, filmsMenu2, filmsMenu3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailVC") {
            if let vc = segue.destination as? DetailViewController {
                let library = sender as? FilmLibrary
                vc.filmLibrary = library
            }
        }
    }
    
}

extension MenuController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 350, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemFilmArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainCollectionViewCell {
            itemCell.library = itemFilmArray[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let library = itemFilmArray[indexPath.row]
        self.performSegue(withIdentifier: "detailVC", sender: library)
    }
    
    
}
