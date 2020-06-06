import UIKit

class DetailViewController: UIViewController
{

     var filmLibrary: FilmLibrary?
    
    @IBOutlet weak var imageView: UIImageView!
        {
        didSet {
            guard let image = filmLibrary?.imageName else {return}
            imageView.image = UIImage(named: image)
            }
    }
    
   
    
    @IBOutlet weak var titleLabel: UILabel!
        {
        didSet {
        titleLabel.text = filmLibrary?.name
        }
    }
    @IBOutlet weak var timeLabel: UILabel!
        {
        didSet {
            timeLabel.text! += (filmLibrary?.descriptonFLabel)!
        }
    }
    
    @IBOutlet weak var cotactLabel: UILabel! 
    
    @IBOutlet weak var directorLabel: UILabel!
        {
        didSet {
           directorLabel.text! += (filmLibrary?.descriptionSLabel)!
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
