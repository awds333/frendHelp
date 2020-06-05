import UIKit

class ViewController: UIViewController {

    let switcher = UISwitch()
    let label = UILabel()
    let imageView = UIImageView()
    let dayImage = UIImage(named: "rogozenko_day.jpg")
    let nightImage = UIImage(named: "rogozenko_night.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImageView()
        createLabel()
        createSwitcher()
    }
    
    func createImageView() {
        imageView.image = dayImage
        imageView.frame = self.view.bounds
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
    }

    func createLabel() {
        label.frame = CGRect(x: (self.view.bounds.maxX / 2) - 130, y: 20, width: 260, height: 50)
        self.label.text = "Background image: rogozenko_day.jpg"
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
    }
    
    func createSwitcher() {
        switcher.frame = CGRect(x: (self.view.bounds.maxX / 2) - 25, y: 85, width: 0, height: 0)
        switcher.addTarget(self, action: #selector(changeBackgroundImage), for: .allEvents)
        view.addSubview(switcher)
    }
    
    @objc func changeBackgroundImage() {
        if switcher.isOn {
            self.imageView.image = nightImage
            self.label.text = "Background image: rogozenko_night.jpg"
            self.label.textColor = .white
        } else {
            self.imageView.image = dayImage
            self.label.text = "Background image: rogozenko_day.jpg"
            self.label.textColor = .black
        }
    }
}

