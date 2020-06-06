
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var library:FilmLibrary? {
        didSet {
            label.text = library?.name
            if let image = library?.imageName  {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
